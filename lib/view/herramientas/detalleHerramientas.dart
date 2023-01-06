/*
import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/herramientas/editarHerramientas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DetalleHerramienta extends StatefulWidget {
  List list;
  int index;
  DetalleHerramienta({Key? key, required this.index,required this.list}) : super(key: key);
  @override
  _DetalleHerramientaState createState() => _DetalleHerramientaState();
}

class _DetalleHerramientaState extends State<DetalleHerramienta> {

void deleteData(){
  var url=Uri.parse(conexion()+"herramientas/deleteDataherramientas.php");
  http.post(url, body: {
    'id': widget.list[widget.index]['id']
  });
}

void confirm (){

  AlertDialog alertDialog = AlertDialog(
    content: Text("Esta seguto de eliminar '${widget.list[widget.index]['herramienta']}'"),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          deleteData();
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: GlobalColor.colorBotonPrincipal,
        ),
        child: const Text('Si!'),
      ),
      ElevatedButton(
        onPressed: ()=> Navigator.pop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: GlobalColor.colorBotonPrincipal,
        ),
        child: const Text('CANCELAR'),
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (ctx) => alertDialog);
  //showDialog(context: context, child: alertDialog);
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(title: Text("${widget.list[widget.index]['herramienta']}")),
      body: Container(
        height: 700.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(

         // child: Center(
            child: Column(
              children: <Widget>[
                Text(widget.list[widget.index]['herramienta'], style: const TextStyle(fontSize: 20.0),),
                const Divider(),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 50.0,
                    maxHeight: 420,
                  ),

                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      //const Padding(padding: EdgeInsets.only(top: 10.0),),
                      Text("Identificador : ${widget.list[widget.index]['id']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Nombre herramienta : ${widget.list[widget.index]['herramienta']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Disponibilidad : ${widget.list[widget.index]['disponibilidad']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Fecha de ingreso : ${widget.list[widget.index]['fecha_alta']}", style: const TextStyle(fontSize: 14.0),),
                      Text("fecha de salida : ${widget.list[widget.index]['fecha_baja']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Estado que se encuentra : ${widget.list[widget.index]['estado_herramienta']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Fecha registro : ${widget.list[widget.index]['fecha_registro']}", style: const TextStyle(fontSize: 14.0),),
                      Text("usuario registro : ${widget.list[widget.index]['usuario_registro']}", style: const TextStyle(fontSize: 14.0),),



                    ],
                  ),
                ),
                const Divider(),
                //const Padding(padding: EdgeInsets.only(top: 20.0),),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: ()=>Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context)=>EditarHerramienta(list: widget.list, index: widget.index,),
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColor.colorBotonPrincipal,
                      ),
                      child: const Text('EDITAR'),
                    ),
                    const VerticalDivider(),
                    ElevatedButton(
                      onPressed: ()=>confirm(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColor.colorBotonPrincipal,
                      ),
                      child: const Text('ELIMINAR'),
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
}*/
