enum UnidadMedida {
  mililitros,
  miligramos,
  cantidad
}

class Ingrediente {
  String nombre;
  double precio;
  int cantidad;
  UnidadMedida? unidad;

  Ingrediente({
    required this.nombre,
    required this.precio,
    required this.cantidad,
    this.unidad,
  });

  double calcularPrecioTotal() {
    return calcularPrecioSegunUnidad();
  }

  double calcularPrecioSegunUnidad() {
    switch (unidad) {
      case UnidadMedida.mililitros:
      case UnidadMedida.miligramos:
        return cantidad / precio;
      case UnidadMedida.cantidad:
        return cantidad * precio;
      default:
        return 0.0;
    }
  }

  @override
  String toString() {
    return 'Ingrediente(nombre: $nombre, precio: $precio, cantidad: $cantidad, unidad: $unidad)';
  }
}
