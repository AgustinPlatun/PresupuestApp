import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/ingredients.dart';  // Importa la clase Ingrediente desde el archivo correcto
import 'package:flutter_application_1/Models/producto.dart';
import 'package:flutter_application_1/Models/historial.dart';

class PostAdd extends StatefulWidget {
  const PostAdd({Key? key}) : super(key: key);

  @override
  _PostAddState createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {
  final _nombreProductoController = TextEditingController();
  final _productoList = <Producto>[]; // Lista de productos
  final Historial _historial = Historial(); // Instancia de Historial
  Producto? _productoActivo; // Producto actualmente seleccionado
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  final _cantidadController = TextEditingController();
  UnidadMedida? _unidadSeleccionada; // Unidad de medida seleccionada

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

      if (nombreIngrediente.isNotEmpty && precio > 0 && cantidad > 0 && _unidadSeleccionada != null) {
        setState(() {
          final ingrediente = Ingrediente(
            nombre: nombreIngrediente, 
            precio: precio, 
            cantidad: cantidad,
            unidad: _unidadSeleccionada,
          );
          _productoActivo!.ingredientes.add(ingrediente);

          // Limpiar campos después de agregar ingrediente
          _nombreController.clear();
          _precioController.clear();
          _cantidadController.clear();
          _unidadSeleccionada = null;
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

  void _agregarProductoHistorial() {
    if (_productoActivo != null && _productoActivo!.ingredientes.length > 1) {
      setState(() {
        _historial.agregar(_productoActivo!);
        print('Producto agregado: ${_productoActivo!.nombreProducto}');
        _productoActivo = null;
        // Limpiar campos después de agregar producto
        _nombreProductoController.clear();
        _nombreController.clear();
        _precioController.clear();
        _cantidadController.clear();
      });
    } else {
      _reiniciar();
      print(
          'Reiniciar porque _productoActivo es null o no tiene suficientes ingredientes');
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

  void _borrarProducto(){
    if (_productoActivo != null) {
      setState(() {
        _reiniciar();
        _historial.get_historial.remove(_productoActivo);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                DropdownButton<UnidadMedida>(
                  value: _unidadSeleccionada,
                  hint: Text('Selecciona una unidad'),
                  items: UnidadMedida.values.map((UnidadMedida unidad) {
                    return DropdownMenuItem<UnidadMedida>(
                      value: unidad,
                      child: Text(unidad.toString().split('.').last),
                    );
                  }).toList(),
                  onChanged: (UnidadMedida? newValue) {
                    setState(() {
                      _unidadSeleccionada = newValue;
                    });
                  },
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      onPressed: _agregarIngrediente,
                      tooltip: 'Agregar Ingrediente',
                      child: Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: _agregarProductoHistorial,
                      tooltip: 'Guardar Producto',
                      child: Icon(Icons.save),
                    ),
                    FloatingActionButton(
                      onPressed: _reiniciar,
                      tooltip: 'Limpiar',
                      child: Icon(Icons.cleaning_services_outlined),
                    ),
                    FloatingActionButton(
                      onPressed: _borrarProducto,
                      tooltip: 'Borrar Producto',
                      child: Icon(Icons.delete),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Ingredientes:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ListView.builder(
  shrinkWrap: true,
  itemCount: _productoActivo!.ingredientes.length,
  itemBuilder: (context, index) {
    final ingrediente = _productoActivo!.ingredientes[index];
    final precioCalculado = ingrediente.calcularPrecioSegunUnidad();

    return ListTile(
      title: Text(
        '${ingrediente.nombre} - ${ingrediente.cantidad} ${ingrediente.unidad.toString().split('.').last} - \$${precioCalculado.toStringAsFixed(2)}',
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => _eliminarIngrediente(index),
      ),
    );
  },
),

              ],
            ],
          ),
        ),
      ),
    );
  }
}
