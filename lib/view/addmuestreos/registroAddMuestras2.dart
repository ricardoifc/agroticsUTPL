import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'identificarAddMuestra.dart';

class RegistroAddMuestras2 extends StatefulWidget {
  final Data data;
  RegistroAddMuestras2({required this.data});

  @override
  _RegistroAddMuestras2State createState() => _RegistroAddMuestras2State();
}

class _RegistroAddMuestras2State extends State<RegistroAddMuestras2> {
  //late String id_siembra = "1000000";
  //TextEditingController id_siembra = "1000000" as TextEditingController;
  TextEditingController fecha_muestreo = TextEditingController();
  TextEditingController altura = TextEditingController();
  TextEditingController diametro = TextEditingController();
  TextEditingController nro_racimos = TextEditingController();
  TextEditingController nro_flores_racimos = TextEditingController();
  TextEditingController nro_flores_totales = TextEditingController();
  TextEditingController nro_frutos_racimos = TextEditingController();
  TextEditingController nro_frutos_totales = TextEditingController();
  TextEditingController longitud_fruto = TextEditingController();
  TextEditingController diametro_fruto = TextEditingController();
  TextEditingController peso_fruto = TextEditingController();
  TextEditingController produccion_planta = TextEditingController();
  TextEditingController ph_suelo = TextEditingController();
  TextEditingController mo = TextEditingController();
  TextEditingController nitrogeno = TextEditingController();
  TextEditingController fosforo = TextEditingController();
  TextEditingController potasio = TextEditingController();
  TextEditingController otros_elementos = TextEditingController();
  TextEditingController temperatura = TextEditingController();
  TextEditingController humedad_relativa = TextEditingController();
  TextEditingController riego_lluvia = TextEditingController();
  TextEditingController fertiliza_abono = TextEditingController();
  TextEditingController cantidad_fertiliza = TextEditingController();
  TextEditingController fechas_aplic_fertiliza = TextEditingController();
  TextEditingController control_plag_enferm = TextEditingController();
  TextEditingController cantidad_control_plag = TextEditingController();
  TextEditingController fecha_aplicacion = TextEditingController();
  TextEditingController observaciones = TextEditingController();

  final dateNow = DateTime.now();
  var usuario_registro = "admin";

  final _formKey = GlobalKey<FormState>();

  void _register() {
    print('addData');
    var url = Uri.parse(conexion() + "muestras/adddatamuestras.php");

    http.post(url, body: {
      'id_siembra': "1000000",
      'fecha_muestreo': "05/12/2022",
      'altura': altura.text,
      'diametro': diametro.text,
      'nro_racimos': nro_racimos.text,
      'nro_flores_racimos': nro_flores_racimos.text,
      'nro_flores_totales': nro_flores_totales.text,
      'nro_frutos_racimos': nro_frutos_racimos.text,
      'nro_frutos_totales': nro_frutos_totales.text,
      'longitud_fruto': longitud_fruto.text,
      'diametro_fruto': diametro_fruto.text,
      'peso_fruto': peso_fruto.text,
      'produccion_planta': produccion_planta.text,
      'ph_suelo': ph_suelo.text,
      'mo': mo.text,
      'nitrogeno': nitrogeno.text,
      'fosforo': fosforo.text,
      'potasio': potasio.text,
      'otros_elementos': otros_elementos.text,
      'temperatura': temperatura.text,
      'humedad_relativa': humedad_relativa.text,
      'riego_lluvia': riego_lluvia.text,
      'fertiliza_abono': fertiliza_abono.text,
      'cantidad_fertiliza': cantidad_fertiliza.text,
      'fechas_aplic_fertiliza': fechas_aplic_fertiliza.text,
      'control_plag_enferm': control_plag_enferm.text,
      'cantidad_control_plag': cantidad_control_plag.text,
      'fecha_aplicacion': fecha_aplicacion.text,
      'observaciones': observaciones.text,
      "fecha_registro": dateNow.toString(),
      "usuario_registro": usuario_registro,
    });
  }

  //late String _mySelection = "";
  //final List<Map> _myJson = [{"id":0,"name":"docentes"},{"id":1,"name":"alumnos"}];
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Muestra"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Paso 1"),
                Tab(text: "Paso 2"),
                Tab(text: "Paso 3"),
                //Tab(text: "Paso 4"),
              ],
            ),
          ),
          body: TabBarView(children: [
            Form(
              key: _formKey1,
              child: ListView(
                children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: altura,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Altura (cm)',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: diametro,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Díametro (cm)',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: nro_racimos,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nro de racimos',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: nro_flores_racimos,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nro Flores/racimo',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: nro_flores_totales,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nro Flores totales planta',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: nro_frutos_racimos,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nro frutos/racimo',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: nro_frutos_totales,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nro frutos totales planta',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: longitud_fruto,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Longitud fruto (cm)',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: diametro_fruto,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Diametro fruto (cm)',
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Form(
              key: _formKey2,
              child: ListView(
                children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: peso_fruto,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Peso del fruto (g)',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: produccion_planta,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Producción/planta (kg)',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: ph_suelo,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'pH suelo',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: mo,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'MO %',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: nitrogeno,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nitrógeno (%)',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: fosforo,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Fósforo (mg/hg)',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: potasio,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Potasio (Cmol/kg)',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: otros_elementos,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Otros elementos ',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: temperatura,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Temperatura (°C)',
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Form(
              key: _formKey3,
              child: ListView(
                children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: humedad_relativa,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Humedad relativa (%)',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: riego_lluvia,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Riego/lluvia (mL/planta)',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: fertiliza_abono,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Fertilización/fertilizante/abono',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: cantidad_fertiliza,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Cantidad',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: fechas_aplic_fertiliza,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Fechas de aplicación de fertilizante ',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: control_plag_enferm,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Control de plagas y enfermedades/poducto',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: cantidad_control_plag,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'cantidad control plagas',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: fecha_aplicacion,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'fecha de aplicación ',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                        controller: observaciones,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Observaciónes ',
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: GlobalColor.colorBotonTextPrincipal,
                          color: GlobalColor.colorBotonPrincipal,
                          child: Text('Guardar '),
                          onPressed: () {
                            _save(context);
                          },
                        )),
                  ]),
                ],
              ),
            ),
            /*Form(
              key: _formKey4,
              child: ListView(
                children: <Widget>[
                  Column(children: <Widget>[

                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: GlobalColor.colorBotonTextPrincipal,
                          color: GlobalColor.colorBotonPrincipal,
                          child: Text('Guardar '),
                          onPressed: () {
                            _save(context);
                          },
                        )),
                  ]),
                ],
              ),
            ),*/
          ])),
    );
  }

  void _save(BuildContext context) async {
    print(_formKey1.currentState); // NULL ON TAB 2 AND 3
    print(_formKey2.currentState); // NULL ON TAB 1 AND 3
    print(_formKey3.currentState); // NULL ON TAB 1 AND 2
    //my save procedure
  }
}
