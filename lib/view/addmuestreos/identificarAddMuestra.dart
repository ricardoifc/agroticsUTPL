import 'dart:io';

import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/view/addmuestreos/registroAddMuestras.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class IdentificarAddMuestras extends StatefulWidget {
  @override
  _IdentificarAddMuestrasState createState() => _IdentificarAddMuestrasState();
}

class _IdentificarAddMuestrasState extends State<IdentificarAddMuestras> {
  Barcode? result;
  late String id_siembra = "Sin elegir";

  final dateNow = DateTime.now();
  var usuario_registro = "admin";

  final _formKey = GlobalKey<FormState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;

  void _register() {}

  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Identificar muestra"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  // overlay: QrScannerOverlayShape(
                  //   borderRadius: 10,
                  //   borderWidth: 5,
                  //   borderColor: Colors.white,
                  // ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: (result != null)
                      ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                      : Text('Scan a code'),
                ),
              )
              /*Expanded(child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text("ID:"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(id_siembra),
                    ),

                    Container(
                      //height: 50,
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: RaisedButton(
                          textColor: GlobalColor.colorBotonTextPrincipal,
                          color: GlobalColor.colorBotonPrincipal,
                          child: Text('Agregar'),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => RegistroAddMuestras()));
                            //Navigator.pop(context);
                          },
                        )),
                  ]
              ),*/
             // ),
              // ListView(
              //   children: <Widget>[
              //
              //     Column(
              //       children: <Widget>[
              //
              //         // QRView(
              //         //   cameraFacing: CameraFacing.back,
              //         //   key: qrKey,
              //         //   onQRViewCreated: _onQRViewCreated,
              //         //   overlay: QrScannerOverlayShape(
              //         //     borderRadius: 10,
              //         //     borderWidth: 5,
              //         //     borderColor: Colors.white,
              //         //   ),
              //         //),
              //         Row(
              //             children: <Widget>[
              //               Container(
              //                 padding: const EdgeInsets.all(10),
              //                 child: Text("ID:"),
              //               ),
              //               Container(
              //                 padding: const EdgeInsets.all(10),
              //               child: Text(id_siembra),
              //               ),
              //
              //               Container(
              //                   //height: 50,
              //                   padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              //                   child: RaisedButton(
              //                     textColor: GlobalColor.colorBotonTextPrincipal,
              //                     color: GlobalColor.colorBotonPrincipal,
              //                     child: Text('Agregar'),
              //                     onPressed: () {
              //                       _register();
              //                       Navigator.pop(context);
              //                       //Navigator.pop(context);
              //                     },
              //                   )),
              //           ]
              //         ),
              //
              //       ],
              //     ),
              //   ],
              // ),

            ]
            )
        ),
      ),
    );
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


}
