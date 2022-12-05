import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/muestreos/editarMuestras.dart';
import 'package:agrotics/view/muestreos/listarMuestras.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DetalleMuestras extends StatefulWidget {
  List list;
  int index;
  DetalleMuestras({required this.index,required this.list});
  @override
  _DetalleMuestrasState createState() => _DetalleMuestrasState();
}

class _DetalleMuestrasState extends State<DetalleMuestras> {

void deleteData(){
  var url=Uri.parse(conexion()+"muestras/deleteDatamuestras.php");
  http.post(url, body: {
    'id': widget.list[widget.index]['id']
  });
}

void confirm (){

  AlertDialog alertDialog = AlertDialog(
    content: Text("Esta seguto de eliminar '${widget.list[widget.index]['fecha_muestreo']}'"),
    actions: <Widget>[
      RaisedButton(
        child: const Text("Si!",style: const TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
          deleteData();
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ListarMuestras(),));
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
      appBar: AppBar(title: Text("${widget.list[widget.index]['fecha_muestreo']}")),
      body: Container(
        height: 700.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(

         // child: Center(
            child: Column(
              children: <Widget>[
                Text(widget.list[widget.index]['fecha_muestreo'], style: const TextStyle(fontSize: 20.0),),
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
                      Text("indentificador : ${widget.list[widget.index]['id']}", style: const TextStyle(fontSize: 14.0),),
                      Text("identificador de siembra : ${widget.list[widget.index]['id_siembra']}", style: const TextStyle(fontSize: 14.0),),
                      Text("fecha de muestreo : ${widget.list[widget.index]['fecha_muestreo']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Altura (cm) : ${widget.list[widget.index]['altura']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Díametro (cm) : ${widget.list[widget.index]['diametro']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Nro de racimos : ${widget.list[widget.index]['nro_racimos']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Nro Flores/racimo : ${widget.list[widget.index]['nro_flores_racimos']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Nro Flores totales planta : ${widget.list[widget.index]['nro_flores_totales']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Nro frutos/racimo : ${widget.list[widget.index]['nro_frutos_racimos']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Nro frutos totales planta : ${widget.list[widget.index]['nro_frutos_totales']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Longitud fruto (cm) : ${widget.list[widget.index]['longitud_fruto']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Diametro fruto (cm) : ${widget.list[widget.index]['diametro_fruto']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Peso del fruto (g) : ${widget.list[widget.index]['peso_fruto']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Producción/planta (kg) : ${widget.list[widget.index]['produccion_planta']}", style: const TextStyle(fontSize: 14.0),),
                      Text("pH suelo : ${widget.list[widget.index]['ph_suelo']}", style: const TextStyle(fontSize: 14.0),),
                      Text("MO % : ${widget.list[widget.index]['mo']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Nitrógeno (%) : ${widget.list[widget.index]['nitrogeno']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Fósforo (mg/hg) : ${widget.list[widget.index]['fosforo']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Potasio (Cmol/kg) : ${widget.list[widget.index]['potasio']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Otros elementos  : ${widget.list[widget.index]['otros_elementos']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Temperatura (°C) : ${widget.list[widget.index]['temperatura']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Humedad relativa (%) : ${widget.list[widget.index]['humedad_relativa']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Riego/lluvia (mL/planta) : ${widget.list[widget.index]['riego_lluvia']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Fertilización/fertilizante/abono : ${widget.list[widget.index]['fertiliza_abono']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Cantidad : ${widget.list[widget.index]['cantidad_fertiliza']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Fechas de aplicación de fertilizante  : ${widget.list[widget.index]['fechas_aplic_fertiliza']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Control de plagas y enfermedades/poducto : ${widget.list[widget.index]['control_plag_enferm']}", style: const TextStyle(fontSize: 14.0),),
                      Text("Cantidad : ${widget.list[widget.index]['cantidad_control_plag']}", style: const TextStyle(fontSize: 14.0),),
                      Text("fecha de aplicación  : ${widget.list[widget.index]['fecha_aplicacion']}", style: const TextStyle(fontSize: 14.0),),
                      Text("fecha de aplicación  : ${widget.list[widget.index]['observaciones']}", style: const TextStyle(fontSize: 14.0),),
                      Text("x : ${widget.list[widget.index]['fecha_registro']}", style: const TextStyle(fontSize: 14.0),),
                      Text("x : ${widget.list[widget.index]['usuario_registro']}", style: const TextStyle(fontSize: 14.0),),


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
                            builder: (BuildContext context)=>EditarMuestras(list: widget.list, index: widget.index,),
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