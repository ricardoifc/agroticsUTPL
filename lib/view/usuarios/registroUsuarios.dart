import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RegistroUsuario extends StatefulWidget {
  @override
  _RegistroUsuarioState createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  String controllerRol = 'alumno';
  final dateNow = DateTime.now().timeZoneName;
  var usuario_registro = "admin";


  final _formKey = GlobalKey<FormState>();

  void _register() {
    print('addData');
    var url = Uri.parse(conexion()+"adddata.php");

    http.post(url, body: {
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      //"rol": _mySelection.toString(), //aqui traemos el DropdownMenuItem lo llamamos _mySelection este es como el controller
      "rol": controllerRol,
      "name": controllerName.text,
      "lastname": controllerLastName.text,
      "fecha_registro": dateNow,
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
        title: const Text("Adicionar Usuarios"),
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
                      controller: controllerName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombres',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: controllerLastName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Apellidos',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: controllerUsername,
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
                      controller: controllerPassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
        DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38)

          ),
          child: Padding(
            padding: EdgeInsets.only(left:112, right:112),
                  child: DropdownButton<String>(
                    value: controllerRol,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 30,
                    elevation: 16,
                    style: TextStyle(color: Colors.black54, fontSize: 18.0 ),
                    underline: Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                      // Step 4.
                      items: <String>['docente', 'alumno', 'nuevo']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            //style: TextStyle(fontSize: 30),
                          ),

                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          controllerRol = newValue!;
                        });
                      },

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
                          //Navigator.of(context).push(MaterialPageRoute(
                          //  builder: (BuildContext context) => ListarUsuario()));
                        },
                      )),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
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
