import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/view/addmuestreos/registroAddMuestras2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class IdentificarAddMuestras extends StatefulWidget {
  @override
  _IdentificarAddMuestrasState createState() => _IdentificarAddMuestrasState();
}

class _IdentificarAddMuestrasState extends State<IdentificarAddMuestras> {
  var getResult = 'sin datos';
  late String id_siembra = "Sin elegir";

  final dateNow = DateTime.now();
  var usuario_registro = "admin";

  final _formKey = GlobalKey<FormState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var texto = "x";
  final dataR = Data(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: const Text("Nueva muestra"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    scanQRCode();
                  },
                  child: Text('Escanear Siembra'),
                  style: ElevatedButton.styleFrom(
                    primary:
                        GlobalColor.colorBotonPrincipal, // Background color
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("ID de siembra:"),
                Text(getResult),
                Container(
                  //height: 50,
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                  child: ElevatedButton(
                      //style: style,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistroAddMuestras2(
                                    data: dataR,
                                  )),
                        );
                      },
                      child: const Text('Agregar'),
                      style: ElevatedButton.styleFrom(
                        primary: GlobalColor.colorBotonPrincipal,
                      )),
                ),
              ])),
        ),
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
        Data(text: getResult);
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Error al escaneár codigo QR.';
    }
  }
}

class Data {
  String text;
  Data({required this.text});

  void set texto(String texto) {
    text = texto;
  }
}
