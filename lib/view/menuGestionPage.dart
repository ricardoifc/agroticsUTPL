import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/view/addmuestreos/identificarAddMuestra.dart';
import 'package:agrotics/view/herramienta_logs/listarHerramienta_logs.dart';
import 'package:agrotics/view/herramientas/listarHerramientas.dart';
import 'package:agrotics/view/muestreos/listarMuestras.dart';
import 'package:agrotics/view/siembras/listarSiembras.dart';
import 'package:agrotics/view/ubicaciones/listarUbicaciones.dart';
import 'package:agrotics/view/usuarios/listarUsuario.dart';
import 'package:flutter/material.dart';
import 'especies/listarEspecies.dart';


class MenuGestionPage extends StatelessWidget {
  const MenuGestionPage({required this.username, required this.rol});
  final String username;
  final String rol;

  @override
  Widget build(BuildContext context) {
    bool isVisibleDocente = false;
    bool isVisibleAlumno = false;

    if (rol == 'docente') {
      isVisibleDocente = true;
      isVisibleAlumno = true;
    } else if (rol == 'alumno') {
      isVisibleDocente = false;
      isVisibleAlumno = true;
    } else {
      isVisibleDocente = false;
      isVisibleAlumno = false;
    }

    print(isVisibleDocente);
    double tamIcon = 60;
    double tamText = 14;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      //backgroundColor: Colors.grey,
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          children: <Widget>[
            Visibility(
              visible: isVisibleDocente,
              child: Container(
                padding: const EdgeInsets.all(7.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ListarUsuario()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2.0,
                  fillColor: GlobalColor.colorCards,
                  padding: const EdgeInsets.all(7.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ImageIcon(

                        AssetImage('assets/icons/group.png'),
                        color: GlobalColor.colorIconosPrincipal,
                        size: tamIcon,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                        Text(
                          "Usuario",
                          style: TextStyle(fontSize: tamText),
                        ),),

                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                        Text(
                          "Listar Usuarios",
                          style: TextStyle(fontSize: tamText),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisibleAlumno,
              child: Container(
                padding: const EdgeInsets.all(7.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ListarEspecie()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2.0,
                  fillColor: GlobalColor.colorCards,
                  padding: const EdgeInsets.all(7.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children:  <Widget>[
                      ImageIcon(
                        AssetImage('assets/icons/plant.png'),
                        color: GlobalColor.colorIconosPrincipal,
                        size: tamIcon,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                        Text(
                          "Especies",
                          style: TextStyle(fontSize: tamText),
                        ),),

                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                        Text(
                          "Listar Especies",
                          style: TextStyle(fontSize: tamText),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisibleAlumno,
              child: Container(
                padding: const EdgeInsets.all(7.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ListarUbicaciones()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2.0,
                  fillColor: GlobalColor.colorCards,
                  padding: const EdgeInsets.all(7.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ImageIcon(
                        AssetImage('assets/icons/field.png'),
                        color: GlobalColor.colorIconosPrincipal,
                        size: tamIcon,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                        Text(
                          "Ubicaciones",
                          style: TextStyle(fontSize: tamText),
                        ),),

                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                        Text(
                          "Listar ubicaciones",
                          style: TextStyle(fontSize: tamText),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

            Visibility(
              visible: isVisibleAlumno,
              child: Container(
                padding: const EdgeInsets.all(7.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ListarHerramientas()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2.0,
                  fillColor: GlobalColor.colorCards,
                  padding: const EdgeInsets.all(7.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ImageIcon(
                        AssetImage('assets/icons/gardening-tools.png'),
                        color: GlobalColor.colorIconosPrincipal,
                        size: tamIcon,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                        Text(
                          "Herramientas",
                          style: TextStyle(fontSize: tamText),
                        ),),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child:
                  Text(
                    "Listar Herramientas",
                    style: TextStyle(fontSize: tamText),
                  ),),

                    ],
                  ),
                ),
              ),
            ),

            Visibility(
              visible: isVisibleAlumno,
              child: Container(
                padding: const EdgeInsets.all(7.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ListarHerramientas_logs()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2.0,
                  fillColor: GlobalColor.colorCards,
                  padding: const EdgeInsets.all(7.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[

                      ImageIcon(

                        AssetImage('assets/icons/registro_herramientas.png'),
                        color: GlobalColor.colorIconosPrincipal,
                        size: tamIcon,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                        Text(
                          "Registros de\nherramientas",
                          style: TextStyle(fontSize: tamText),
                        ),),


                      // Text(
                      //   "",
                      //   //maxLines: 1,
                      //   style: TextStyle(
                      //       color: GlobalColor.colorTextSecundario,
                      //       fontFamily: 'ActoBold',
                      //       fontSize: 14),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisibleAlumno,
              child: Container(
                padding: const EdgeInsets.all(7.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ListarMuestras()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2.0,
                  fillColor: GlobalColor.colorCards,
                  padding: const EdgeInsets.all(7.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[


                      ImageIcon(

                        AssetImage('assets/icons/registro.png'),
                        color: GlobalColor.colorIconosPrincipal,
                        size: tamIcon,
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child:
                        Text(
                          "Muestras",
                          style: TextStyle(fontSize: tamText),
                        ),),
                      FittedBox(
                        fit: BoxFit.cover,
                        child:
                        Text(
                          "Listar Muestras",
                          style: TextStyle(fontSize: tamText),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisibleAlumno,
              child: Container(
                padding: const EdgeInsets.all(7.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ListarSiembras()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2.0,
                  fillColor: GlobalColor.colorCards,
                  padding: const EdgeInsets.all(7.0),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[


                      ImageIcon(

                        AssetImage('assets/icons/siembra.png'),
                        color: GlobalColor.colorIconosPrincipal,
                        size: tamIcon,
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child:
                        Text(
                          "Siembra",
                          style: TextStyle(fontSize: tamText),
                        ),),
                      FittedBox(
                        fit: BoxFit.cover,
                        child:
                        Text(
                          "Listar Siembras",
                          style: TextStyle(fontSize: tamText),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
