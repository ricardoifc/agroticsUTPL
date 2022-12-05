import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarUsuario extends StatefulWidget {
  final List list;
  final int index;

  EditarUsuario({required this.list, required this.index});

  @override
  _EditarUsuarioState createState() => _EditarUsuarioState();
}

class _EditarUsuarioState extends State<EditarUsuario> {

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerRol = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  


  void editData() {
    var url= Uri.parse(conexion()+"editdata.php");

    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "rol": controllerRol.text,
      "name": controllerName.text,
      "lastname": controllerLastName.text,
      //"fecha_registro": widget.list[widget.index]['fecha_registro'],
      "usuario_registro": widget.list[widget.index]['usuario_registro'],

    }).then(
            (response) {
          print("Reponse status : ${response.statusCode}");
          print("Response body : ${response.body}");
          //var myresponse = jsonDecode(response.body);
          //print(myresponse);
        });

    //print ("http post");
  }


  @override
    void initState() {
      controllerUsername= TextEditingController(text: widget.list[widget.index]['username'] );
      controllerPassword= TextEditingController(text: widget.list[widget.index]['password'] );
      controllerRol= TextEditingController(text: widget.list[widget.index]['rol'] );
      controllerName= TextEditingController(text: widget.list[widget.index]['name'] );
      controllerLastName= TextEditingController(text: widget.list[widget.index]['lastname'] );
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
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: TextFormField(
                      controller: controllerUsername,
                          validator: (value) {
                            if (value == null) return "Ingresa un nombre de usurio";
                          },
                      decoration: const InputDecoration(
                        hintText: "Usurio", labelText: "Usuario",
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.privacy_tip, color: Colors.black),
                    title: TextFormField(
                      controller: controllerPassword,
                          validator: (value) {
                            if (value == null) return "Ingresa una Contraseña";
                          },
                      decoration: const InputDecoration(
                        hintText: "Contraseña", labelText: "Contraseña",
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  ListTile(
                    leading: const Icon(Icons.supervised_user_circle, color: Colors.black),
                    title: Text(
                    "Rol", style: const TextStyle(fontSize: 12.0),
                  ),
                    subtitle: DropdownButton<String>(
                      // Step 3.
                      value: controllerRol.text,
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
                          controllerRol.text = newValue!;
                        });
                      },

                    ),
                  ),

                  ListTile(
                    leading: const Icon(Icons.emoji_people_outlined, color: Colors.black),
                    title: TextFormField(
                      controller: controllerName,
                      validator: (value) {
                        if (value == null) return "Ingresa Nombre";
                      },
                      decoration: const InputDecoration(
                        hintText: "Nombre", labelText: "Nombre",
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.emoji_people_outlined, color: Colors.black),
                    title: TextFormField(
                      controller: controllerLastName,
                      validator: (value) {
                        if (value == null) return "Ingrese Apellido";
                      },
                      decoration: const InputDecoration(
                        hintText: "Apellido", labelText: "Apellido",
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
                    color: GlobalColor.colorBotonPrincipal,
                    onPressed: () {
                      editData();
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text("Guardar", style: TextStyle(
                        color: GlobalColor.colorBotonTextPrincipal
                    ),
                    ),
                  )
                ],
              ),
            ],
          ),
      ),
    );
  }
}