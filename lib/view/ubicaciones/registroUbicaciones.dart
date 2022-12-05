import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/ubicaciones/listarUbicaciones.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RegistroUbicaciones extends StatefulWidget {
  @override
  _RegistroUbicacionesState createState() => _RegistroUbicacionesState();
}

class _RegistroUbicacionesState extends State<RegistroUbicaciones> {

  TextEditingController ubicacion = TextEditingController();
  TextEditingController lugar_lote = TextEditingController();
  TextEditingController area_sembrada = TextEditingController();
  final dateNow = DateTime.now();
  var usuario_registro = "admin";





  final _formKey = GlobalKey<FormState>();

  void _register() {
    print('adddataubicaciones');
    var url = Uri.parse(conexion() + "ubicaciones/adddataubicaciones.php");

    http.post(url, body: {
      'ubicacion': ubicacion.text,
      'lugar_lote': lugar_lote.text,
      'area_sembrada': area_sembrada.text,
      'fecha_registro': dateNow.toString(),
      'usuario_registro': usuario_registro,


    });
  }

  //late String _mySelection = "";
  //final List<Map> _myJson = [{"id":0,"name":"docentes"},{"id":1,"name":"alumnos"}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            controller: ubicacion,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ubicación',
            ),
          ),
        ),Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: lugar_lote,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Lugar/Lote',
          ),
        ),
      ),Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: area_sembrada,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Área sembrada',
          ),
        ),
      ),




          const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: GlobalColor.colorBotonTextPrincipal,
                        color: GlobalColor.colorBotonPrincipal,
                        child: Text('Agregar'),
                        onPressed: () {
                          _register();
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => ListarUbicaciones()));
                        },
                      )),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: GlobalColor.colorBotonTextPrincipal,
                        color: GlobalColor.colorBotonPrincipal,
                        child: Text('Salir'),
                        onPressed: () {
                          Navigator.pop(context);


                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
