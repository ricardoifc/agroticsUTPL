import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/siembras/editarSiembras.dart';
import 'package:agrotics/view/siembras/listarSiembras.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class DetalleSiembras extends StatefulWidget {
  List list;
  int index;
  DetalleSiembras({required this.index, required this.list});
  @override
  _DetalleSiembrasState createState() => _DetalleSiembrasState();
}

class _DetalleSiembrasState extends State<DetalleSiembras> {
  final key = GlobalKey();
  File? file;

  void deleteData() {
    var url = Uri.parse(conexion() + "siembras/deleteDatasiembras.php");
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Esta seguto de eliminar '${widget.list[widget.index]['nombre']}'"),
      actions: <Widget>[
        RaisedButton(
          child: const Text(
            "Si!",
            style: const TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ListarSiembras(),
            ));
          },
        ),
        RaisedButton(
          child: const Text("CANCELAR",
              style: const TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: context, builder: (ctx) => alertDialog);
    //showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${widget.list[widget.index]['fecha_implem_siembra']}")),
      body: Container(
        height: 700.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          // child: Center(
          child: Column(
            children: <Widget>[
              Text(
                widget.list[widget.index]['fecha_implem_siembra'],
                style: const TextStyle(fontSize: 20.0),
              ),
              const Divider(),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 50.0,
                  maxHeight: 420,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    RaisedButton(
                      color: GlobalColor.colorBotonPrincipal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        _showQRGeneratorDialog(
                            list: widget.list, index: widget.index);
                      },
                      child: const Text(
                        "Generar QR",
                        style: TextStyle(
                            color: GlobalColor.colorBotonTextPrincipal),
                      ),
                    ),

                    //const Padding(padding: EdgeInsets.only(top: 10.0),),
                    Text(
                      "Identificador : ${widget.list[widget.index]['id']}",
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      "Ubicación id: ${widget.list[widget.index]['id_ubicacion']}",
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      "Especie id: ${widget.list[widget.index]['id_especie']}",
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      "Fecha de siembra : ${widget.list[widget.index]['fecha_implem_siembra']}",
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      "Fecha registro : ${widget.list[widget.index]['fecha_registro']}",
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      "usuario registro : ${widget.list[widget.index]['usuario_registro']}",
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              const Divider(),
              //const Padding(padding: EdgeInsets.only(top: 20.0),),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                    color: GlobalColor.colorBotonPrincipal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => EditarSiembras(
                        list: widget.list,
                        index: widget.index,
                      ),
                    )),
                    child: const Text(
                      "EDITAR",
                      style:
                          TextStyle(color: GlobalColor.colorBotonTextPrincipal),
                    ),
                  ),
                  const VerticalDivider(),
                  RaisedButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () => confirm(),
                    child: const Text(
                      "ELIMINAR",
                      style:
                          TextStyle(color: GlobalColor.colorBotonTextPrincipal),
                    ),
                  ),
                ],
              )
            ],
            // ),
          ),
        ),
      ),
    );
  }

  _showQRGeneratorDialog({required List list, required int index}) =>
      showDialog(
        context: context,
        builder: (context) {
          print(list[index]["id"]);
          //final _singleNotifier = Provider.of<SingleNotifier>(context);
          return AlertDialog(
            title: const Text("QR Generado"),
            content: Column(children: [
              RepaintBoundary(
                key: key,
                child: Container(
                    color: Colors.white,
                    child: Column(children: <Widget>[
                      /*QrImage(
                          //size: 200,//size of the QrImage widget.
                          data: list[index]["id"],//textdata used to create QR code

                        ),*/
                      Text(
                        list[index]["id"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Fecha de siembra : ${widget.list[widget.index]['fecha_implem_siembra']}",
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ])),
              ),
              ElevatedButton(
                child: Text('Exportar QR'),
                onPressed: () async {
                  try {
                    RenderRepaintBoundary boundary = key.currentContext!
                        .findRenderObject() as RenderRepaintBoundary;
//captures qr image
                    var image = await boundary.toImage();

                    ByteData? byteData =
                        await image.toByteData(format: ImageByteFormat.png);

                    Uint8List pngBytes = byteData!.buffer.asUint8List();
//app directory for storing images.
                    final appDir = await getApplicationDocumentsDirectory();
//current time
                    var datetime = DateTime.now();
//qr image file creation
                    file = await File('${appDir.path}/$datetime.png').create();
//appending data
                    await file?.writeAsBytes(pngBytes);
//Shares QR image
                    await Share.shareFiles(
                      [file!.path],
                      mimeTypes: ["image/png"],
                      text: "Share the QR Code",
                    );
                  } catch (e) {
                    print(e.toString());
                  }
                },
              )
            ]),
          );
        },
      );
}
