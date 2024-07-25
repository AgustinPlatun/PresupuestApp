import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/producto.dart'; // Asegúrate de importar tus modelos correctamente
import 'package:flutter_application_1/Models/ingredients.dart'; // Importa el modelo de Ingrediente

class PostAdd extends StatefulWidget {
  @override
  _ProductoScreenState createState() => _ProductoScreenState();
}

class _ProductoScreenState extends State<PostAdd> {
  TextEditingController nombreProductoController = TextEditingController();
  TextEditingController nombreIngredienteController = TextEditingController();
  TextEditingController precioIngredienteController = TextEditingController();
  TextEditingController cantidadIngredienteController = TextEditingController();
  String selectedUnit = 'gramos'; // Unidad de medida seleccionada
  Producto producto = Producto(''); // Instancia del producto actual

  void agregarIngrediente() {
    String nombre = nombreIngredienteController.text.trim();
    double precio = double.tryParse(precioIngredienteController.text.trim()) ?? 0.0;
    int cantidad = int.tryParse(cantidadIngredienteController.text.trim()) ?? 1;

    if (nombre.isNotEmpty && precio > 0 && cantidad > 0) {
      Ingrediente nuevoIngrediente = Ingrediente(
        nombre: nombre,
        precio: precio,
        cantidad: cantidad,
        unidad: selectedUnit, // Asigna la unidad seleccionada
      );
      setState(() {
        producto.ingredientes.add(nuevoIngrediente);
      });
      nombreIngredienteController.clear();
      precioIngredienteController.clear();
      cantidadIngredienteController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    double precioTotal = producto.calcularPrecioTotal();
    double precioSugerido = precioTotal * 1.45;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Agregar Producto'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: nombreProductoController,
              decoration: InputDecoration(labelText: 'Nombre del Producto'),
              onChanged: (value) {
                setState(() {
                  producto.nombreProducto = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Ingredientes:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 400.0, // Ajusta la altura según tus necesidades
              child: ListView.builder(
                itemCount: producto.ingredientes.length,
                itemBuilder: (context, index) {
                  final ingrediente = producto.ingredientes[index];
                  return ListTile(
                    title: Text(
                      '${ingrediente.nombre} - ${ingrediente.precio} x ${ingrediente.cantidad} ${ingrediente.unidad}',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: nombreIngredienteController,
                    decoration: InputDecoration(labelText: 'Nombre del Ingrediente'),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: precioIngredienteController,
                    decoration: InputDecoration(labelText: 'Precio'),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: cantidadIngredienteController,
                    decoration: InputDecoration(labelText: 'Cantidad'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'Unidad:',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedUnit,
                          items: <String>['gramos', 'litros', 'mililitros'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedUnit = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: agregarIngrediente,
              child: Text('Agregar Ingrediente'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Precio Total: \$${precioTotal.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Precio Sugerido: \$${precioSugerido.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}