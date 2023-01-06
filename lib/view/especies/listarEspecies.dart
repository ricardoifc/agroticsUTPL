import 'dart:async';
import 'dart:convert';
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/especies/detalleEspecies.dart';
import 'package:agrotics/view/especies/registroEspecies.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ListarEspecie extends StatefulWidget {
  @override
  _ListarEspecieState createState() => new _ListarEspecieState();
}

class _ListarEspecieState extends State<ListarEspecie> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse("${conexion()}especies/getdataespecie.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: const Text("Especies"),
      ),
      // Aqui consigo lista datos
      body: FutureBuilder<List>(
        future: getData(),

        builder: (context, snapshot) {
          return snapshot.data != null ? Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        RegistroEspecie())),
                child: const Card(
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage('assets/icons/add.png'),
                      color: GlobalColor.colorIconosPrincipal,
                      size: 70,
                    ),
                    title: Text(
                      "Agregar\nEspecie",
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
  const ItemList({required this.list});

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
                      builder: (BuildContext context) => DetalleEspecie(
                            list: list,
                            index: i,
                          )),
                ),
            child: Card(
              child: ListTile(

                leading: const
                ImageIcon(

                  AssetImage('assets/icons/plant.png'),
                  color: GlobalColor.colorIconosPrincipal,
                  size: 60.0,
                ),
                title: Text(
                  list[i]['nombre'],
                  style: const TextStyle(fontSize: 25.0, color: GlobalColor.colorTextPrincipal),
                ),

                subtitle: Text(
                  "Nombre cientifico : \n${list[i]['nombrecientifico']}",
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
