import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:agrotics/Util/check_internet_connection.dart';
import 'package:agrotics/Util/connection_status_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agrotics/model/database_muestras.dart';
import 'package:http/http.dart' as http;

class SubirMuestras extends StatefulWidget {
  const SubirMuestras({Key? key}) : super(key: key);


  @override
  _SubirMuestrasState createState() => _SubirMuestrasState();
}

class _SubirMuestrasState extends State<SubirMuestras> {




  List<Map<String, dynamic>> myData = [];
  var contardb ;

  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      contardb = data.length;
      myData = data;
      if(myData.isEmpty){
        isButtonDisabled =false;
      }
    });
  }

  bool isButtonDisabled = false;

  @override
  void initState() {
    _refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: const Text("Subir Muestras"),
      ),
      body: Column(
        children: <Widget>[
          BlocProvider(
            create: (context) => ConnectionStatusCubit(),
            child: BlocBuilder<ConnectionStatusCubit, ConnectionStatus>(
                builder: (context, status) {
                  return
                    Visibility(
                      visible: status != ConnectionStatus.online,
                      child:  Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 70,
                              color: Colors.red,
                              child: Column(
                                children: [
                                  Row(
                                      children: const <Widget>[
                                        Icon(Icons.wifi),
                                        SizedBox(width: 20),
                                        Text('No hay internet.'),

                                      ]
                                  ),
                                  Text(" Existen $contardb muestras por subir",
                                    style: const TextStyle(fontSize: 22), ),

                                ],
                              ),
                            ),
                            SizedBox(
                              height:  490,
                              child: ListView.builder(
                                  itemCount: myData.length,
                                  itemBuilder: (context, index) =>
                                      Card(
                                        color:
                                        index % 2 == 0 ? Colors.red : Colors.red[200],
                                        margin: const EdgeInsets.fromLTRB(6,3,6,3),
                                        child: ListTile(
                                            title: Text(myData[index]['fecha_registro']),
                                            subtitle: Text(myData[index]['id_siembra']),
                                            ),
                                      )
                              ),
                            )
                          ]
                      ),
                    );
                }),
          ),
          BlocProvider(
            create: (context) => ConnectionStatusCubit(),
            child: BlocBuilder<ConnectionStatusCubit, ConnectionStatus>(
                builder: (context, status) {
                  return
                    Visibility(
                      visible: status == ConnectionStatus.online,
                      child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 70,
                              color: Colors.green,
                              child: Column(
                                children: [
                                  Row(
                                      children: const <Widget>[
                                        Icon(Icons.wifi),
                                        SizedBox(width: 20),
                                        Text('Hay internet.'),

                                      ]
                                  ),
                                  Text(" Existen $contardb muestras",
                                    style: const TextStyle(fontSize: 22), ),

                                ],
                              ),
                            ),
                            SizedBox(
                              height:  490,
                              child: ListView.builder(
                                  itemCount: myData.length,
                                  itemBuilder: (context, index) =>
                                      Card(
                                        color:
                                        index % 2 == 0 ? Colors.green : Colors.green[200],
                                        margin: const EdgeInsets.fromLTRB(6,3,6,3),
                                        child: ListTile(
                                            title: Text(myData[index]['fecha_registro']),
                                            subtitle: Text(myData[index]['id_siembra']),
                                            trailing: SizedBox(
                                              width: 100,
                                              child: Row(
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: isButtonDisabled ? null : () async {

                                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                            content: Text('¡Espere mientras se sube!',style: TextStyle(color: Colors.black)),
                                                            backgroundColor: Colors.yellow));
                                                        setState(() {
                                                          isButtonDisabled = true;
                                                        });
                                                        myData.forEach((item) async {
                                                          setState(() {
                                                            isButtonDisabled = true;
                                                          });


                                                          var url = Uri.parse("${conexion()}muestras/adddatamuestras.php");
                                                          var response = await http.post(url, body: {
                                                            'id_siembra': item['id_siembra'],
                                                            'fecha_muestreo': item['fecha_registro'],
                                                            'altura': item['altura'],
                                                            'diametro': item['diametro'],
                                                            'nro_racimos': item['nro_racimos'],
                                                            'nro_flores_racimos': item['nro_flores_racimos'],
                                                            'nro_flores_totales': item['nro_flores_totales'],
                                                            'nro_frutos_racimos': item['nro_frutos_racimos'],
                                                            'nro_frutos_totales': item['nro_frutos_totales'],
                                                            'longitud_fruto': item['longitud_fruto'],
                                                            'diametro_fruto': item['diametro_fruto'],
                                                            'peso_fruto': item['peso_fruto'],
                                                            'produccion_planta': item['produccion_planta'],
                                                            'ph_suelo': item['ph_suelo'],
                                                            'mo': item['mo'],
                                                            'nitrogeno': item['nitrogeno'],
                                                            'fosforo': item['fosforo'],
                                                            'potasio': item['potasio'],
                                                            'otros_elementos': item['otros_elementos'],
                                                            'temperatura': item['temperatura'],
                                                            'humedad_relativa': item['humedad_relativa'],
                                                            'riego_lluvia': item['riego_lluvia'],
                                                            'fertiliza_abono': item['fertiliza_abono'],
                                                            'cantidad_fertiliza': item['cantidad_fertiliza'],
                                                            'fechas_aplic_fertiliza': item['fechas_aplic_fertiliza'],
                                                            'control_plag_enferm': item['control_plag_enferm'],
                                                            'cantidad_control_plag': item['cantidad_control_plag'],
                                                            'fecha_aplicacion': item['fecha_aplicacion'],
                                                            'observaciones': item['observaciones'],
                                                            'fecha_registro': item['fecha_registro'],
                                                            'usuario_registro': item['usuario_registro'],
                                                          });
                                                          await DatabaseHelper.deleteItem(item['id']);

                                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                              content: Text('¡Muestra subida con éxito!'), backgroundColor: Colors.green));

                                                          _refreshData();
                                                        });

                                                      },
                                                      child: const Text("Subir")

                                                  ),
                                                ],
                                              ),
                                            )),
                                      )
                              ),
                            )
                          ]
                      ),

                    );
                }),
          ),

          //const FakeUserList(),
        ],
      ),
    );
  }

}