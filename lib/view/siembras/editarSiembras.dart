import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarSiembras extends StatefulWidget {
  final List list;
  final int index;

  EditarSiembras({required this.list, required this.index});

  @override
  _EditarSiembrasState createState() => _EditarSiembrasState();
}

class _EditarSiembrasState extends State<EditarSiembras> {
  TextEditingController id_ubicacion = TextEditingController();
  TextEditingController id_especie = TextEditingController();
  TextEditingController fecha_implem_siembra = TextEditingController();

  void editData() {
    print("editespecies.php");
    var url = Uri.parse(conexion() + "siembras/editdatasiembras.php");
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "id_ubicacion": id_ubicacion.text,
      "id_especie": id_especie.text,
      "fecha_implem_siembra": fecha_implem_siembra.text,




    });
  }

  @override
  void initState() {
    id_ubicacion= TextEditingController(text: widget.list[widget.index]['id_ubicacion'] );
    id_especie= TextEditingController(text: widget.list[widget.index]['id_especie'] );
    fecha_implem_siembra= TextEditingController(text: widget.list[widget.index]['fecha_implem_siembra'] );

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
        controller: id_ubicacion,
          validator: (value) {
            if (value == null) return 'Ingresa Nombre herramienta' ;
          },
          decoration: const InputDecoration(
            hintText: 'Nombre herramienta', labelText: 'Nombre herramienta',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: id_especie,
          validator: (value) {
            if (value == null) return 'Ingresa Disponibilidad' ;
          },
          decoration: const InputDecoration(
            hintText: 'Disponibilidad', labelText: 'Disponibilidad',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: fecha_implem_siembra,
          validator: (value) {
            if (value == null) return 'Ingresa Fecha de ingreso' ;
          },
          decoration: const InputDecoration(
            hintText: 'Fecha de ingreso', labelText: 'Fecha de ingreso',
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
