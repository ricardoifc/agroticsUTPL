import 'dart:async';
import 'dart:convert';
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/usuarios/detalleUsuario.dart';
import 'package:agrotics/view/usuarios/registroUsuarios.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ListarUsuario extends StatefulWidget {

  @override
  _ListarUsuarioState createState() => new _ListarUsuarioState();
}

class _ListarUsuarioState extends State<ListarUsuario> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse(conexion() + "getdata.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuarios"),
      ),

      // Aqui consigo lista datos
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.data != null
              ? Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              RegistroUsuario())),
                      child: const Card(
                        child: ListTile(
                          leading: ImageIcon(
                            AssetImage('assets/icons/add.png'),
                            color: GlobalColor.colorIconosPrincipal,
                            size: 70,
                          ),
                          title: Text(
                            "Agregar\nUsuario",
                            style: TextStyle(
                                fontSize: 30.0,
                                color: GlobalColor.colorTextPrincipal),
                          ),


                          trailing: ImageIcon(
                            AssetImage('assets/icons/boton-agregar.png'),
                          ),
                          //isThreeLine: true,
                        ),
                      ),
                    ),
                  ),
                  ItemList(
                    list: snapshot.requireData,
                  )
                ])
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => DetalleUsuario(
                        list: list,
                        index: i,
                      )),
            ),
            child: Card(
              child: ListTile(
                leading: const ImageIcon(
                  AssetImage('assets/icons/user.png'),
                  color: GlobalColor.colorIconosPrincipal,
                  size: 70,
                ),
                title: Text(
                  list[i]['username'],
                  style: const TextStyle(
                      fontSize: 25.0, color: GlobalColor.colorTextPrincipal),
                ),

                subtitle: Text(
                  "rol : ${list[i]['rol']}",
                  style: const TextStyle(
                      fontSize: 20.0, color: GlobalColor.colorTextSecundario),
                ),
                trailing: ImageIcon(
                  AssetImage('assets/icons/edit.png'),
                ),
                //isThreeLine: true,
              ),
            ),
          ),
        );
      },
    );
  }
}
