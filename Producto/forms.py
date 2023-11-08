from django import forms
from .models import Producto, ComponenteProducto

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = ['codigo', 'nombre', 'descripcion', 'precio_compra', 'precio_venta', 'stock', 'tiene_descuento' ,'para_fabricacion']


class ComponenteProductoForm(forms.ModelForm):
    class Meta:
        model = ComponenteProducto
        fields = ['producto_componente', 'cantidad']

    def __init__(self, *args, **kwargs):
        super(ComponenteProductoForm, self).__init__(*args, **kwargs)
        self.fields['producto_componente'].queryset = Producto.objects.filter(activo=True)

class ProductoPrincipalForm(forms.Form):
    producto_principal = forms.ModelChoiceField(
        queryset=Producto.objects.filter(activo=True),  # Aquí se filtra por productos activos
        label="Seleccionar Producto Principal",
        empty_label="Seleccione un Producto",
        widget=forms.Select(attrs={'class': 'form-control'})
    )
