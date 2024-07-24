class Ingrediente {
  String nombre;
  double precio;
  int cantidad;


  Ingrediente({
    required this.nombre,
    required this.precio,
    required this.cantidad,
  });

  double calcularPrecioTotal() {
    return precio * cantidad;
  }

  @override
  String toString() {
    return 'Ingrediente(nombre: $nombre, precio: $precio, cantidad: $cantidad)';
  }
}


