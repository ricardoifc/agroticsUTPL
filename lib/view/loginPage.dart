import 'dart:convert';
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/menu/menuPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoggedIn = false;
  String username = '';
  String rol = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('username')!;
    String userRol = prefs.getString('rol')!;

    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        username = userId;
        rol = userRol;
      });
      return;
    }
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('rol');

    setState(() {
      username = '';
      isLoggedIn = false;
    });
  }

  Future<Null> submitForm() async {
    setState(() {
      isLoading = true;
    });

    final String username = usernameController.text;
    final String password = passwordController.text;

    if (username.trim().isEmpty || password.trim().isEmpty) {
      isLoading = false;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Por favor, rellene todos los campos'),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      return;
    }

    final http.Response response = await http.post(
        Uri.parse('https://agrotics.000webhostapp.com/flutter/login.php'),
        body: {
          'username': username,
          'password': password,
        });
    if (response.statusCode == 200) {
      var datauserjson = json.decode(response.body);
      log(datauserjson.toString());
      if (datauserjson.length == 0) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('El usuario o contraseña es incorrecto.'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        var roljson = datauserjson[0]['rol'];

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', username);
        prefs.setString('rol', roljson);
        setState(
              () {
            isLoggedIn = true;
            this.username = username;
            this.rol = roljson;
          },
        );
      }
    } else {}
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title:
        !isLoggedIn ? Text('Inicie sesión') : Text('Bienvenido $username'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(1),
              child: const Text(
                'AGROTICS',
                style: TextStyle(
                    color: GlobalColor.colorPrincipal,
                    fontWeight: FontWeight.w500,
                    fontSize: 40),
              ),
            ),

            !isLoggedIn
                ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    //alignment: Alignment.center,
                    // padding: const EdgeInsets.all(10),
                    child: Text(
                      '¡Bienvenido  a la aplicación de Agrotics! Para ayudarte a capturar, almacenar y gestionar tus datos de muestras de manera eficiente y precisa ingresa tu usuario y contraseña para iniciar sesión".',
                      style: const TextStyle(
                          color: GlobalColor.colorTextPrincipal,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 24),
                        Text('Iniciando sesión... '),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !isLoading,
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Usuario',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Visibility(
                    visible: !isLoading,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      //style: style,
                      onPressed: isLoading ? null : submitForm,
                      style: ElevatedButton.styleFrom(
                        primary: GlobalColor.colorBotonPrincipal,
                      ),
                      child: const Text('Iniciar sesión'),
                    ),
                  ),
                ],
              ),
            )
                : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    //alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '¡Bienvenido $username a la aplicación de Agrotics! Para ayudarte a capturar, almacenar y gestionar tus datos de muestras de manera eficiente y precisa presiona el boton "Ingresa al menú".',
                      style: const TextStyle(
                          color: GlobalColor.colorTextPrincipal,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  Text('Rol: $rol'),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      //style: style,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MenuPage(username: username, rol: rol)));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: GlobalColor.colorBotonPrincipal,
                      ),
                      child: const Text('Ingresa al menú'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text('¿Desea cerrar sesión?'),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      //style: style,
                      onPressed: logout,
                      style: ElevatedButton.styleFrom(
                        primary: GlobalColor.colorBotonCancelar,
                      ),
                      child: const Text('Cerrar sesión'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
