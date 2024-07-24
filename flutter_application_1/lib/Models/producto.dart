import 'package:flutter_application_1/Models/ingredients.dart';

class Producto {

  
  String _nombreProducto;
  List<Ingrediente> ingredientes = [];

  Producto(this._nombreProducto);

  String get nombreProducto => _nombreProducto;

  set nombreProducto(String value) {
    _nombreProducto = value;
  }

  double calcularPrecioTotal() {
    return ingredientes.fold(0.0, (total, ingrediente) => total + ingrediente.calcularPrecioTotal());
  }
}
