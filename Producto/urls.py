from django.urls import path
from . import views

app_name = 'Producto'

urlpatterns = [
    path('listar_productos/', views.listar_productos, name='listar_productos'),
    path('agregar_producto/', views.agregar_producto, name='agregar_producto'),
    path('producto/editar/<int:producto_id>/', views.editar_producto, name='editar_producto'),
    path('producto/eliminar/<int:producto_id>/', views.eliminar_producto, name='eliminar_producto'),
    #path('agregar_componentes/<int:producto_id>/', views.agregar_componentes, name='agregar_componentes'),
    path('get_productos/', views.get_productos, name='get_productos'),
    path('productos_fabricacion/', views.listar_productos_fabricacion, name='listar_productos_fabricacion'),
    path('producto/<int:producto_id>/aumentar/', views.aumentar_stock, name='aumentar_stock'),
    path('producto/<int:producto_id>/detalle/', views.ver_detalle_producto, name='ver_detalle_producto'),
    #path('productos/seleccionar_principal/', views.seleccionar_producto_principal, name='seleccionar_producto_principal'),
    #path('producto/<int:producto_id>/agregar_componentes/', views.agregar_componentes, name='agregar_componentes'),
    path('producto/<int:producto_id>/editar-componentes/', views.editar_componentes_producto, name='editar_componentes_producto'),
    # Añadir más URLs aquí
]
