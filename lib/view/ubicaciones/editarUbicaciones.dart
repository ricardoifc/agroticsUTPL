import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarUbicaciones extends StatefulWidget {
  final List list;
  final int index;

  EditarUbicaciones({required this.list, required this.index});

  @override
  _EditarUbicacionesState createState() => _EditarUbicacionesState();
}

class _EditarUbicacionesState extends State<EditarUbicaciones> {
  TextEditingController ubicacion = TextEditingController();
  TextEditingController lugar_lote = TextEditingController();
  TextEditingController area_sembrada = TextEditingController();



  void editData() {
    print("editdataubicaciones.php");
    var url = Uri.parse(conexion() + "ubicaciones/editdataubicaciones.php");
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "ubicacion": ubicacion.text,
      "lugar_lote": lugar_lote.text,
      "area_sembrada": area_sembrada.text,



    });
  }

  @override
  void initState() {
    ubicacion= TextEditingController(text: widget.list[widget.index]['ubicacion'] );
    lugar_lote= TextEditingController(text: widget.list[widget.index]['lugar_lote'] );
    area_sembrada= TextEditingController(text: widget.list[widget.index]['area_sembrada'] );






    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: const Text("EDITAR"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Column(
              children: <Widget>[

        ListTile(
        title: TextFormField(
        controller: ubicacion,
          validator: (value) {
            if (value == null) return 'Ingresa Ubicación' ;
          },
          decoration: const InputDecoration(
            hintText: 'Ubicación', labelText: 'Ubicación',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: lugar_lote,
          validator: (value) {
            if (value == null) return 'Ingresa Lugar/Lote' ;
          },
          decoration: const InputDecoration(
            hintText: 'Lugar/Lote', labelText: 'Lugar/Lote',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: area_sembrada,
          validator: (value) {
            if (value == null) return 'Ingresa Área sembrada' ;
          },
          decoration: const InputDecoration(
            hintText: 'Área sembrada', labelText: 'Área sembrada',
          ),
        ),
      ),



      const Divider(
                  height: 1.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("Guardar"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
