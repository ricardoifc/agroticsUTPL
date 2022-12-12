import 'dart:async';
import 'dart:convert';
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/siembras/detalleSiembras.dart';
import 'package:agrotics/view/siembras/registroSiembras.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class ListarSiembras extends StatefulWidget {
  @override
  _ListarSiembrasState createState() => new _ListarSiembrasState();
}

class _ListarSiembrasState extends State<ListarSiembras> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse(conexion()+"siembras/getdatasiembras.php"));
    return json.decode(response.body);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Siembras"),
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
                        RegistroSiembras())),
                child: const Card(
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage('assets/icons/add.png'),
                      color: GlobalColor.colorIconosPrincipal,
                      size: 70,
                    ),
                    title: Text(
                      "Agregar\nSiembra",
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

  // Future<List> getDataUbicacion() async {
  //   final response = await http.get(Uri.parse(conexion()+"ubicaciones/getdataubicaciones.php"));
  //   return json.decode(response.body);
  // }
  // Future<String> getDataEspecie() async {
  //   final response = await http.get(Uri.parse(conexion()+"especies/getdataespecie.php"));
  //   var getRequestedData = jsonDecode(response.body);
  //   return getRequestedData;
  // }
  //
  // String getNombreCientifico(String ValorNombre){
  //   String valor;
  //   print("en getNombreCientifico");
  //   valor = "x";
  //   return valor;
  // }


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
                  builder: (BuildContext context) => DetalleSiembras(
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
                  list[i]['id'],
                  style: const TextStyle(fontSize: 25.0, color: GlobalColor.colorTextPrincipal),
                ),
                subtitle: Text(
                  "Fecha de implementación:\n ${list[i]['fecha_implem_siembra']}",
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
