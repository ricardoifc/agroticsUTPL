import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/view/addprestamo/registroAddPrestamo.dart';
import 'package:flutter/material.dart';

class IdentificarAddPrestamos extends StatefulWidget {
  @override
  _IdentificarAddPrestamosState createState() => _IdentificarAddPrestamosState();
}

class _IdentificarAddPrestamosState extends State<IdentificarAddPrestamos> {
  //Barcode? result;
  late String id_siembra = "Sin elegir";

  final dateNow = DateTime.now();
  var usuario_registro = "admin";

  final _formKey = GlobalKey<FormState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: const Text("Identificar muestra"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                /*Center(
                  child: (result != null)
                      ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                      : Text('ID de herramienta'),

                ),*/
              Container(
                //height: 50,
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                  child: ElevatedButton(
                    //style: style,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => RegistroAddPrestamo()));
                    },
                    child: const Text('Agregar'),
                  ),
              ),
           ]
          )
        ),
    ],
      ),
    )
    )
    );
  }

}
