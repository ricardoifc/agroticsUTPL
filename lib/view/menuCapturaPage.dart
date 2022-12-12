import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/view/addmuestreos/identificarAddMuestra.dart';
import 'package:agrotics/view/addprestamo/identificarAddPrestamo.dart';
import 'package:agrotics/view/herramienta_logs/listarHerramienta_logs.dart';
import 'package:agrotics/view/herramientas/listarHerramientas.dart';
import 'package:agrotics/view/muestreos/listarMuestras.dart';
import 'package:agrotics/view/siembras/listarSiembras.dart';
import 'package:agrotics/view/ubicaciones/listarUbicaciones.dart';
import 'package:agrotics/view/usuarios/listarUsuario.dart';
import 'package:flutter/material.dart';
import 'especies/listarEspecies.dart';


class MenuCapturaPage extends StatelessWidget {
  const MenuCapturaPage({required this.username, required this.rol});
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
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: const Text('Menu'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          /*IconButton(
            icon: const Icon(
              Icons.exit_to_app,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),*/
        ],
      ),
      //backgroundColor: Colors.grey,
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          children: <Widget>[

            Visibility(
              visible: isVisibleAlumno,
              child: Container(
                padding: const EdgeInsets.all(7.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => IdentificarAddMuestras()));
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

                        AssetImage('assets/icons/captura-de-datos.png'),
                        color: GlobalColor.colorIconosPrincipal,
                        size: tamIcon,
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child:
                        Text(
                          "Capturar muestra",
                          style: TextStyle(fontSize: tamText),
                        ),),
                      FittedBox(
                        fit: BoxFit.cover,
                        child:
                        Text(
                          "Añade una nueva muestra",
                          style: TextStyle(fontSize: tamText),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /*Visibility(
              visible: isVisibleAlumno,
              child: Container(
                padding: const EdgeInsets.all(7.0),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => IdentificarAddPrestamos()));
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
                        fit: BoxFit.cover,
                        child:
                        Text(
                          "Prestamo Herramienta",
                          style: TextStyle(fontSize: tamText),
                        ),),
                      FittedBox(
                        fit: BoxFit.cover,
                        child:
                        Text(
                          "Prestamo de herramienta",
                          style: TextStyle(fontSize: tamText),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),*/

          ]),
    );
  }
}

/*
Visibility(
          visible: menu2,
          child: Expanded(
            child: ListView(
              children: <Widget>[
              Visibility(
              visible: isVisibleDocente,
              child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ListarUsuario()));
                    },
                    leading: const Icon(
                      TablerIcons.users,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      "Usuarios",
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                    subtitle: const Text(
                      "Lista de usuarios",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
              ),
            Visibility(
              visible: isVisibleAlumno,
              child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ListarEspecie()));
                    },
                    leading: const Icon(
                      TablerIcons.plant,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      "Especies",
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                    subtitle: const Text(
                      "Lista de especies",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
            ),
            Visibility(
              visible: isVisibleAlumno,
              child: Card(
                  child: ListTile(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         ListarUsuariosPage()));
                    },
                    leading: const Icon(
                      Icons.landscape,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      "Campo",
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                    subtitle: const Text(
                      "Lista de herramientas",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
            ),
            Visibility(
              visible: isVisibleAlumno,
              child: Card(
                  child: ListTile(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         ListarUsuariosPage()));
                    },
                    leading: const Icon(
                      TablerIcons.tool,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      "Herramientas",
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                    subtitle: const Text(
                      "Lista de campos",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),

            ),
                Card(
                  child: ListTile(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         ListarUsuariosPage()));
                    },
                    leading: const Icon(
                      TablerIcons.circle,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      "...",
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                    subtitle: const Text(
                      "...",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         ListarUsuariosPage()));
                    },
                    leading: const Icon(
                      TablerIcons.circle,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      "...",
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                    subtitle: const Text(
                      "...",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         ListarUsuariosPage()));
                    },
                    leading: const Icon(
                      TablerIcons.circle,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      "...",
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                    subtitle: const Text(
                      "...",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         ListarUsuariosPage()));
                    },
                    leading: const Icon(
                      TablerIcons.circle,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      "...",
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                    subtitle: const Text(
                      "...",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         ListarUsuariosPage()));
                    },
                    leading: const Icon(
                      TablerIcons.circle,
                      size: 60.0,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      "...",
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                    subtitle: const Text(
                      "...",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]
      ),
    );
  }
}
*/
