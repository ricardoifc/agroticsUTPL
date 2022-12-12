import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:agrotics/view/especies/editarEspecies.dart';
import 'package:agrotics/view/especies/listarEspecies.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class DetalleEspecie extends StatefulWidget {
  List list;
  int index;
  DetalleEspecie({required this.index,required this.list});
  @override
  _DetalleEspecieState createState() => _DetalleEspecieState();
}

class _DetalleEspecieState extends State<DetalleEspecie> {

void deleteData(){
  var url=Uri.parse(conexion()+"especies/deleteDataespecie.php");
  http.post(url, body: {
    'id': widget.list[widget.index]['id']
  });
}

void confirm (){

  AlertDialog alertDialog = AlertDialog(
    content: Text("Esta seguto de eliminar '${widget.list[widget.index]['nombre']}'"),
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
            builder: (BuildContext context) => ListarEspecie(),));
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
      appBar: AppBar(title: Text("${widget.list[widget.index]['nombre']}")),
      body: Container(
        height: 700.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(

         // child: Center(
            child: Column(
              children: <Widget>[
                Text(widget.list[widget.index]['nombre'], style: const TextStyle(fontSize: 20.0),),
                const Divider(),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 50.0,
                    maxHeight: 400,
                  ),

                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      //const Padding(padding: EdgeInsets.only(top: 10.0),),
                      Text("id : ${widget.list[widget.index]['id']}", style: const TextStyle(fontSize: 14.0),),
                      Text("nombre : ${widget.list[widget.index]['nombre']}", style: const TextStyle(fontSize: 14.0),),
                      Text("nombrecientifico : ${widget.list[widget.index]['nombrecientifico']}", style: const TextStyle(fontSize: 14.0),),
                      Text("familia : ${widget.list[widget.index]['familia']}", style: const TextStyle(fontSize: 14.0),),
                      Text("genero : ${widget.list[widget.index]['genero']}", style: const TextStyle(fontSize: 14.0),),
                      Text("especie : ${widget.list[widget.index]['especie']}", style: const TextStyle(fontSize: 14.0),),
                      Text("origen : ${widget.list[widget.index]['origen']}", style: const TextStyle(fontSize: 14.0),),
                      Text("taxonomia : ${widget.list[widget.index]['taxonomia']}", style: const TextStyle(fontSize: 14.0),),
                      Text("germina_prendimien : ${widget.list[widget.index]['germina_prendimien']}", style: const TextStyle(fontSize: 14.0),),
                      Text("variedad : ${widget.list[widget.index]['variedad']}", style: const TextStyle(fontSize: 14.0),),
                      Text("raiz : ${widget.list[widget.index]['raiz']}", style: const TextStyle(fontSize: 14.0),),
                      Text("hojas : ${widget.list[widget.index]['hojas']}", style: const TextStyle(fontSize: 14.0),),
                      Text("tallo : ${widget.list[widget.index]['tallo']}", style: const TextStyle(fontSize: 14.0),),
                      Text("inflorescencia : ${widget.list[widget.index]['inflorescencia']}", style: const TextStyle(fontSize: 14.0),),
                      Text("semillas : ${widget.list[widget.index]['semillas']}", style: const TextStyle(fontSize: 14.0),),
                      Text("material_vegetal : ${widget.list[widget.index]['material_vegetal']}", style: const TextStyle(fontSize: 14.0),),
                      Text("ciclo_de_vida : ${widget.list[widget.index]['ciclo_de_vida']}", style: const TextStyle(fontSize: 14.0),),
                      Text("altura : ${widget.list[widget.index]['altura']}", style: const TextStyle(fontSize: 14.0),),
                      Text("diametro : ${widget.list[widget.index]['diametro']}", style: const TextStyle(fontSize: 14.0),),
                      Text("clima : ${widget.list[widget.index]['clima']}", style: const TextStyle(fontSize: 14.0),),
                      Text("optima : ${widget.list[widget.index]['optima']}", style: const TextStyle(fontSize: 14.0),),
                      Text("temp_germinacion : ${widget.list[widget.index]['temp_germinacion']}", style: const TextStyle(fontSize: 14.0),),
                      Text("temp_min_crecimiento : ${widget.list[widget.index]['temp_min_crecimiento']}", style: const TextStyle(fontSize: 14.0),),
                      Text("temperaturas : ${widget.list[widget.index]['temperaturas']}", style: const TextStyle(fontSize: 14.0),),
                      Text("humedad : ${widget.list[widget.index]['humedad']}", style: const TextStyle(fontSize: 14.0),),
                      Text("humendad_porcentaje : ${widget.list[widget.index]['humendad_porcentaje']}", style: const TextStyle(fontSize: 14.0),),
                      Text("suelo : ${widget.list[widget.index]['suelo']}", style: const TextStyle(fontSize: 14.0),),
                      Text("textura_suelo : ${widget.list[widget.index]['textura_suelo']}", style: const TextStyle(fontSize: 14.0),),
                      Text("ph_textura : ${widget.list[widget.index]['ph_textura']}", style: const TextStyle(fontSize: 14.0),),
                      Text("zona_produccion : ${widget.list[widget.index]['zona_produccion']}", style: const TextStyle(fontSize: 14.0),),
                      Text("epoca_siembra : ${widget.list[widget.index]['epoca_siembra']}", style: const TextStyle(fontSize: 14.0),),
                      Text("riesgo_epoca : ${widget.list[widget.index]['riesgo_epoca']}", style: const TextStyle(fontSize: 14.0),),
                      Text("labores_cultivo : ${widget.list[widget.index]['labores_cultivo']}", style: const TextStyle(fontSize: 14.0),),
                      Text("semillero : ${widget.list[widget.index]['semillero']}", style: const TextStyle(fontSize: 14.0),),
                      Text("cantidad_semillero : ${widget.list[widget.index]['cantidad_semillero']}", style: const TextStyle(fontSize: 14.0),),
                      Text("preparacion_terreno : ${widget.list[widget.index]['preparacion_terreno']}", style: const TextStyle(fontSize: 14.0),),
                      Text("profun_preparacion : ${widget.list[widget.index]['profun_preparacion']}", style: const TextStyle(fontSize: 14.0),),
                      Text("recom_preparacion : ${widget.list[widget.index]['recom_preparacion']}", style: const TextStyle(fontSize: 14.0),),
                      Text("plantacion : ${widget.list[widget.index]['plantacion']}", style: const TextStyle(fontSize: 14.0),),
                      Text("distancia : ${widget.list[widget.index]['distancia']}", style: const TextStyle(fontSize: 14.0),),
                      Text("surcos : ${widget.list[widget.index]['surcos']}", style: const TextStyle(fontSize: 14.0),),
                      Text("plantas : ${widget.list[widget.index]['plantas']}", style: const TextStyle(fontSize: 14.0),),
                      Text("hileras : ${widget.list[widget.index]['hileras']}", style: const TextStyle(fontSize: 14.0),),
                      Text("buena_asosacion : ${widget.list[widget.index]['buena_asosacion']}", style: const TextStyle(fontSize: 14.0),),
                      Text("mala_asocsacion : ${widget.list[widget.index]['mala_asocsacion']}", style: const TextStyle(fontSize: 14.0),),
                      Text("riesgo : ${widget.list[widget.index]['riesgo']}", style: const TextStyle(fontSize: 14.0),),
                      Text("abon_y_fertilizant : ${widget.list[widget.index]['abon_y_fertilizant']}", style: const TextStyle(fontSize: 14.0),),
                      Text("mineral_quimico : ${widget.list[widget.index]['mineral_quimico']}", style: const TextStyle(fontSize: 14.0),),
                      Text("contr_malas_hierbas : ${widget.list[widget.index]['contr_malas_hierbas']}", style: const TextStyle(fontSize: 14.0),),
                      Text("plagas_enfermedades : ${widget.list[widget.index]['plagas_enfermedades']}", style: const TextStyle(fontSize: 14.0),),
                      Text("recol_almacen_dias : ${widget.list[widget.index]['recol_almacen_dias']}", style: const TextStyle(fontSize: 14.0),),
                      Text("recol_almacen_temp : ${widget.list[widget.index]['recol_almacen_temp']}", style: const TextStyle(fontSize: 14.0),),
                      Text("produc_promedia : ${widget.list[widget.index]['produc_promedia']}", style: const TextStyle(fontSize: 14.0),),
                      Text("valor_nutricional : ${widget.list[widget.index]['valor_nutricional']}", style: const TextStyle(fontSize: 14.0),),
                      Text("uso_y_aplicacion : ${widget.list[widget.index]['uso_y_aplicacion']}", style: const TextStyle(fontSize: 14.0),),
                      Text("fecha_registro : ${widget.list[widget.index]['fecha_registro']}", style: const TextStyle(fontSize: 14.0),),
                      Text("usuario_registro : ${widget.list[widget.index]['usuario_registro']}", style: const TextStyle(fontSize: 14.0),),

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
                            builder: (BuildContext context)=>EditarEspecie(list: widget.list, index: widget.index,),
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