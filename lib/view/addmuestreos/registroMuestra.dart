import 'package:agrotics/Util/global_color.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:agrotics/model/database_muestras.dart';

import 'package:intl/intl.dart';

class RegistroMuestra extends StatefulWidget {
  var username;
  var rol;
  var idSiembra;



  String dateNow = DateFormat('dd/MM/yyyy kk:mm').format(DateTime.now());
  RegistroMuestra(
      {Key? key,
      required this.username,
      required this.rol,
      required this.idSiembra})
      : super(key: key);

  @override
  _RegistroMuestraState createState() => _RegistroMuestraState();
}

class _RegistroMuestraState extends State<RegistroMuestra> {
  final alturaFocusNode = FocusNode();
  final  diametroFocusNode = FocusNode();
  final nroRacimosFocusNode = FocusNode();
  final nroFloresRacimosFocusNode = FocusNode();
  final  nroFloresTotalesFocusNode = FocusNode();
  final  nroFrutosRacimosFocusNode = FocusNode();
  final nroFrutosTotalesFocusNode = FocusNode();
  final longitudFrutoFocusNode = FocusNode();
  final diametroFrutoFocusNode = FocusNode();
  final pesoFrutoFocusNode = FocusNode();
  final produccionPlantaFocusNode = FocusNode();
  final phSueloFocusNode = FocusNode();
  final  moFocusNode = FocusNode();
  final nitrogenoFocusNode = FocusNode();
  final fosforoFocusNode = FocusNode();
  final potasioFocusNode = FocusNode();
  final otrosElementosFocusNode = FocusNode();
  final temperaturaFocusNode = FocusNode();
  final  humedadRelativaFocusNode = FocusNode();
  final  riegoLluviaFocusNode = FocusNode();
  final fertilizaAbonoFocusNode = FocusNode();
  final cantidadFertilizaFocusNode = FocusNode();
  final  fechasAplicFertilizaFocusNode = FocusNode();
  final controlPlagEnfermFocusNode = FocusNode();
  final cantidadControlPlagFocusNode = FocusNode();
  final fechaAplicacionFocusNode = FocusNode();
  final observacionesFocusNode = FocusNode();
  final botonGuardar = FocusNode();



  TextEditingController fechaMuestreo = TextEditingController();
  TextEditingController altura = TextEditingController();
  TextEditingController diametro = TextEditingController();
  TextEditingController nroRacimos = TextEditingController();
  TextEditingController nroFloresRacimos = TextEditingController();
  TextEditingController nroFloresTotales = TextEditingController();
  TextEditingController nroFrutosRacimos = TextEditingController();
  TextEditingController nroFrutosTotales = TextEditingController();
  TextEditingController longitudFruto = TextEditingController();
  TextEditingController diametroFruto = TextEditingController();
  TextEditingController pesoFruto = TextEditingController();
  TextEditingController produccionPlanta = TextEditingController();
  TextEditingController phSuelo = TextEditingController();
  TextEditingController mo = TextEditingController();
  TextEditingController nitrogeno = TextEditingController();
  TextEditingController fosforo = TextEditingController();
  TextEditingController potasio = TextEditingController();
  TextEditingController otrosElementos = TextEditingController();
  TextEditingController temperatura = TextEditingController();
  TextEditingController humedadRelativa = TextEditingController();
  TextEditingController riegoLluvia = TextEditingController();
  TextEditingController fertilizaAbono = TextEditingController();
  TextEditingController cantidadFertiliza = TextEditingController();
  TextEditingController fechasAplicFertiliza = TextEditingController();
  TextEditingController controlPlagEnferm = TextEditingController();
  TextEditingController cantidadControlPlag = TextEditingController();
  TextEditingController fechaAplicacion = TextEditingController();
  TextEditingController observaciones = TextEditingController();


  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();


  String despleFertilizantes = "No";
  String despleControlPlagas = "No";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: GlobalColor.colorBackground,
        appBar: AppBar(

          title: Text(widget.idSiembra),
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
                    "Otros y Finalizar",
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
                              focusNode: alturaFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'\d+(\.\d{0,2})?'))
                              ],
                              onChanged: (text) {
                                final value = double.tryParse(text);
                                if (value != null) {
                                  altura.value = altura.value.copyWith(
                                    text: value.toStringAsFixed(2),
                                  );
                                }
                              },
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(diametroFocusNode);
                              },

                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Altura',
                              ),
                            ),

                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("cm"),
                            ),
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
                                focusNode: diametroFocusNode,
                                inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'\d+(\.\d{0,2})?'))
                              ],
                              onChanged: (text) {
                                final value = double.tryParse(text);
                                if (value != null) {
                                  diametro.value = diametro.value.copyWith(
                                    text: value.toStringAsFixed(2),
                                  );
                                }
                              },
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(nroRacimosFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Díametro',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("cm"),
                            ),
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
                              controller: nroRacimos,
                              keyboardType: TextInputType.number,
                              focusNode: nroRacimosFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                )
                              ],
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(nroFloresRacimosFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nro de racimos',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("Número"),
                            ),
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
                              controller: nroFloresRacimos,
                              keyboardType: TextInputType.number,
                              focusNode: nroFloresRacimosFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                )
                              ],
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(nroFloresTotalesFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nro Flores o racimo',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("Número"),
                            ),
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
                              controller: nroFloresTotales,
                              keyboardType: TextInputType.number,
                              focusNode: nroFloresTotalesFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                )
                              ],
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(nroFrutosRacimosFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nro Flores totales planta',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("Número"),
                            ),
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
                              controller: nroFrutosRacimos,
                              keyboardType: TextInputType.number,
                              focusNode: nroFrutosRacimosFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                )
                              ],
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(nroFrutosTotalesFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nro frutos o racimo',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("Número"),
                            ),
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
                              controller: nroFrutosTotales,
                              keyboardType: TextInputType.number,
                              focusNode: nroFrutosTotalesFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                )
                              ],
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(longitudFrutoFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nro frutos totales planta',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("Número"),
                            ),
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
                              controller: longitudFruto,
                              keyboardType: TextInputType.number,
                              focusNode: longitudFrutoFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'\d+(\.\d{0,2})?'))
                              ],
                              onChanged: (text) {
                                final value = double.tryParse(text);
                                if (value != null) {
                                  longitudFruto.value = longitudFruto.value.copyWith(
                                    text: value.toStringAsFixed(2),
                                  );
                                }
                              },
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(diametroFrutoFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Longitud fruto',
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("cm"),
                            ),
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
                              controller: diametroFruto,
                              keyboardType: TextInputType.number,
                              focusNode: diametroFrutoFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'\d+(\.\d{0,2})?'))
                              ],
                              onChanged: (text) {
                                final value = double.tryParse(text);
                                if (value != null) {
                                  diametroFruto.value = diametroFruto.value.copyWith(
                                    text: value.toStringAsFixed(2),
                                  );
                                }
                              },
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(pesoFrutoFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Diametro fruto',
                              ),
                            ),

                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("cm"),
                            ),
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
                              controller: pesoFruto,
                              keyboardType: TextInputType.number,
                              focusNode: pesoFrutoFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'\d+(\.\d{0,2})?'))
                              ],
                              onChanged: (text) {
                                final value = double.tryParse(text);
                                if (value != null) {
                                  pesoFruto.value = pesoFruto.value.copyWith(
                                    text: value.toStringAsFixed(2),
                                  );
                                }
                              },
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(produccionPlantaFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Peso del fruto',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("g"),
                            ),
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
                              controller: produccionPlanta,
                              keyboardType: TextInputType.number,
                              focusNode: produccionPlantaFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'\d+(\.\d{0,2})?'))
                              ],

                              onChanged: (text) {
                                final value = double.tryParse(text);
                                if (value != null) {
                                  produccionPlanta.value = produccionPlanta.value.copyWith(
                                    text: value.toStringAsFixed(2),
                                  );
                                }
                              },
                              onSubmitted: (text) {
                              FocusScope.of(context).requestFocus(phSueloFocusNode);
                            },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Producción/planta',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("kg"),
                            ),
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
                                controller: phSuelo,
                                keyboardType: TextInputType.number,
                                focusNode: phSueloFocusNode,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r'\d+(\.\d{0,2})?'))
                                ],
                                onChanged: (text) {
                                  final value = double.tryParse(text);
                                  if (value != null) {
                                    phSuelo.value = phSuelo.value.copyWith(
                                      text: value.toStringAsFixed(2),
                                    );
                                  }
                                },
                                onSubmitted: (text) {
                                  FocusScope.of(context).requestFocus(moFocusNode);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'pH del suelo',
                                ),
                              ),

                            ),

                            const SizedBox(
                              width: 90,
                              child: Chip(
                                labelStyle: TextStyle(color: Colors.white),
                                backgroundColor:
                                    GlobalColor.colorBotonPrincipal,
                                label: Text("pH"),
                              ),
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
                                focusNode: moFocusNode,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9,]"),
                                  )
                                ],
                                onSubmitted: (text) {
                                  FocusScope.of(context).requestFocus(nitrogenoFocusNode);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: ' molibdeno',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Chip(
                                labelStyle: TextStyle(color: Colors.white),
                                backgroundColor:
                                    GlobalColor.colorBotonPrincipal,
                                label: Text("%"),
                              ),
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
                                focusNode: nitrogenoFocusNode,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9,]"),
                                  )
                                ],
                                onSubmitted: (text) {
                                  FocusScope.of(context).requestFocus(fosforoFocusNode);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nitrógeno',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Chip(
                                labelStyle: TextStyle(color: Colors.white),
                                backgroundColor:
                                    GlobalColor.colorBotonPrincipal,
                                label: Text("%"),
                              ),
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
                                focusNode: fosforoFocusNode,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r'\d+(\.\d{0,2})?'))
                                ],
                                onChanged: (text) {
                                  final value = double.tryParse(text);
                                  if (value != null) {
                                    fosforo.value = fosforo.value.copyWith(
                                      text: value.toStringAsFixed(2),
                                    );
                                  }
                                },
                                onSubmitted: (text) {
                                  FocusScope.of(context).requestFocus(potasioFocusNode);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Fósforo',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Chip(
                                labelStyle: TextStyle(color: Colors.white),
                                backgroundColor:
                                    GlobalColor.colorBotonPrincipal,
                                label: Text("mg/hg"),
                              ),
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
                                focusNode: potasioFocusNode,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r'\d+(\.\d{0,2})?'))
                                ],
                                onChanged: (text) {
                                  final value = double.tryParse(text);
                                  if (value != null) {
                                    potasio.value = potasio.value.copyWith(
                                      text: value.toStringAsFixed(2),
                                    );
                                  }
                                },
                                onSubmitted: (text) {
                                  FocusScope.of(context).requestFocus(otrosElementosFocusNode);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Potasio',
                                ),
                              ),

                            ),
                            const SizedBox(
                              width: 90,
                              child: Chip(
                                labelStyle: TextStyle(color: Colors.white),
                                backgroundColor:
                                    GlobalColor.colorBotonPrincipal,
                                label: Text("Cmol/kg"),
                              ),
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
                                controller: otrosElementos,
                                focusNode: otrosElementosFocusNode,
                                onSubmitted: (text) {
                                  FocusScope.of(context).requestFocus(temperaturaFocusNode);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Otros elementos ',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Chip(
                                labelStyle: TextStyle(color: Colors.white),
                                backgroundColor:
                                    GlobalColor.colorBotonPrincipal,
                                label: Text("Texto"),
                              ),
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
                              focusNode: temperaturaFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9,]"),
                                )
                              ],
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(humedadRelativaFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Temperatura',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("°C"),
                            ),
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
                              controller: humedadRelativa,
                              keyboardType: TextInputType.number,
                              focusNode: humedadRelativaFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9,]"),
                                )
                              ],
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(riegoLluviaFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Humedad relativa (%)',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("%"),
                            ),
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
                              controller: riegoLluvia,
                              keyboardType: TextInputType.number,
                              focusNode: riegoLluviaFocusNode,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'\d+(\.\d{0,2})?'))
                              ],
                              onChanged: (text) {
                                final value = double.tryParse(text);
                                if (value != null) {
                                  riegoLluvia.value = riegoLluvia.value.copyWith(
                                    text: value.toStringAsFixed(2),
                                  );
                                }
                              },
                              onSubmitted: (text) {
                                FocusScope.of(context).requestFocus(observacionesFocusNode);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Riego/lluvia',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            child: Chip(
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                              label: Text("mL/planta"),
                            ),
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
                      Row(children: [
                        Flexible(
                          child: ExpansionTile(
                            title: Row(
                              children: [
                                const Text(
                                    "Uso de Fertilizantes: \t"),
                                Text(despleFertilizantes,
                                    style: const TextStyle(color: Colors.green)),
                              ],
                            ),
                            initiallyExpanded: false,
                            onExpansionChanged: (bool value) {
                              setState(() {
                                if (value) {
                                  despleFertilizantes = 'Sí';
                                } else {
                                  despleFertilizantes = 'No';
                                  fertilizaAbono.clear();
                                  cantidadFertiliza.clear();
                                  fechasAplicFertiliza.clear();
                                }
                              });
                            },

                            children: [
                              // Aquí va el código de tus campos de fertilizantes
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: TextField(
                                            controller: fertilizaAbono,
                                            focusNode: fertilizaAbonoFocusNode,
                                            onSubmitted: (text) {
                                              FocusScope.of(context).requestFocus(cantidadFertilizaFocusNode);
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  'Fertilización/fertilizante/abono',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 90,
                                          child: Chip(
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            backgroundColor:
                                                GlobalColor.colorBotonPrincipal,
                                            label: Text("Texto"),
                                          ),
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
                                            controller: cantidadFertiliza,
                                            focusNode: cantidadFertilizaFocusNode,
                                            onSubmitted: (text) {
                                              FocusScope.of(context).requestFocus(fechasAplicFertilizaFocusNode);
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Cantidad',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 90,
                                          child: Chip(
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            backgroundColor:
                                                GlobalColor.colorBotonPrincipal,
                                            label: Text("Texto"),
                                          ),
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
                                            controller: fechasAplicFertiliza,
                                            focusNode: fechasAplicFertilizaFocusNode,
                                            onSubmitted: (text) {
                                              FocusScope.of(context).requestFocus(controlPlagEnfermFocusNode);
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  'Aplicación de fertilizante',
                                            ),
                                            readOnly: true,
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2101),
                                              );

                                              if (pickedDate != null) {
                                                String formattedDate =
                                                    DateFormat('dd/MM/yyyy')
                                                        .format(pickedDate);
                                                fechasAplicFertiliza.text =
                                                    formattedDate;
                                                if (pickedDate != null) {
                                                  //print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                  String formattedDate =
                                                      DateFormat('dd/MM/yyyy')
                                                          .format(
                                                              pickedDate); //formatted date output using intl package =>  2021-03-16
                                                  //you can implement different kind of Date Format here according to your requirement
                                                  fechasAplicFertiliza.text =
                                                      formattedDate;
                                                  setState(() {
                                                    fechasAplicFertiliza.text =
                                                        formattedDate; //set output date to TextField value.
                                                  });
                                                } else {
                                                  //print("Date is not selected");
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 90,
                                          child: Chip(
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            backgroundColor:
                                                GlobalColor.colorBotonPrincipal,
                                            label: Text("Texto"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                      Row(children: [
                        Flexible(
                          child: ExpansionTile(
                            title: Row(
                              children: [
                                const Text(
                                    "Control de plagas y enfermedades: \t"),

                                  Text(despleControlPlagas,
                                  style: const TextStyle(color: Colors.green)),
                                  ],
                                  ),
                                  initiallyExpanded: false,
                                  onExpansionChanged: (bool value) {
                                  setState(() {
                                  if (value) {
                                  despleControlPlagas = 'Sí';
                                  } else {
                                  despleControlPlagas = 'No';
                                  controlPlagEnferm.clear();
                                  cantidadControlPlag.clear();
                                  fechaAplicacion.clear();
                                }
                              });
                            },
                            children: [
                              // Aquí va el código de tus campos de fertilizantes
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: TextField(
                                            controller: controlPlagEnferm,
                                            focusNode: controlPlagEnfermFocusNode,
                                            onSubmitted: (text) {
                                              FocusScope.of(context).requestFocus(cantidadControlPlagFocusNode);
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  'Producto: Control de plagas y enfermedades',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 90,
                                          child: Chip(
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            backgroundColor:
                                                GlobalColor.colorBotonPrincipal,
                                            label: Text("Texto"),
                                          ),
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
                                            controller: cantidadControlPlag,
                                            focusNode: cantidadControlPlagFocusNode,
                                            onSubmitted: (text) {
                                              FocusScope.of(context).requestFocus(fechaAplicacionFocusNode);
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Cantidad',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 90,
                                          child: Chip(
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            backgroundColor:
                                                GlobalColor.colorBotonPrincipal,
                                            label: Text("Texto"),
                                          ),
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
                                            controller: fechaAplicacion,
                                            focusNode: fechaAplicacionFocusNode,
                                            onSubmitted: (text) {
                                              FocusScope.of(context).requestFocus(observacionesFocusNode);
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Fecha de aplicación ',
                                            ),
                                            readOnly:
                                                true,
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(
                                                          2000),
                                                      lastDate: DateTime(2101));

                                              if (pickedDate != null) {
                                                String formattedDate =
                                                    DateFormat('dd-MM-yyyy')
                                                        .format(pickedDate);
                                                //you can implement different kind of Date Format here according to your requirement
                                                fechaAplicacion.text =
                                                    formattedDate;

                                                setState(() {
                                                  fechaAplicacion.text =
                                                      formattedDate; //set output date to TextField value.
                                                });
                                              } else {
                                                //print("Date is not selected");
                                              }
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 90,
                                          child: Chip(
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            backgroundColor:
                                                GlobalColor.colorBotonPrincipal,
                                            label: Text("Fecha"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: observaciones,
                                focusNode: observacionesFocusNode,
                                onSubmitted: (text) {
                                  FocusScope.of(context).requestFocus(botonGuardar);
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Observaciónes ',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Chip(
                                labelStyle: TextStyle(color: Colors.white),
                                backgroundColor:
                                    GlobalColor.colorBotonPrincipal,
                                label: Text("Texto"),
                              ),
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
                            focusNode: botonGuardar,
                            onPressed: () {
                              addItem();
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('¡Guardado con éxito!'),
                                    content: const Text('El proceso de guardado se ha realizado con éxito.'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: GlobalColor.colorBotonPrincipal,
                                        ),
                                        child: const Text('Cerrar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: GlobalColor.colorBotonPrincipal,
                            ),
                            child: const Text('Guardar muestra'),
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
    if (altura.text == '0.00') {
      altura.text = '';
    }
    if (diametro.text == '0.00') {
      diametro.text = '';
    }
    if (longitudFruto.text == '0.00') {
      longitudFruto.text = '';
    }
    if (diametroFruto.text == '0.00') {
      diametroFruto.text = '';
    }
    if (pesoFruto.text == '0.00') {
      pesoFruto.text = '';
    }
    if (produccionPlanta.text == '0.00') {
      produccionPlanta.text = '';
    }
    if (phSuelo.text == '0.00') {
      phSuelo.text = '';
    }
    if (fosforo.text == '0.00') {
      fosforo.text = '';
    }
    if (potasio.text == '0.00') {
      potasio.text = '';
    }
    if (riegoLluvia.text == '0.00') {
      riegoLluvia.text = '';
    }
    if (nroRacimos.text == '0') {
      nroRacimos.text = '';
    }
    if (nroFloresRacimos.text == '0') {
      nroFloresRacimos.text = '';
    }
    if (nroFloresTotales.text == '0') {
      nroFloresTotales.text = '';
    }
    if (nroFrutosRacimos.text == '0') {
      nroFrutosRacimos.text = '';
    }
    if (nroFrutosTotales.text == '0') {
      nroFrutosTotales.text = '';
    }
    if (mo.text == '0') {
      mo.text = '';
    }
    if (nitrogeno.text == '0') {
      nitrogeno.text = '';
    }
    if (temperatura.text == '0') {
      temperatura.text = '';
    }
    if (humedadRelativa.text == '0') {
      humedadRelativa.text = '';
    }

    await DatabaseHelper.createItem(
        widget.idSiembra,
        altura.text,
        diametro.text,
        nroRacimos.text,
        nroFloresRacimos.text,
        nroFloresTotales.text,
        nroFrutosRacimos.text,
        nroFrutosTotales.text,
        longitudFruto.text,
        diametroFruto.text,
        pesoFruto.text,
        produccionPlanta.text,
        phSuelo.text,
        mo.text,
        nitrogeno.text,
        fosforo.text,
        potasio.text,
        otrosElementos.text,
        temperatura.text,
        humedadRelativa.text,
        riegoLluvia.text,
        fertilizaAbono.text,
        cantidadFertiliza.text,
        fechasAplicFertiliza.text,
        controlPlagEnferm.text,
        cantidadControlPlag.text,
        fechaAplicacion.text,
        observaciones.text,
        widget.dateNow.toString(),
        widget.username,

  );

  }
}
