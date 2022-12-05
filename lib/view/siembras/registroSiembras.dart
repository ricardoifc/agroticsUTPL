import 'dart:convert';
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistroSiembras extends StatefulWidget {
  @override
  _RegistroSiembrasState createState() => _RegistroSiembrasState();
}

class _RegistroSiembrasState extends State<RegistroSiembras> {

  final myController = TextEditingController();


  late String id_ubicacion = "Sin elegir";
  late String text_ubicacion = "Sin elegir";
  late String text_lugar_lote = "Sin elegir";
  late String area_sembrada = "Sin elegir";

//

  late String id_especie = "Sin elegir";
  late String text_nombre = "Sin elegir";
  late String text_nombrecientifico = "Sin elegir";
  late String text_familia = "Sin elegir";
  late String text_genero = "Sin elegir";




  TextEditingController fecha_implem_siembra = TextEditingController();

  final dateNow = DateTime.now();
  var usuario_registro = "admin";

  int index2 = 0;



  void _register() {
    print('addData');
    var url = Uri.parse(conexion() + "siembras/adddatasiembras.php");

    http.post(url, body: {
      'id_ubicacion': id_ubicacion,
      'id_especie': id_especie,
      'fecha_implem_siembra': fecha_implem_siembra.text,
      "fecha_registro": dateNow.toString(),
      "usuario_registro": usuario_registro,
    });
  }



  Future<List> getDataUbicacion() async {
    final response = await http.get(Uri.parse(conexion()+"ubicaciones/getdataubicaciones.php"));
    return json.decode(response.body);
  }

  Future<List> getDataEspecie() async {
    final response = await http.get(Uri.parse(conexion()+"especies/getdataespecie.php"));
    return json.decode(response.body);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Siembra"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Siembra"),

                  Container(
                      width: 340,
                     //height: 50,
                     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: GlobalColor.colorBotonTextPrincipal,
                        color: GlobalColor.colorBotonPrincipal,
                        child: Text("Ubicación"),
                        onPressed: () {
                          _showUbicacionDialog(context);

                        }
                      )),

                  Text("Id: $id_ubicacion"),
                  Text("Ubicacion: $text_ubicacion"),
                  Text("Lugar o Lote: $text_lugar_lote"),


                  Container(
                      width: 340,
                    // height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: GlobalColor.colorBotonTextPrincipal,
                        color: GlobalColor.colorBotonPrincipal,
                        child: Text("Especie"),
                        onPressed: () {
                              _showEspecieDialog(context);
                        }
                      )),

                  Text("Id: $id_especie"),
                  Text("nombre: $text_nombre"),
                  Text("Nombre cientifico: $text_nombrecientifico"),
                  Text("familia: $text_familia"),
                  Text("familia: $text_genero"),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: fecha_implem_siembra,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Fecha de ingreso',
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
                        child: Text('Agregar'),
                        onPressed: () {
                          _register();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      )),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: GlobalColor.colorBotonTextPrincipal,
                        color: GlobalColor.colorBotonPrincipal,
                        child: Text('Salir'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showUbicacionDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) {
      //final _singleNotifier = Provider.of<SingleNotifier>(context);
      return AlertDialog(

        content: FutureBuilder<List>(
          future: getDataUbicacion(),

          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.data != null ? Column(children: <Widget>[
              /*ItemList(
                list: snapshot.requireData,

              )*/
            ListView.builder(
            scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.requireData == null ? 0 : snapshot.requireData.length,
              itemBuilder: (context, i) {
                return Container(
                  padding: const EdgeInsets.all(1.0),
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        id_ubicacion =snapshot.requireData[i]['id'];
                        text_ubicacion =snapshot.requireData[i]['ubicacion'];
                        text_lugar_lote =snapshot.requireData[i]['lugar_lote'];
                        print(id_ubicacion);
                      });
                      Navigator.pop(context);
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          snapshot.requireData[i]['ubicacion'],
                          style: const TextStyle(fontSize: 25.0, color: GlobalColor.colorTextPrincipal),
                        ),

                        subtitle: Text(
                          "Lugar/Lote: \n${snapshot.requireData[i]['lugar_lote']}",
                          style: const TextStyle(fontSize: 20.0, color: GlobalColor.colorTextSecundario),
                        ),

                      ),
                    ),
                  ),
                );
              },
            ),
            ])
                : const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
    },
  );

  _showEspecieDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) {
      //final _singleNotifier = Provider.of<SingleNotifier>(context);
      return AlertDialog(
        content: FutureBuilder<List>(
          future: getDataEspecie(),

          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.data != null ? Column(children: <Widget>[
              /*ItemList(
                list: snapshot.requireData,

              )*/
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.requireData == null ? 0 : snapshot.requireData.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.all(1.0),
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          id_especie = snapshot.requireData[i]['id'];
                          text_nombre = snapshot.requireData[i]['nombre'];
                          text_nombrecientifico = snapshot.requireData[i]['nombrecientifico'];
                          text_familia = snapshot.requireData[i]['familia'];
                          text_genero = snapshot.requireData[i]['genero'];
                        });
                        Navigator.pop(context);
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            snapshot.requireData[i]['nombre'],
                            style: const TextStyle(fontSize: 25.0, color: GlobalColor.colorTextPrincipal),
                          ),

                          subtitle: Text(
                            "Nombre Cientifico: \n${snapshot.requireData[i]['nombrecientifico']}",
                            style: const TextStyle(fontSize: 20.0, color: GlobalColor.colorTextSecundario),
                          ),

                        ),
                      ),
                    ),
                  );
                },
              ),
            ])
                : const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
    },
  );

}
