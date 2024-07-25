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
  int cantusada;

  Ingrediente({
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.cantusada,
    this.unidad,
  });

  double calcularPrecioTotal() {
    return calcularPrecioSegunUnidad();
  }

  double calcularPrecioSegunUnidad() {
    double resultado=0;
    switch (unidad) {
      case UnidadMedida.mililitros:
        resultado = ( precio / cantidad); 
        return resultado * cantusada;
      case UnidadMedida.miligramos:
        resultado = ( precio / cantidad); 
        return resultado * cantusada;
      case UnidadMedida.cantidad:
        return cantusada * precio;
      default:
        return 0.0;
    }
  }

  @override
  String toString() {
    return 'Ingrediente(nombre: $nombre, precio: $precio, cantidad: $cantidad, unidad: $unidad)';
  }
}
