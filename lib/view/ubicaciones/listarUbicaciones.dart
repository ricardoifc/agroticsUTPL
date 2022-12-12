import 'dart:async';
import 'dart:convert';
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/ubicaciones/detalleUbicaciones.dart';
import 'package:agrotics/view/ubicaciones/registroUbicaciones.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListarUbicaciones extends StatefulWidget {
  @override
  _ListarUbicacionesState createState() => new _ListarUbicacionesState();
}

class _ListarUbicacionesState extends State<ListarUbicaciones> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse(conexion()+"ubicaciones/getdataubicaciones.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: const Text("Ubicaciones"),
      ),
      // Aqui consigo lista datos
      body: FutureBuilder<List>(
        future: getData(),

        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.data != null ? Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        RegistroUbicaciones())),
                child: const Card(
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage('assets/icons/add.png'),
                      color: GlobalColor.colorIconosPrincipal,
                      size: 70,
                    ),
                    title: Text(
                      "Agregar\nUbicación",
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
                      builder: (BuildContext context) => DetalleUbicaciones(
                            list: list,
                            index: i,
                          )),
                ),
            child: Card(
              child: ListTile(

                leading: const ImageIcon(

                  AssetImage('assets/icons/gardening-tools.png'),
                  color: GlobalColor.colorIconosPrincipal,
                  size: 60.0,
                ),
                title: Text(
                  list[i]['ubicacion'],
                  style: const TextStyle(fontSize: 25.0, color: GlobalColor.colorTextPrincipal),
                ),

                subtitle: Text(
                  "Lugar/Lote: \n${list[i]['lugar_lote']}",
                  style: const TextStyle(fontSize: 20.0, color: GlobalColor.colorTextSecundario),
                ),

              ),
            ),
          ),
        );
      },
    );
  }
}
