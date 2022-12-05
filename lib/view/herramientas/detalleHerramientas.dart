import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/herramientas/editarHerramientas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DetalleHerramienta extends StatefulWidget {
  List list;
  int index;
  DetalleHerramienta({required this.index,required this.list});
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
      RaisedButton(
        child: const Text("Si!",style: const TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
          deleteData();
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
      RaisedButton(
        child: const Text("CANCELAR",style: const TextStyle(color: Colors.black)),
        color: Colors.green,
        onPressed: ()=> Navigator.pop(context),
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
                    RaisedButton(
                      color: GlobalColor.colorBotonPrincipal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: ()=>Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context)=>EditarHerramienta(list: widget.list, index: widget.index,),
                          )
                      ),
                      child: const Text("EDITAR",style: TextStyle(
                          color: GlobalColor.colorBotonTextPrincipal
                      ),),
                    ),
                    const VerticalDivider(),
                    RaisedButton(
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: (

                          )=>confirm(),
                      child: const Text("ELIMINAR",style: TextStyle(
                          color: GlobalColor.colorBotonTextPrincipal
                      ),),
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
}