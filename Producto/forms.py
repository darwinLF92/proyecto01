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
