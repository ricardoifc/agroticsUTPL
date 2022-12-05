import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarMuestras extends StatefulWidget {
  final List list;
  final int index;

  EditarMuestras({required this.list, required this.index});

  @override
  _EditarMuestrasState createState() => _EditarMuestrasState();
}

class _EditarMuestrasState extends State<EditarMuestras> {
  TextEditingController id_siembra = TextEditingController();
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
  TextEditingController fecha_registro = TextEditingController();
  TextEditingController usuario_registro = TextEditingController();



  void editData() {
    print("editespecies.php");
    var url = Uri.parse(conexion() + "muestras/editdatamuestras.php");
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "id_siembra": id_siembra.text,
      "fecha_muestreo": fecha_muestreo.text,
      "altura": altura.text,
      "diametro": diametro.text,
      "nro_racimos": nro_racimos.text,
      "nro_flores_racimos": nro_flores_racimos.text,
      "nro_flores_totales": nro_flores_totales.text,
      "nro_frutos_racimos": nro_frutos_racimos.text,
      "nro_frutos_totales": nro_frutos_totales.text,
      "longitud_fruto": longitud_fruto.text,
      "diametro_fruto": diametro_fruto.text,
      "peso_fruto": peso_fruto.text,
      "produccion_planta": produccion_planta.text,
      "ph_suelo": ph_suelo.text,
      "mo": mo.text,
      "nitrogeno": nitrogeno.text,
      "fosforo": fosforo.text,
      "potasio": potasio.text,
      "otros_elementos": otros_elementos.text,
      "temperatura": temperatura.text,
      "humedad_relativa": humedad_relativa.text,
      "riego_lluvia": riego_lluvia.text,
      "fertiliza_abono": fertiliza_abono.text,
      "cantidad_fertiliza": cantidad_fertiliza.text,
      "fechas_aplic_fertiliza": fechas_aplic_fertiliza.text,
      "control_plag_enferm": control_plag_enferm.text,
      "cantidad_control_plag": cantidad_control_plag.text,
      "fecha_aplicacion": fecha_aplicacion.text,
      "observaciones": observaciones.text,
      "fecha_registro": fecha_registro.text,
      "usuario_registro": usuario_registro.text,



    });
  }

  @override
  void initState() {
    id_siembra= TextEditingController(text: widget.list[widget.index]['id_siembra'] );
    fecha_muestreo= TextEditingController(text: widget.list[widget.index]['fecha_muestreo'] );
    altura= TextEditingController(text: widget.list[widget.index]['altura'] );
    diametro= TextEditingController(text: widget.list[widget.index]['diametro'] );
    nro_racimos= TextEditingController(text: widget.list[widget.index]['nro_racimos'] );
    nro_flores_racimos= TextEditingController(text: widget.list[widget.index]['nro_flores_racimos'] );
    nro_flores_totales= TextEditingController(text: widget.list[widget.index]['nro_flores_totales'] );
    nro_frutos_racimos= TextEditingController(text: widget.list[widget.index]['nro_frutos_racimos'] );
    nro_frutos_totales= TextEditingController(text: widget.list[widget.index]['nro_frutos_totales'] );
    longitud_fruto= TextEditingController(text: widget.list[widget.index]['longitud_fruto'] );
    diametro_fruto= TextEditingController(text: widget.list[widget.index]['diametro_fruto'] );
    peso_fruto= TextEditingController(text: widget.list[widget.index]['peso_fruto'] );
    produccion_planta= TextEditingController(text: widget.list[widget.index]['produccion_planta'] );
    ph_suelo= TextEditingController(text: widget.list[widget.index]['ph_suelo'] );
    mo= TextEditingController(text: widget.list[widget.index]['mo'] );
    nitrogeno= TextEditingController(text: widget.list[widget.index]['nitrogeno'] );
    fosforo= TextEditingController(text: widget.list[widget.index]['fosforo'] );
    potasio= TextEditingController(text: widget.list[widget.index]['potasio'] );
    otros_elementos= TextEditingController(text: widget.list[widget.index]['otros_elementos'] );
    temperatura= TextEditingController(text: widget.list[widget.index]['temperatura'] );
    humedad_relativa= TextEditingController(text: widget.list[widget.index]['humedad_relativa'] );
    riego_lluvia= TextEditingController(text: widget.list[widget.index]['riego_lluvia'] );
    fertiliza_abono= TextEditingController(text: widget.list[widget.index]['fertiliza_abono'] );
    cantidad_fertiliza= TextEditingController(text: widget.list[widget.index]['cantidad_fertiliza'] );
    fechas_aplic_fertiliza= TextEditingController(text: widget.list[widget.index]['fechas_aplic_fertiliza'] );
    control_plag_enferm= TextEditingController(text: widget.list[widget.index]['control_plag_enferm'] );
    cantidad_control_plag= TextEditingController(text: widget.list[widget.index]['cantidad_control_plag'] );
    fecha_aplicacion= TextEditingController(text: widget.list[widget.index]['fecha_aplicacion'] );
    observaciones= TextEditingController(text: widget.list[widget.index]['observaciones'] );
    fecha_registro= TextEditingController(text: widget.list[widget.index]['fecha_registro'] );
    usuario_registro= TextEditingController(text: widget.list[widget.index]['usuario_registro'] );




    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EDITAR"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Column(
              children: <Widget>[

        ListTile(
        title: TextFormField(
        controller: id_siembra,
          validator: (value) {
            if (value == null) return 'Ingresa identificador de siembra' ;
          },
          decoration: const InputDecoration(
            hintText: 'identificador de siembra', labelText: 'identificador de siembra',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: fecha_muestreo,
          validator: (value) {
            if (value == null) return 'Ingresa fecha_muestreo' ;
          },
          decoration: const InputDecoration(
            hintText: 'fecha_muestreo', labelText: 'fecha_muestreo',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: altura,
          validator: (value) {
            if (value == null) return 'Ingresa altura' ;
          },
          decoration: const InputDecoration(
            hintText: 'altura', labelText: 'altura',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: diametro,
          validator: (value) {
            if (value == null) return 'Ingresa diametro' ;
          },
          decoration: const InputDecoration(
            hintText: 'diametro', labelText: 'diametro',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: nro_racimos,
          validator: (value) {
            if (value == null) return 'Ingresa nro_racimos' ;
          },
          decoration: const InputDecoration(
            hintText: 'nro_racimos', labelText: 'nro_racimos',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: nro_flores_racimos,
          validator: (value) {
            if (value == null) return 'Ingresa nro_flores_racimos' ;
          },
          decoration: const InputDecoration(
            hintText: 'nro_flores_racimos', labelText: 'nro_flores_racimos',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: nro_flores_totales,
          validator: (value) {
            if (value == null) return 'Ingresa nro_flores_totales' ;
          },
          decoration: const InputDecoration(
            hintText: 'nro_flores_totales', labelText: 'nro_flores_totales',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: nro_frutos_racimos,
          validator: (value) {
            if (value == null) return 'Ingresa nro_frutos_racimos' ;
          },
          decoration: const InputDecoration(
            hintText: 'nro_frutos_racimos', labelText: 'nro_frutos_racimos',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: nro_frutos_totales,
          validator: (value) {
            if (value == null) return 'Ingresa nro_frutos_totales' ;
          },
          decoration: const InputDecoration(
            hintText: 'nro_frutos_totales', labelText: 'nro_frutos_totales',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: longitud_fruto,
          validator: (value) {
            if (value == null) return 'Ingresa longitud_fruto' ;
          },
          decoration: const InputDecoration(
            hintText: 'longitud_fruto', labelText: 'longitud_fruto',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: diametro_fruto,
          validator: (value) {
            if (value == null) return 'Ingresa diametro_fruto' ;
          },
          decoration: const InputDecoration(
            hintText: 'diametro_fruto', labelText: 'diametro_fruto',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: peso_fruto,
          validator: (value) {
            if (value == null) return 'Ingresa peso_fruto' ;
          },
          decoration: const InputDecoration(
            hintText: 'peso_fruto', labelText: 'peso_fruto',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: produccion_planta,
          validator: (value) {
            if (value == null) return 'Ingresa produccion_planta' ;
          },
          decoration: const InputDecoration(
            hintText: 'produccion_planta', labelText: 'produccion_planta',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: ph_suelo,
          validator: (value) {
            if (value == null) return 'Ingresa ph_suelo' ;
          },
          decoration: const InputDecoration(
            hintText: 'ph_suelo', labelText: 'ph_suelo',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: mo,
          validator: (value) {
            if (value == null) return 'Ingresa mo' ;
          },
          decoration: const InputDecoration(
            hintText: 'mo', labelText: 'mo',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: nitrogeno,
          validator: (value) {
            if (value == null) return 'Ingresa nitrogeno' ;
          },
          decoration: const InputDecoration(
            hintText: 'nitrogeno', labelText: 'nitrogeno',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: fosforo,
          validator: (value) {
            if (value == null) return 'Ingresa fosforo' ;
          },
          decoration: const InputDecoration(
            hintText: 'fosforo', labelText: 'fosforo',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: potasio,
          validator: (value) {
            if (value == null) return 'Ingresa potasio' ;
          },
          decoration: const InputDecoration(
            hintText: 'potasio', labelText: 'potasio',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: otros_elementos,
          validator: (value) {
            if (value == null) return 'Ingresa otros_elementos' ;
          },
          decoration: const InputDecoration(
            hintText: 'otros_elementos', labelText: 'otros_elementos',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: temperatura,
          validator: (value) {
            if (value == null) return 'Ingresa temperatura' ;
          },
          decoration: const InputDecoration(
            hintText: 'temperatura', labelText: 'temperatura',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: humedad_relativa,
          validator: (value) {
            if (value == null) return 'Ingresa humedad_relativa' ;
          },
          decoration: const InputDecoration(
            hintText: 'humedad_relativa', labelText: 'humedad_relativa',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: riego_lluvia,
          validator: (value) {
            if (value == null) return 'Ingresa riego_lluvia' ;
          },
          decoration: const InputDecoration(
            hintText: 'riego_lluvia', labelText: 'riego_lluvia',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: fertiliza_abono,
          validator: (value) {
            if (value == null) return 'Ingresa fertiliza_abono' ;
          },
          decoration: const InputDecoration(
            hintText: 'fertiliza_abono', labelText: 'fertiliza_abono',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: cantidad_fertiliza,
          validator: (value) {
            if (value == null) return 'Ingresa cantidad_fertiliza' ;
          },
          decoration: const InputDecoration(
            hintText: 'cantidad_fertiliza', labelText: 'cantidad_fertiliza',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: fechas_aplic_fertiliza,
          validator: (value) {
            if (value == null) return 'Ingresa fechas_aplic_fertiliza' ;
          },
          decoration: const InputDecoration(
            hintText: 'fechas_aplic_fertiliza', labelText: 'fechas_aplic_fertiliza',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: control_plag_enferm,
          validator: (value) {
            if (value == null) return 'Ingresa control_plag_enferm' ;
          },
          decoration: const InputDecoration(
            hintText: 'control_plag_enferm', labelText: 'control_plag_enferm',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: cantidad_control_plag,
          validator: (value) {
            if (value == null) return 'Ingresa cantidad_control_plag' ;
          },
          decoration: const InputDecoration(
            hintText: 'cantidad_control_plag', labelText: 'cantidad_control_plag',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: fecha_aplicacion,
          validator: (value) {
            if (value == null) return 'Ingresa fecha_aplicacion' ;
          },
          decoration: const InputDecoration(
            hintText: 'fecha_aplicacion', labelText: 'fecha_aplicacion',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: usuario_registro,
          validator: (value) {
            if (value == null) return 'Ingresa usuario_registro' ;
          },
          decoration: const InputDecoration(
            hintText: 'usuario_registro', labelText: 'usuario_registro',
          ),
        ),
      ),





      const Divider(
                  height: 1.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("Guardar"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
