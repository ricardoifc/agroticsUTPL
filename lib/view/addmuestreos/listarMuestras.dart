import 'package:flutter/material.dart';
import 'package:agrotics/model/database_muestras.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ListaMuestras extends StatefulWidget {
  const ListaMuestras({Key? key}) : super(key: key);

  @override
  _ListaMuestrasState createState() => _ListaMuestrasState();
}

class _ListaMuestrasState extends State<ListaMuestras> {
  List<Map<String, dynamic>> myData = [];

  bool _isLoading = true;

  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      myData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData(); // Loading the data when the app starts
  }

  final TextEditingController _id_siembraController = TextEditingController();
  //final TextEditingController _fecha_muestreoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _diametroController = TextEditingController();
  final TextEditingController _nro_racimosController = TextEditingController();
  final TextEditingController _nro_flores_racimosController =
      TextEditingController();
  final TextEditingController _nro_flores_totalesController =
      TextEditingController();
  final TextEditingController _nro_frutos_racimosController =
      TextEditingController();
  final TextEditingController _nro_frutos_totalesController =
      TextEditingController();
  final TextEditingController _longitud_frutoController =
      TextEditingController();
  final TextEditingController _diametro_frutoController =
      TextEditingController();
  final TextEditingController _peso_frutoController = TextEditingController();
  final TextEditingController _produccion_plantaController =
      TextEditingController();
  final TextEditingController _ph_sueloController = TextEditingController();
  final TextEditingController _moController = TextEditingController();
  final TextEditingController _nitrogenoController = TextEditingController();
  final TextEditingController _fosforoController = TextEditingController();
  final TextEditingController _potasioController = TextEditingController();
  final TextEditingController _otros_elementosController =
      TextEditingController();
  final TextEditingController _temperaturaController = TextEditingController();
  final TextEditingController _humedad_relativaController =
      TextEditingController();
  final TextEditingController _riego_lluviaController = TextEditingController();
  final TextEditingController _fertiliza_abonoController =
      TextEditingController();
  final TextEditingController _cantidad_fertilizaController =
      TextEditingController();
  final TextEditingController _fechas_aplic_fertilizaController =
      TextEditingController();
  final TextEditingController _control_plag_enfermController =
      TextEditingController();
  final TextEditingController _cantidad_control_plagController =
      TextEditingController();
  final TextEditingController _fecha_aplicacionController =
      TextEditingController();
  final TextEditingController _observacionesController =
      TextEditingController();
  final TextEditingController _fecha_registroController =
      TextEditingController();
  final TextEditingController _usuario_registroController =
      TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void showMyForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingData = myData.firstWhere((element) => element['id'] == id);
      _id_siembraController.text = existingData['id_siembra'];
      //_fecha_muestreoController.text = existingData['fecha_muestreo'];
      _alturaController.text = existingData['altura'];
      _diametroController.text = existingData['diametro'];
      _nro_racimosController.text = existingData['nro_racimos'];
      _nro_flores_racimosController.text = existingData['nro_flores_racimos'];
      _nro_flores_totalesController.text = existingData['nro_flores_totales'];
      _nro_frutos_racimosController.text = existingData['nro_frutos_racimos'];
      _nro_frutos_totalesController.text = existingData['nro_frutos_totales'];
      _longitud_frutoController.text = existingData['longitud_fruto'];
      _diametro_frutoController.text = existingData['diametro_fruto'];
      _peso_frutoController.text = existingData['peso_fruto'];
      _produccion_plantaController.text = existingData['produccion_planta'];
      _ph_sueloController.text = existingData['ph_suelo'];
      _moController.text = existingData['mo'];
      _nitrogenoController.text = existingData['nitrogeno'];
      _fosforoController.text = existingData['fosforo'];
      _potasioController.text = existingData['potasio'];
      _otros_elementosController.text = existingData['otros_elementos'];
      _temperaturaController.text = existingData['temperatura'];
      _humedad_relativaController.text = existingData['humedad_relativa'];
      _riego_lluviaController.text = existingData['riego_lluvia'];
      _fertiliza_abonoController.text = existingData['fertiliza_abono'];
      _cantidad_fertilizaController.text = existingData['cantidad_fertiliza'];
      _fechas_aplic_fertilizaController.text =
          existingData['fechas_aplic_fertiliza'];
      _control_plag_enfermController.text = existingData['control_plag_enferm'];
      _cantidad_control_plagController.text =
          existingData['cantidad_control_plag'];
      _fecha_aplicacionController.text = existingData['fecha_aplicacion'];
      _observacionesController.text = existingData['observaciones'];
      _fecha_registroController.text = existingData['fecha_registro'];
      _usuario_registroController.text = existingData['usuario_registro'];
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      //isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
            //top: 15,
            //left: 15,
            //right: 15,
            // prevent the soft keyboard from covering the text fields
            // bottom: MediaQuery.of(context).viewInsets.bottom + 120,
            ),
        // child: ListView(
        //children: <Widget>[
        child: ListView(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _id_siembraController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'id de siembra',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Altura (cm)',
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
                    controller: _diametroController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Díametro (cm)',
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
            child: TextField(
              controller: _nro_racimosController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nro de racimos',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _nro_flores_racimosController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nro Flores/racimo',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _nro_flores_totalesController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nro Flores totales planta',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _nro_frutos_racimosController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nro frutos/racimo',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _nro_frutos_totalesController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nro frutos totales planta',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _longitud_frutoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Longitud fruto (cm)',
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
                    controller: _diametro_frutoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Diametro fruto (cm)',
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
                    controller: _peso_frutoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Peso del fruto (g)',
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
                    controller: _produccion_plantaController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Producción/planta (kg)',
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
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _ph_sueloController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
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
                    controller: _moController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ' molibdeno (Mo)',
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
                    controller: _nitrogenoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
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
                    controller: _fosforoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Fósforo (mg/hg)',
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
                    controller: _potasioController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Potasio (Cmol/kg)',
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
            child: TextField(
              controller: _otros_elementosController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Otros elementos ',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _temperaturaController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Temperatura (°C)',
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
                    controller: _humedad_relativaController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
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
                    controller: _riego_lluviaController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Riego/lluvia (mL/planta)',
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
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _fertiliza_abonoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Fertilización/fertilizante/abono',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _cantidad_fertilizaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cantidad',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _fechas_aplic_fertilizaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Fechas de aplicación de fertilizante ',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _control_plag_enfermController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Control de plagas y enfermedades/poducto',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _cantidad_control_plagController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'cantidad control plagas',
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller:
                    _fecha_aplicacionController, //editing controller of this TextField
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'fecha de aplicación ',
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
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      _fecha_aplicacionController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              )),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _observacionesController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Observaciónes ',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _fecha_registroController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'fecha reg ',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _usuario_registroController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'usuario ',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // Save new data
              if (id == null) {
                await addItem();
              }

              if (id != null) {
                await updateItem(id);
              }

              // Clear the text fields
              _id_siembraController.text = '';
              //_fecha_muestreoController.text = '';
              _alturaController.text = '';
              _diametroController.text = '';
              _nro_racimosController.text = '';
              _nro_flores_racimosController.text = '';
              _nro_flores_totalesController.text = '';
              _nro_frutos_racimosController.text = '';
              _nro_frutos_totalesController.text = '';
              _longitud_frutoController.text = '';
              _diametro_frutoController.text = '';
              _peso_frutoController.text = '';
              _produccion_plantaController.text = '';
              _ph_sueloController.text = '';
              _moController.text = '';
              _nitrogenoController.text = '';
              _fosforoController.text = '';
              _potasioController.text = '';
              _otros_elementosController.text = '';
              _temperaturaController.text = '';
              _humedad_relativaController.text = '';
              _riego_lluviaController.text = '';
              _fertiliza_abonoController.text = '';
              _cantidad_fertilizaController.text = '';
              _fechas_aplic_fertilizaController.text = '';
              _control_plag_enfermController.text = '';
              _cantidad_control_plagController.text = '';
              _fecha_aplicacionController.text = '';
              _observacionesController.text = '';
              _fecha_registroController.text = '';
              _usuario_registroController.text = '';

              // Close the bottom sheet
              Navigator.of(context).pop();
            },
            child: Text(id == null ? 'Create New' : 'Update'),
          )
        ]),
      ),
      //]
      //),
      // ),
    );
  }

// Insert a new data to the database
  Future<void> addItem() async {
    await DatabaseHelper.createItem(
        _id_siembraController.text,
        //_fecha_muestreoController.text,
        _alturaController.text,
        _diametroController.text,
        _nro_racimosController.text,
        _nro_flores_racimosController.text,
        _nro_flores_totalesController.text,
        _nro_frutos_racimosController.text,
        _nro_frutos_totalesController.text,
        _longitud_frutoController.text,
        _diametro_frutoController.text,
        _peso_frutoController.text,
        _produccion_plantaController.text,
        _ph_sueloController.text,
        _moController.text,
        _nitrogenoController.text,
        _fosforoController.text,
        _potasioController.text,
        _otros_elementosController.text,
        _temperaturaController.text,
        _humedad_relativaController.text,
        _riego_lluviaController.text,
        _fertiliza_abonoController.text,
        _cantidad_fertilizaController.text,
        _fechas_aplic_fertilizaController.text,
        _control_plag_enfermController.text,
        _cantidad_control_plagController.text,
        _fecha_aplicacionController.text,
        _observacionesController.text,
        _fecha_registroController.text,
        _usuario_registroController.text);
    _refreshData();
  }

  // Update an existing data
  Future<void> updateItem(int id) async {
    await DatabaseHelper.updateItem(
      id,
      _id_siembraController.text,
      //_fecha_muestreoController.text,
      _alturaController.text,
      _diametroController.text,
      _nro_racimosController.text,
      _nro_flores_racimosController.text,
      _nro_flores_totalesController.text,
      _nro_frutos_racimosController.text,
      _nro_frutos_totalesController.text,
      _longitud_frutoController.text,
      _diametro_frutoController.text,
      _peso_frutoController.text,
      _produccion_plantaController.text,
      _ph_sueloController.text,
      _moController.text,
      _nitrogenoController.text,
      _fosforoController.text,
      _potasioController.text,
      _otros_elementosController.text,
      _temperaturaController.text,
      _humedad_relativaController.text,
      _riego_lluviaController.text,
      _fertiliza_abonoController.text,
      _cantidad_fertilizaController.text,
      _fechas_aplic_fertilizaController.text,
      _control_plag_enfermController.text,
      _cantidad_control_plagController.text,
      _fecha_aplicacionController.text,
      _observacionesController.text,
      _fecha_registroController.text,
      _usuario_registroController.text,
    );
    _refreshData();
  }

  // Delete an item
  void deleteItem(int id) async {
    await DatabaseHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully deleted!'), backgroundColor: Colors.green));
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muestras guardadas'),
      ),
      body:
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : myData.isEmpty
                  ? const Center(child: Text("No Data Available!!!"))
                  : ListView.builder(
                      itemCount: myData.length,
                      itemBuilder: (context, index) => Card(
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
                                    icon: const Icon(Icons.edit),
                                    onPressed: () =>
                                        showMyForm(myData[index]['id']),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () =>
                                        deleteItem(myData[index]['id']),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
          /*floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showMyForm(null),
      ),*/
    );
  }
}
