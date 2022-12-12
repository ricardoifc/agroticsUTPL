import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/usuarios/editarUsuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class DetalleUsuario extends StatefulWidget {
  List list;
  int index;
  DetalleUsuario({required this.index,required this.list});
  @override
  _DetalleUsuarioState createState() => _DetalleUsuarioState();
}

class _DetalleUsuarioState extends State<DetalleUsuario> {

void deleteData(){
  var url=Uri.parse(conexion()+"deleteData.php");
  http.post(url, body: {
    'id': widget.list[widget.index]['id']
  });
}

void confirm (){

  AlertDialog alertDialog = AlertDialog(
    content: Text("Esta seguto de eliminar '${widget.list[widget.index]['username']}'"),
    actions: <Widget>[
      RaisedButton(
        child: const Text("OK Eliminado!",style: const TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
          deleteData();
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ListarUsuario(),));
        },
      ),
      RaisedButton(
        child: const Text("CANCELAR",style: const TextStyle(color: GlobalColor.colorBotonTextPrincipal)),
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
      appBar: AppBar(title: Text("${widget.list[widget.index]['username']}")),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
            child: Column(
              children: <Widget>[

                const Padding(padding: EdgeInsets.only(top: 1.0),),
                Text(widget.list[widget.index]['username'], style: const TextStyle(fontSize: 20.0),),
                const Divider(),
                Text("rol : ${widget.list[widget.index]['rol']}\nRegistrado por: ${widget.list[widget.index]['usuario_registro']}\n${widget.list[widget.index]['fecha_registro']}", style: const TextStyle(fontSize: 18.0),),
                const Padding(padding: EdgeInsets.only(top: 30.0),),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                    color: GlobalColor.colorBotonPrincipal,
                    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                    onPressed: ()=>Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context)=>EditarUsuario(list: widget.list, index: widget.index,),
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
            ),
          ),

      ),
    );
  }
}