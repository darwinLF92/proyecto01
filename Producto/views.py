from django.shortcuts import render, redirect,  get_object_or_404
from django.db import transaction
from .models import Producto, ComponenteProducto, Transaccion
from .forms import ProductoForm, ComponenteProductoForm
from django.http import JsonResponse
from django.forms import modelformset_factory

def listar_productos(request):
    producto = Producto.objects.filter(activo=True)  # Assuming 'activo' is a BooleanField in your model
    return render(request, 'Producto/listar_productos.html', {'productos': producto})


def get_productos(request):
    producto = Producto.objects.filter(activo=True).values('nombre', 'precio_compra')
    return JsonResponse(list(producto), safe=False)


def agregar_componentes(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    if request.method == 'POST':
        formset = ComponenteProductoForm(request.POST, prefix='componente')
        if formset.is_valid():
            for form in formset:
                componente_producto = form.save(commit=False)
                componente_producto.producto_principal = producto
                componente_producto.save()
            return redirect('Producto:ver_detalle_producto', producto_id=producto.id)
    else:
        formset = ComponenteProductoForm(prefix='componente', queryset=ComponenteProducto.objects.none())
    return render(request, 'Producto/agregar_componentes.html', {'producto': producto, 'formset': formset})

#para ver la lista de productos marcados como fabricacion
def listar_productos_fabricacion(request):
    productos_para_fabricacion = Producto.objects.filter(activo=True, para_fabricacion=True)
    return render(request, 'Producto/lista_productos_prod.html', {'productos': productos_para_fabricacion})


def agregar_producto(request):
    if request.method == 'POST':
        form = ProductoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('Producto:listar_productos')
        else:
            # Si el formulario de producto no es válido, muestra los errores en la misma página.
            return render(request, 'Producto/agregar_producto.html', {'form': form})
    else:
        form = ProductoForm()
        return render(request, 'Producto/agregar_producto.html', {'form': form})


def editar_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    ComponenteProductoFormSet = modelformset_factory(
        ComponenteProducto, 
        form=ComponenteProductoForm, 
        extra=0
    )
    if request.method == 'POST':
        form = ProductoForm(request.POST, instance=producto)
        componente_formset = ComponenteProductoFormSet(
            request.POST, 
            request.FILES, 
            queryset=ComponenteProducto.objects.filter(producto_principal=producto), 
            prefix='componentes'
        )
        if form.is_valid() and componente_formset.is_valid():
            form.save()
            componentes = componente_formset.save(commit=False)
            for componente in componentes:
                componente.producto_principal = producto
                componente.save()
            componente_formset.save_m2m()
            return redirect('Producto:listar_productos')
        else:
            # Manejar los errores aquí
            pass
    else:
        form = ProductoForm(instance=producto)
        componente_formset = ComponenteProductoFormSet(
            queryset=ComponenteProducto.objects.filter(producto_principal=producto), 
            prefix='componentes'
        )

    context = {
        'form': form,
        'componente_formset': componente_formset,
        'producto': producto
    }
    return render(request, 'Producto/editar_producto.html', context)

# Puedes agregar vistas similares para agregar_componentes, editar_producto, etc.
def eliminar_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    producto.activo = False  # Suponiendo que tienes un campo "activo" en el modelo Producto
    producto.save()
    return redirect('Producto:listar_productos')


@transaction.atomic  # Asegura que las operaciones sean atómicas
def aumentar_stock(request, producto_id):
    producto_principal = get_object_or_404(Producto, id=producto_id)
    if producto_principal.para_fabricacion:  # Asegúrate de que este campo exista en tu modelo Producto
        if request.method == 'POST':
            cantidad_a_fabricar = int(request.POST.get('cantidad', 0))  # Asegúrate de validar este valor correctamente.
            
            # Inicia una lista para controlar si todos los componentes tienen stock suficiente
            componentes_insuficientes = []

            # Verifica si hay suficientes componentes para la cantidad a fabricar
            for componente in ComponenteProducto.objects.filter(producto_principal=producto_principal):
                if componente.cantidad * cantidad_a_fabricar > componente.producto_componente.stock:
                    componentes_insuficientes.append(componente.producto_componente.nombre)
            
            if not componentes_insuficientes:
                # Actualiza el stock del producto principal
                producto_principal.stock += cantidad_a_fabricar
                producto_principal.save()

                # Disminuir la cantidad de materia prima
                for componente in ComponenteProducto.objects.filter(producto_principal=producto_principal):
                    producto_componente = componente.producto_componente
                    producto_componente.stock -= componente.cantidad * cantidad_a_fabricar
                    producto_componente.save()

                # Registra la transacción
                Transaccion.objects.create(
                    producto=producto_principal,
                    cantidad=cantidad_a_fabricar,
                    # La fecha de registro se añade automáticamente con auto_now_add=True en el modelo
                )

                return redirect('Producto:listar_productos_fabricacion')
            else:
                # Manejar la falta de componentes mostrando un mensaje al usuario
                # Podrías añadir un mensaje al contexto para informar qué componentes no tienen stock suficiente
                return render(request, 'Producto/aumentar_stock.html', {
                    'producto': producto_principal,
                    'error': f"No hay suficiente stock para los componentes: {', '.join(componentes_insuficientes)}."
                })

        return render(request, 'Producto/aumentar_stock.html', {'producto': producto_principal})
    else:
        # Si el producto no es fabricable, redireccionar o mostrar un mensaje de error
        return redirect('Producto:listar_productos')
    
    
def ver_detalle_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    componentes = ComponenteProducto.objects.filter(producto_principal=producto).select_related('producto_componente')
    
    # Crear una lista de componentes con su nombre y la cantidad necesaria para la fabricación del producto
    lista_componentes = [
        {
            'nombre': componente.producto_componente.nombre,
            'cantidad_necesaria': componente.cantidad,
            'stock_actual': componente.producto_componente.stock
        }
        for componente in componentes
    ]

    context = {
        'producto': producto,
        'componentes': lista_componentes
    }

    return render(request, 'Producto/ver_detalle_producto.html', context)