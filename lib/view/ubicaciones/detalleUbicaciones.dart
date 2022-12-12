import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/ubicaciones/editarUbicaciones.dart';import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DetalleUbicaciones extends StatefulWidget {
  List list;
  int index;
  DetalleUbicaciones({required this.index,required this.list});
  @override
  _DetalleUbicacionesState createState() => _DetalleUbicacionesState();
}

class _DetalleUbicacionesState extends State<DetalleUbicaciones> {

void deleteData(){
  var url=Uri.parse(conexion()+"ubicaciones/deleteDataubicaciones.php");
  http.post(url, body: {
    'id': widget.list[widget.index]['id']
  });
}

void confirm (){

  AlertDialog alertDialog = AlertDialog(
    content: Text("Esta seguto de eliminar '${widget.list[widget.index]['lugar_lote']}'"),
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
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(title: Text("${widget.list[widget.index]['ubicacion']}")),
      body: Container(
        height: 700.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(

         // child: Center(
            child: Column(
              children: <Widget>[
                Text(widget.list[widget.index]['ubicacion'], style: const TextStyle(fontSize: 20.0),),
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
                      Text("Ubicación : ${widget.list[widget.index]['ubicacion']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Lugar/Lote : ${widget.list[widget.index]['lugar_lote']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Área sembrada : ${widget.list[widget.index]['area_sembrada']}", style: const TextStyle(fontSize: 14.0),),
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
                            builder: (BuildContext context)=>EditarUbicaciones(list: widget.list, index: widget.index,),
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