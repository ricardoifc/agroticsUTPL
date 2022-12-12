import 'dart:io';
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  var rol = "nuevo";

  DateTime fechaHoy =DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour);
  var fecha_registro = "";
  var usuario_registro = "";


  final _formKey = GlobalKey<FormState>();

  Future _register() async {
    print('addData');
    var url = Uri.parse(conexion() + "adddata.php");
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    http.post(url, body: {
      "username": username.text,
      "password": password.text,
      "rol": rol,
      "name": name.text,
      "lastname": lastname.text,
      "fecha_registro": fechaHoy.toString(),
      "usuario_registro": usuario_registro,
    }).then(
            (response) {
          print("Reponse status : ${response.statusCode}");
          print("Response body : ${response.body}");
          //var myresponse = jsonDecode(response.body);
          //print(myresponse);
        });
    print("termino registro");
    //Navigator.pushReplacementNamed(context, '/login' );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: const Text("Registrar cuenta"),
      ),
      body: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // Container(
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.all(10),
            //     child: const Text(
            //       'AGROTICS',
            //       style: TextStyle(
            //           color: Colors.blue,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 30),
            //     )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombres',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: lastname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apellidos',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            // Container(
            //     height: 50,
            //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //     child: RaisedButton(
            //       textColor: Colors.white,
            //       color: Colors.blue,
            //       child: const Text('Elegir pregunta de seguridad'),
            //       onPressed: () {
            //         showDialog(
            //             context: context,
            //             builder: (BuildContext context) => const PopupWidget()
            //         );
            //       },
            //     )),
            //
            //
            //
            // Container(
            //   padding: EdgeInsets.all(10),
            //   child: TextField(
            //     controller: name,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Respuesta de seguridad',
            //     ),
            //   ),
            // ),

            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: GlobalColor.colorBotonTextPrincipal,
                  color: GlobalColor.colorBotonPrincipal,
                  child: Text('Registrar'),
                  onPressed: () {
                    print(username.text);
                    print(password.text);
                    _register();
                    //Navigator.pushReplacementNamed(context, '/login');
                  },
                )),


            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('¿Ya tienes cuenta?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: const Text(
                        'Inicia sesión',
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    )
                  ],
                )
            ),
            ]
        )
    )
      ),
    );
  }
}
