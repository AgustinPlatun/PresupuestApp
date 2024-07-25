class Ingrediente {
  String nombre;
  double precio;
  int cantidad;
  String unidad;

  Ingrediente({
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.unidad,
  });

  double calcularPrecioTotal() {
    return precio * cantidad;
  }
}