
/*
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/herramienta_logs/listarHerramienta_logs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RegistroAddPrestamo extends StatefulWidget {
  @override
  _RegistroAddPrestamoState createState() => _RegistroAddPrestamoState();
}

class _RegistroAddPrestamoState extends State<RegistroAddPrestamo> {

  TextEditingController id_herramienta = TextEditingController();
  //TextEditingController usuario_registro = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController novedad = TextEditingController();
  TextEditingController estado_actual = TextEditingController();

  final dateNow = DateTime.now();
  var usuario_registro = "admin";





  final _formKey = GlobalKey<FormState>();

  void _register() {
    print('adddataherramienta_logs');
    var url = Uri.parse(conexion() + "herramienta_logs/adddataherramienta_logs.php");

    http.post(url, body: {
      'id_herramienta': id_herramienta.text,
      'usuario_registro': usuario_registro,
      'fecha': fecha.text,
      'novedad': novedad.text,
      'estado_actual': estado_actual.text,
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
        title: const Text("herramienta"),
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
            controller: id_herramienta,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'id herramienta',
            ),
          ),
        ),

                  Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: fecha,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Fecha de ingreso',
          ),
        ),
      ),Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: novedad,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Tipo de novedad',
          ),
        ),
      ),Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: estado_actual,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Estado actual de herramienta',
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
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => ListarHerramientas_logs()));
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
