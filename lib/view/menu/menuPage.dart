import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/view/addmuestreos/listarMuestras.dart';
import 'package:agrotics/view/addmuestreos/registroMuestra.dart';
import 'package:agrotics/view/addmuestreos/subirMuestras.dart';
import 'package:agrotics/view/menu/menuGestionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';


class MenuPage extends StatelessWidget {
  MenuPage({required this.username, required this.rol});
  final String username;
  final String rol;
  var getResult = 'error';

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
    double tamIcon = 60;
    double tamText = 14;
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: Text("Bienvenido $username"),
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
            visible: isVisibleAlumno,
            child: Container(
              padding: const EdgeInsets.all(7.0),
              child: RawMaterialButton(
                onPressed: () async {
                  try {
                    final qrCode = await FlutterBarcodeScanner.scanBarcode(
                        '#76A007', 'Cancelar', true, ScanMode.QR);
                    getResult = qrCode;
                    var resultBool = isNumeric(getResult);
                    print("resultBool resultBool resultBool");
                    print(resultBool);
                    if(resultBool != false){
                      var resultInt = int.parse(getResult);
                      print(resultInt);
                      if (resultInt >= 1000000 && resultInt <= 1999999) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistroMuestra(
                                username: username,
                                rol: rol,
                                idSiembra: getResult
                            ),
                          ),
                        );
                      } else {
                        errorScan(context);
                        getResult = 'error';
                      }
                    }else {
                      errorScan(context);
                      getResult = 'error';
                    }
                  } on PlatformException {
                    getResult = 'error';
                    errorScan(context);
                  }
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
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Captura de datos",
                        style: TextStyle(fontSize: tamText),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Captura de muestras",
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
                      builder: (BuildContext context) =>
                          const ListaMuestras()));
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
                      child: Text(
                        "Editar Muestras",
                        style: TextStyle(fontSize: tamText),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        "Datos Locales",
                        style: TextStyle(fontSize: tamText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: isVisibleDocente,
            child: Container(
              padding: const EdgeInsets.all(7.0),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          SubirMuestras()));
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
                      AssetImage('assets/icons/gestion.png'),
                      color: GlobalColor.colorIconosPrincipal,
                      size: tamIcon,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Subir Muestras",
                        style: TextStyle(fontSize: tamText),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Agregar al reposotiio",
                        style: TextStyle(fontSize: tamText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: isVisibleDocente,
            child: Container(
              padding: const EdgeInsets.all(7.0),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MenuGestionPage(username: username, rol: rol)));
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
                      AssetImage('assets/icons/gestion.png'),
                      color: GlobalColor.colorIconosPrincipal,
                      size: tamIcon,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Gestion de datos",
                        style: TextStyle(fontSize: tamText),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Especies, Ubicacion, etc",
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
        ],
      ),
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
  void errorScan(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("QR incorrecto"),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Continuar'),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: GlobalColor.colorBotonPrincipal),
              ),
            ],
          );
        },
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
