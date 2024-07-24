import 'package:flutter_application_1/Models/ingredients.dart';

class Producto {

  
  String _nombreProducto;
  List<Ingrediente> _ingredientes = [];

  Producto(this._nombreProducto);

  // ignore: unnecessary_getters_setters
  String get nombreProducto => _nombreProducto;

  List<Ingrediente> get ingredientes => _ingredientes;

  set nombreProducto(String value) {
    _nombreProducto = value;
  }

  double calcularPrecioTotal() {
    return _ingredientes.fold(0.0, (total, ingrediente) => total + ingrediente.calcularPrecioTotal());
  }
}
