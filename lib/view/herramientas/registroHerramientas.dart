/*
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RegistroHerramienta extends StatefulWidget {
  @override
  _RegistroHerramientaState createState() => _RegistroHerramientaState();
}

class _RegistroHerramientaState extends State<RegistroHerramienta> {

  TextEditingController herramienta = TextEditingController();
  TextEditingController disponibilidad = TextEditingController();
  TextEditingController fecha_alta = TextEditingController();
  TextEditingController fecha_baja = TextEditingController();
  TextEditingController estado_herramienta = TextEditingController();
  final dateNow = DateTime.now();
  var usuario_registro = "admin";





  final _formKey = GlobalKey<FormState>();

  void _register() {
    var url = Uri.parse("${conexion()}herramientas/adddataherramientas.php");

    http.post(url, body: {
      'herramienta': herramienta.text,
      'disponibilidad': disponibilidad.text,
      'fecha_alta': fecha_alta.text,
      'fecha_baja': fecha_baja.text,
      'estado_herramienta': estado_herramienta.text,
      "fecha_registro": dateNow.toString(),
      "usuario_registro": usuario_registro,


    });
  }

  //late String _mySelection = "";
  //final List<Map> _myJson = [{"id":0,"name":"docentes"},{"id":1,"name":"alumnos"}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: const Text("Adicionar Campo"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[

          Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: herramienta,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre herramienta',
            ),
          ),
        ),Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: disponibilidad,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Disponibilidad',
          ),
        ),
      ),Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: fecha_alta,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Fecha de ingreso',
          ),
        ),
      ),Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: fecha_baja,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'fecha de salida',
          ),
        ),
      ),Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: estado_herramienta,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Estado que se encuentra',
          ),
        ),
      ),






          const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          _register();
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GlobalColor.colorBotonPrincipal,
                        ),
                        child: const Text('Agregar'),
                      ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GlobalColor.colorBotonPrincipal,
                        ),
                        child: const Text('Salir'),
                      ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
