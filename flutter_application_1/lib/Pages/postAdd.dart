// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/ingredients.dart';
import 'package:flutter_application_1/Models/producto.dart';

class PostAdd extends StatefulWidget {
  const PostAdd({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostAddState createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {
  final _nombreProductoController = TextEditingController();
  final _productoList = <Producto>[]; // Lista de productos
  final _historial = <Producto>[]; // Lista de historial
  Producto? _productoActivo; // Producto actualmente seleccionado
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  final _cantidadController = TextEditingController();

  @override
  void dispose() {
    _nombreProductoController.dispose();
    _nombreController.dispose();
    _precioController.dispose();
    _cantidadController.dispose();
    super.dispose();
  }

  void _eliminarIngrediente(int index) {
    setState(() {
      _productoActivo!.ingredientes.removeAt(index);
    });
  }

  void _agregarIngrediente() {
    if (_productoActivo != null) {
      final nombreIngrediente = _nombreController.text;
      final precio = double.tryParse(_precioController.text) ?? 0.0;
      final cantidad = int.tryParse(_cantidadController.text) ?? 1;

      if (nombreIngrediente.isNotEmpty && precio > 0 && cantidad > 0) {
        setState(() {
          final ingrediente = Ingrediente(nombre: nombreIngrediente, precio: precio, cantidad: cantidad);
          _productoActivo!.ingredientes.add(ingrediente);

          // Limpiar campos después de agregar ingrediente
          _nombreController.clear();
          _precioController.clear();
          _cantidadController.clear();
        });
      }
    }
  }

  void _cambiarProducto() {
    final nombreProducto = _nombreProductoController.text;

    if (nombreProducto.isNotEmpty) {
      setState(() {
        _productoActivo = _productoList.firstWhere(
          (p) => p.nombreProducto == nombreProducto,
          orElse: () {
            final nuevoProducto = Producto(nombreProducto);
            _productoList.add(nuevoProducto);
            return nuevoProducto;
          },
        );

        _nombreProductoController.clear();
      });
    }
  }

  void _agregarProducto() {
    if (_productoActivo != null && _productoActivo!.ingredientes.length > 1) {
      setState(() {
        _historial.add(_productoActivo!);
        _productoActivo = null;
        // Limpiar campos después de agregar producto
        _nombreProductoController.clear();
        _nombreController.clear();
        _precioController.clear();
        _cantidadController.clear();
      });
    } else {
      _reiniciar();
    }
  }

  void _reiniciar() {
    setState(() {
      _nombreProductoController.clear();
      _nombreController.clear();
      _precioController.clear();
      _cantidadController.clear();
      _productoActivo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Agregar producto',
            style: TextStyle(fontSize: 28),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nombreProductoController,
                decoration: InputDecoration(
                  labelText: 'Nombre del Producto',
                  hintText: 'Ingresa el nombre del producto',
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _cambiarProducto,
                child: Text('Seleccionar Producto'),
              ),
              SizedBox(height: 16),
              if (_productoActivo != null) ...[
                TextField(
                  controller: _nombreController,
                  decoration: InputDecoration(labelText: 'Nombre del Ingrediente'),
                ),
                TextField(
                  controller: _precioController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Precio del Ingrediente'),
                ),
                TextField(
                  controller: _cantidadController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Cantidad'),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      onPressed: _reiniciar,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.delete),
                    ),
                    FloatingActionButton(
                      onPressed: _agregarIngrediente,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemCount: _productoActivo!.ingredientes.length,
                      itemBuilder: (context, index) {
                        final ingrediente = _productoActivo!.ingredientes[index];
                        return ListTile(
                          title: Text(ingrediente.nombre),
                          subtitle: Text('\$${ingrediente.precio.toStringAsFixed(2)} x${ingrediente.cantidad}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('\$${ingrediente.calcularPrecioTotal().toStringAsFixed(2)}'),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _eliminarIngrediente(index),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Gasto Total: \$${_productoActivo!.calcularPrecioTotal().toStringAsFixed(2)}',
                ),
                RichText(
                  text: TextSpan(
                    text: 'Precio sugerido para: ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: _productoActivo!.nombreProducto,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ': \$${(_productoActivo!.calcularPrecioTotal() * 1.405).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
