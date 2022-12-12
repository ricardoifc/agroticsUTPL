import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarHerramienta_logs extends StatefulWidget {
  final List list;
  final int index;

  EditarHerramienta_logs({required this.list, required this.index});

  @override
  _EditarHerramienta_logsState createState() => _EditarHerramienta_logsState();
}

class _EditarHerramienta_logsState extends State<EditarHerramienta_logs> {
  TextEditingController id_herramienta = TextEditingController();
  //TextEditingController usuario_registro = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController novedad = TextEditingController();
  TextEditingController estado_actual = TextEditingController();
  //TextEditingController fecha_registro = TextEditingController();




  void editData() {
    print("editdataherramientas.php");
    var url = Uri.parse(conexion() + "herramienta_logs/editdataherramienta_logs.php");
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "id_herramienta": id_herramienta.text,
      //"usuario_registro": widget.list[widget.index]['id'],,
      "fecha": fecha.text,
      "novedad": novedad.text,
      "estado_actual": estado_actual.text,
      //"fecha_registro": widget.list[widget.index]['id'],



    });
  }

  @override
  void initState() {
    id_herramienta= TextEditingController(text: widget.list[widget.index]['id_herramienta'] );
    //usuario_registro= TextEditingController(text: widget.list[widget.index]['usuario_registro'] );
    fecha= TextEditingController(text: widget.list[widget.index]['fecha'] );
    novedad= TextEditingController(text: widget.list[widget.index]['novedad'] );
    estado_actual= TextEditingController(text: widget.list[widget.index]['estado_actual'] );
    //fecha_registro= TextEditingController(text: widget.list[widget.index]['fecha_registro'] );




    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
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
        controller: id_herramienta,
          validator: (value) {
            if (value == null) return 'Ingresa Nombre identificador herramienta' ;
          },
          decoration: const InputDecoration(
            hintText: 'Nombre herramienta', labelText: 'Nombre herramienta',
          ),
        ),
      ),

      ListTile(
        title: TextFormField(
          controller: fecha,
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
          controller: novedad,
          validator: (value) {
            if (value == null) return 'Ingresa Tipo de novedad' ;
          },
          decoration: const InputDecoration(
            hintText: 'Tipo de novedad', labelText: 'Tipo de novedad',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: estado_actual,
          validator: (value) {
            if (value == null) return 'Ingresa Estado actual de herramienta' ;
          },
          decoration: const InputDecoration(
            hintText: 'Estado actual de herramienta', labelText: 'Estado actual de herramienta',
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
