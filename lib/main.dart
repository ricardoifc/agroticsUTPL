import 'package:agrotics/view/loginPage.dart';
import 'package:agrotics/view/menuPage.dart';
import 'package:agrotics/view/registerPage.dart';
import 'package:flutter/material.dart';
import 'Util/global_color.dart';
import 'dart:io';


void main() {

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Agrotics app',
      theme: ThemeData(

          appBarTheme: const AppBarTheme(
            color: GlobalColor.colorBarApp,
          )
      ),

      home: MenuPage(username: "admin",rol: "docente"),
      routes: <String,WidgetBuilder>{
        '/login': (BuildContext context)=> LoginPage(),
        '/register': (BuildContext context)=> RegisterPage(),
        '/menu': (BuildContext context)=> MenuPage(username: username,rol: nivel,),
        //'/usuarios/listar': (BuildContext context)=> ListarUsuario(""),

      },

    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
