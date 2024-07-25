import 'package:flutter_application_1/Models/producto.dart';

class Historial {

  
  List<Producto> _historial = [];

  // ignore: unnecessary_getters_setters, non_constant_identifier_names
  List<Producto> get get_historial => _historial;

  void agregar(Producto p){
    get_historial.add(p);
    print(p.nombreProducto);
    print(p.ingredientes);
  }


}