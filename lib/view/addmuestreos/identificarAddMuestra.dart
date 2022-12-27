import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/view/addmuestreos/registroMuestra.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class IdentificarAddMuestras extends StatelessWidget {
  var username;
  var rol;
  var getResult = 'sin datos';

  IdentificarAddMuestras({required this.username, required this.rol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: const Text("Nueva muestra"),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    //style: style,
                    onPressed: () async {
                      try {
                        final qrCode = await FlutterBarcodeScanner.scanBarcode(
                            '#ff6666', 'Cancelar', true, ScanMode.QR);

                        //if (!mounted) return;
                        getResult = qrCode;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistroMuestra(username: username, rol:rol ,idSiembra: getResult),
                          ),
                        );
                        print(qrCode);
                      } on PlatformException {
                        getResult = 'Error al escaneár codigo QR.';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: GlobalColor.colorBotonPrincipal,
                    ),
                    child: const Text('Escanear Siembra'),
                  ),
                ),
                Text("Id de siembra: $getResult"),


              ],
            ),
          ),
        ),
      ),
    );
  }

}
