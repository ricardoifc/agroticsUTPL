import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarHerramienta extends StatefulWidget {
  final List list;
  final int index;

  EditarHerramienta({required this.list, required this.index});

  @override
  _EditarHerramientaState createState() => _EditarHerramientaState();
}

class _EditarHerramientaState extends State<EditarHerramienta> {
  TextEditingController herramienta = TextEditingController();
  TextEditingController disponibilidad = TextEditingController();
  TextEditingController fecha_alta = TextEditingController();
  TextEditingController fecha_baja = TextEditingController();
  TextEditingController estado_herramienta = TextEditingController();



  void editData() {
    print("editdataherramientas.php");
    var url = Uri.parse(conexion() + "herramientas/editdataherramientas.php");
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "herramienta": herramienta.text,
      "disponibilidad": disponibilidad.text,
      "fecha_alta": fecha_alta.text,
      "fecha_baja": fecha_baja.text,
      "estado_herramienta": estado_herramienta.text,


    });
  }

  @override
  void initState() {
    herramienta= TextEditingController(text: widget.list[widget.index]['herramienta'] );
    disponibilidad= TextEditingController(text: widget.list[widget.index]['disponibilidad'] );
    fecha_alta= TextEditingController(text: widget.list[widget.index]['fecha_alta'] );
    fecha_baja= TextEditingController(text: widget.list[widget.index]['fecha_baja'] );
    estado_herramienta= TextEditingController(text: widget.list[widget.index]['estado_herramienta'] );



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EDITAR"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Column(
              children: <Widget>[

        ListTile(
        title: TextFormField(
        controller: herramienta,
          validator: (value) {
            if (value == null) return 'Ingresa Nombre herramienta' ;
          },
          decoration: const InputDecoration(
            hintText: 'Nombre herramienta', labelText: 'Nombre herramienta',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: disponibilidad,
          validator: (value) {
            if (value == null) return 'Ingresa Disponibilidad' ;
          },
          decoration: const InputDecoration(
            hintText: 'Disponibilidad', labelText: 'Disponibilidad',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: fecha_alta,
          validator: (value) {
            if (value == null) return 'Ingresa Fecha de ingreso' ;
          },
          decoration: const InputDecoration(
            hintText: 'Fecha de ingreso', labelText: 'Fecha de ingreso',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: fecha_baja,
          validator: (value) {
            if (value == null) return 'Ingresa fecha de salida' ;
          },
          decoration: const InputDecoration(
            hintText: 'fecha de salida', labelText: 'fecha de salida',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: estado_herramienta,
          validator: (value) {
            if (value == null) return 'Ingresa Estado que se encuentra' ;
          },
          decoration: const InputDecoration(
            hintText: 'Estado que se encuentra', labelText: 'Estado que se encuentra',
          ),
        ),
      ),



      const Divider(
                  height: 1.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("Guardar"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
