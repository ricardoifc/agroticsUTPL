import 'dart:convert';
import 'dart:async';
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
String username='';
String nivel='';

class _LoginPageState extends State<LoginPage> {

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  String msg='';

  Future<List> _login() async {
    print('xx');
    final response = await http.post(Uri.parse(conexion()+"login.php"), body: {
      "username": user.text,
      "password": pass.text,
    }
    );
    print("json xxxxxxx");
    print(response.toString());
    var datauserjson = json.decode(response.body);
    
    print("imrpimir body response");
    print(response.body);

    if(datauserjson.length==0){
      showDialog(context: context, builder: (BuildContext context){
       return  AlertDialog(
         title: Text("Ocurrió un problema al iniciar sesión, Inténtelo de nuevo."),
         actions: <Widget>[
           ElevatedButton(
             child: Text('Continuar'),
             onPressed: () {
        Navigator.pop(context);
             },
             style: ElevatedButton.styleFrom(
               primary: GlobalColor.colorBotonPrincipal
             ),
           ),
         ],
       );
      });
    }else{
      // print('xx');
      if(datauserjson[0]['rol']=='docente'){
        Navigator.pushReplacementNamed(context, '/menu');
      }else if(datauserjson[0]['rol']=='alumno'){
        Navigator.pushReplacementNamed(context, '/menu');
      }else if(datauserjson[0]['rol']=='nuevo'){
        Navigator.pushReplacementNamed(context, '/menu');
      }
      setState(() {
        username= datauserjson[0]['username'];
        nivel = datauserjson[0]['rol'];
      });
    }
    return datauserjson;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(title: const Text("Iniciar sesión"),),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'AGROTICS',
                      style: TextStyle(
                          color: GlobalColor.colorPrincipal,
                          fontWeight: FontWeight.w500,
                          fontSize: 40),
                    )),
                Container(
                    alignment: Alignment.center,
                    //padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Ingresa tus datos aquí',
                      style: TextStyle(
                          color: GlobalColor.colorTextPrincipal,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    )),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: user,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: pass,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
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
                      child: Text('Iniciar sesión'),
                      onPressed: () {
                        _login();
                      },
                    )),

                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: GlobalColor.colorSecundario,
                  child: const Text('Recuperar contraseña'),
                ),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('¿No tienes cuenta?'),
                        FlatButton(
                          textColor: GlobalColor.colorSecundario,
                          child: const Text(
                            'Registrate',
                            style: TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/register');
                          },
                        )
                      ],
                    ))
              ],
            ))
    );
  }
}