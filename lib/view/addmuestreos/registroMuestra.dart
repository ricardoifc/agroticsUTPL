import 'package:agrotics/Util/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:agrotics/model/database_muestras.dart';

import 'package:intl/intl.dart';



class RegistroMuestra extends StatelessWidget {
  var username;
  var rol;
  var idSiembra;

  String dateNow = DateFormat('dd-MM-yyyy-kk:mm').format(DateTime.now());
  RegistroMuestra({Key? key, required this.username, required this.rol, required this.idSiembra}) : super(key: key);

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

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
        backgroundColor: GlobalColor.colorBackground,
      appBar: AppBar(
        title: Text(idSiembra),
        bottom: const TabBar(
          tabs: [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Cultivo",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Suelo",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Climáticos",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Fertilizantes",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "plagas y enfermedades",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),

      ),
          body: TabBarView(
            children: [
              Form(
                key: _formKey1,
                child: ListView(
                  children: <Widget>[
                    Column(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: altura,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Altura',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( cm ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: diametro,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Díametro',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( cm ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: nro_racimos,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nro de racimos',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( Número ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: nro_flores_racimos,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nro Flores o racimo',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( Número ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: nro_flores_totales,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nro Flores totales planta',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( Número ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: nro_frutos_racimos,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nro frutos o racimo',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( Número ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: nro_frutos_totales,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nro frutos totales planta',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( Número ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: longitud_fruto,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Longitud fruto',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( cm ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: diametro_fruto,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Diametro fruto',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( cm ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: peso_fruto,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Peso del fruto',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( g ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: produccion_planta,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Producción/planta',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( kg ) "),
                            ),
                          ],
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
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: ph_suelo,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                  ],
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'pH del suelo',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( pH ) "),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: mo,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                  ],
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: ' molibdeno',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( % ) "),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: nitrogeno,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                  ],
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Nitrógeno',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( % ) "),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: fosforo,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                  ],
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Fósforo',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( mg/hg ) "),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: potasio,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                  ],
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Potasio',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( Cmol/kg ) "),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: otros_elementos,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Otros elementos ',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( Texto ) "),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: temperatura,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Temperatura',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( °C ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: humedad_relativa,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Humedad relativa (%)',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( % ) "),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: riego_lluvia,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9,]"),)
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Riego/lluvia',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Text(" ( mL/planta ) "),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Form(
                key: _formKey4,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: fertiliza_abono,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Fertilización/fertilizante/abono',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( Texto ) "),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: cantidad_fertiliza,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Cantidad',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( Texto ) "),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller:
                                  fechas_aplic_fertiliza, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Aplicación de fertilizante',
                                  ),
                                  readOnly:
                                  true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                      DateFormat('dd/MM/yyyy')
                                          .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement
                                      fechas_aplic_fertiliza.text = formattedDate;
                                      /*setState(() {
                                      fechas_aplic_fertiliza.text = formattedDate; //set output date to TextField value.
                                    }
                                    );*/
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( Fecha ) "),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey5,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: control_plag_enferm,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText:
                                    'Producto: Control de plagas y enfermedades',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( Texto ) "),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: cantidad_control_plag,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Cantidad',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( Texto ) "),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller:
                                  fecha_aplicacion, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Fecha de aplicación ',
                                  ),
                                  readOnly:
                                  true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement
                                      fecha_aplicacion.text = formattedDate;/*
                                    setState(() {
                                      fecha_aplicacion.text = formattedDate; //set output date to TextField value.
                                    });*/
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( Fecha ) "),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: observaciones,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Observaciónes ',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                                child: Text(" ( Texto ) "),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              //style: style,
                              onPressed: () {
                                // _save(context);
                                addItem();
                                Navigator.of(context).pop();
                                //_register();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: GlobalColor.colorBotonPrincipal,
                              ),
                              child: const Text('Guardar'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
    ),
    );
  }
  Future<void> addItem() async {
    await DatabaseHelper.createItem(
        idSiembra,
        altura.text,
        diametro.text,
        nro_racimos.text,
        nro_flores_racimos.text,
        nro_flores_totales.text,
        nro_frutos_racimos.text,
        nro_frutos_totales.text,
        longitud_fruto.text,
        diametro_fruto.text,
        peso_fruto.text,
        produccion_planta.text,
        ph_suelo.text,
        mo.text,
        nitrogeno.text,
        fosforo.text,
        potasio.text,
        otros_elementos.text,
        temperatura.text,
        humedad_relativa.text,
        riego_lluvia.text,
        fertiliza_abono.text,
        cantidad_fertiliza.text,
        fechas_aplic_fertiliza.text,
        control_plag_enferm.text,
        cantidad_control_plag.text,
        fecha_aplicacion.text,
        observaciones.text,
        dateNow.toString(),
        username


    );
    //_refreshData();
  }
}
