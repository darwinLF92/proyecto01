from django.db import models

class Producto(models.Model):
    codigo = models.CharField(max_length=50, unique=True)
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField(blank=True, null=True)
    precio_compra = models.DecimalField(max_digits=10, decimal_places=2)
    precio_venta = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.PositiveIntegerField(default=0)
    tiene_descuento = models.BooleanField(default=False)
    para_fabricacion = models.BooleanField(default=False)
    componentes = models.ManyToManyField('self', through='ComponenteProducto', symmetrical=False, blank=True)
    activo = models.BooleanField(default=True)

    def __str__(self):
        return self.NOMBRE

class ComponenteProducto(models.Model):
    producto_principal = models.ForeignKey(Producto, related_name='producto_principal', on_delete=models.CASCADE)
    producto_componente = models.ForeignKey(Producto, related_name='producto_componente', on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField()

    def __str__(self):
        return f"{self.producto_componente.nombre} en {self.producto_principal.nombre}"



class Transaccion(models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    fecha_registro = models.DateTimeField(auto_now_add=True)
    # Puedes incluir más campos relevantes aquí, como usuario que realizó la transacción, etc.

    def __str__(self):
        return f"Transacción de {self.cantidad} para {self.producto.nombre} el {self.fecha_registro}"