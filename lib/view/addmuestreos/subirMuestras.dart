import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:agrotics/Util/check_internet_connection.dart';
import 'package:agrotics/Util/connection_status_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agrotics/model/database_muestras.dart';
import 'package:http/http.dart' as http;

class SubirMuestras extends StatefulWidget {

  @override
  _SubirMuestrasState createState() => _SubirMuestrasState();
}

class _SubirMuestrasState extends State<SubirMuestras> {




  List<Map<String, dynamic>> myData = [];
  var contardb ;

  bool _isLoading = true;


  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      contardb = data.length;
      myData = data;
      _isLoading = false;
    });
  }

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
                                    Container(
                                      child: Row(
                                          children: const <Widget>[
                                            Icon(Icons.wifi),
                                            SizedBox(width: 20),
                                            Text('No hay internet.'),

                                          ]
                                      ),
                                    ),
                                    Text(" Existen $contardb muestras por subir",
                                      style: TextStyle(fontSize: 22), ),

                                  ],
                                ),
                              ),
                              SizedBox(
                                height:  490,
                                child: ListView.builder(
                                    itemCount: myData.length,
                                    itemBuilder: (context, index) =>
                                        Container(
                                          child: Card(
                                            color:
                                            index % 2 == 0 ? Colors.red : Colors.red[200],
                                            margin: const EdgeInsets.fromLTRB(6,3,6,3),
                                            child: ListTile(
                                                title: Text(myData[index]['fecha_registro']),
                                                subtitle: Text(myData[index]['id_siembra']),
                                                trailing: SizedBox(
                                                  width: 100,
                                                  child: Row(
                                                    children: [
                                                    ],
                                                  ),
                                                )),
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
                                  Container(
                                      child: Row(
                                          children: const <Widget>[
                                            Icon(Icons.wifi),
                                            SizedBox(width: 20),
                                            Text('Hay internet.'),

                                          ]
                                      ),
                                  ),
                                  Text(" Existen $contardb muestras",
                                    style: TextStyle(fontSize: 22), ),

                                ],
                              ),
                            ),
                            SizedBox(
                              height:  490,
                            child: ListView.builder(
                              itemCount: myData.length,
                              itemBuilder: (context, index) =>
                                  Container(
                                    child: Card(
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
                                                IconButton(
                                                  icon: const Icon(Icons.upload),
                                                  onPressed: () async  {
                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                        content: Text('¡Espere mientras se sube!',style: TextStyle(color: Colors.black)),
                                                        backgroundColor: Colors.yellow));
                                                  print('adddataherramienta_logs');

                                                  var url = Uri.parse(conexion() + "muestras/adddatamuestras.php");

                                                  var response = await http.post(url, body: {
                                                  'id_siembra': myData[index]['id_siembra'],
                                                  'fecha_muestreo': myData[index]['fecha_registro'],
                                                  'altura': myData[index]['altura'],
                                                  'diametro': myData[index]['diametro'],
                                                  'nro_racimos': myData[index]['nro_racimos'],
                                                  'nro_flores_racimos': myData[index]['nro_flores_racimos'],
                                                  'nro_flores_totales': myData[index]['nro_flores_totales'],
                                                  'nro_frutos_racimos': myData[index]['nro_frutos_racimos'],
                                                  'nro_frutos_totales': myData[index]['nro_frutos_totales'],
                                                  'longitud_fruto': myData[index]['longitud_fruto'],
                                                  'diametro_fruto': myData[index]['diametro_fruto'],
                                                  'peso_fruto': myData[index]['peso_fruto'],
                                                  'produccion_planta': myData[index]['produccion_planta'],
                                                  'ph_suelo': myData[index]['ph_suelo'],
                                                  'mo': myData[index]['mo'],
                                                  'nitrogeno': myData[index]['nitrogeno'],
                                                  'fosforo': myData[index]['fosforo'],
                                                  'potasio': myData[index]['potasio'],
                                                  'otros_elementos': myData[index]['otros_elementos'],
                                                  'temperatura': myData[index]['temperatura'],
                                                  'humedad_relativa': myData[index]['humedad_relativa'],
                                                  'riego_lluvia': myData[index]['riego_lluvia'],
                                                  'fertiliza_abono': myData[index]['fertiliza_abono'],
                                                  'cantidad_fertiliza': myData[index]['cantidad_fertiliza'],
                                                  'fechas_aplic_fertiliza': myData[index]['fechas_aplic_fertiliza'],
                                                  'control_plag_enferm': myData[index]['control_plag_enferm'],
                                                  'cantidad_control_plag': myData[index]['cantidad_control_plag'],
                                                  'fecha_aplicacion': myData[index]['fecha_aplicacion'],
                                                  'observaciones': myData[index]['observaciones'],
                                                  'fecha_registro': myData[index]['fecha_registro'],
                                                  'usuario_registro': myData[index]['usuario_registro'],

                                                  });
                                                  print('Response status: ${response.statusCode}');
                                                  print('Response body: ${response.body}');
                                                  await DatabaseHelper.deleteItem(myData[index]['id']);
                                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                      content: Text('¡Muestra subida con éxito!'), backgroundColor: Colors.green));
                                                  _refreshData();
                                                  }

                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
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
