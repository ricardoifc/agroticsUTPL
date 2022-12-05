import 'package:agrotics/Util/global_color.dart';
import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistroEspecie extends StatefulWidget {
  @override
  _RegistroEspecieState createState() => _RegistroEspecieState();
}

class _RegistroEspecieState extends State<RegistroEspecie> {

  TextEditingController nombre = TextEditingController();
  TextEditingController nombrecientifico = TextEditingController();
  TextEditingController familia = TextEditingController();
  TextEditingController genero = TextEditingController();
  TextEditingController especie = TextEditingController();
  TextEditingController origen = TextEditingController();
  TextEditingController taxonomia = TextEditingController();
  TextEditingController germina_prendimien = TextEditingController();
  TextEditingController variedad = TextEditingController();
  TextEditingController raiz = TextEditingController();
  TextEditingController hojas = TextEditingController();
  TextEditingController tallo = TextEditingController();
  TextEditingController inflorescencia = TextEditingController();
  TextEditingController semillas = TextEditingController();
  TextEditingController material_vegetal = TextEditingController();
  TextEditingController ciclo_de_vida = TextEditingController();
  TextEditingController altura = TextEditingController();
  TextEditingController diametro = TextEditingController();
  TextEditingController clima = TextEditingController();
  TextEditingController optima = TextEditingController();
  TextEditingController temp_germinacion = TextEditingController();
  TextEditingController temp_min_crecimiento = TextEditingController();
  TextEditingController temperaturas = TextEditingController();
  TextEditingController humedad = TextEditingController();
  TextEditingController humendad_porcentaje = TextEditingController();
  TextEditingController suelo = TextEditingController();
  TextEditingController textura_suelo = TextEditingController();
  TextEditingController ph_textura = TextEditingController();
  TextEditingController zona_produccion = TextEditingController();
  TextEditingController epoca_siembra = TextEditingController();
  TextEditingController riesgo_epoca = TextEditingController();
  TextEditingController labores_cultivo = TextEditingController();
  TextEditingController semillero = TextEditingController();
  TextEditingController cantidad_semillero = TextEditingController();
  TextEditingController preparacion_terreno = TextEditingController();
  TextEditingController profun_preparacion = TextEditingController();
  TextEditingController recom_preparacion = TextEditingController();
  TextEditingController plantacion = TextEditingController();
  TextEditingController distancia = TextEditingController();
  TextEditingController surcos = TextEditingController();
  TextEditingController plantas = TextEditingController();
  TextEditingController hileras = TextEditingController();
  TextEditingController buena_asosacion = TextEditingController();
  TextEditingController mala_asocsacion = TextEditingController();
  TextEditingController riesgo = TextEditingController();
  TextEditingController abon_y_fertilizant = TextEditingController();
  TextEditingController mineral_quimico = TextEditingController();
  TextEditingController contr_malas_hierbas = TextEditingController();
  TextEditingController plagas_enfermedades = TextEditingController();
  TextEditingController recol_almacen_dias = TextEditingController();
  TextEditingController recol_almacen_temp = TextEditingController();
  TextEditingController produc_promedia = TextEditingController();
  TextEditingController valor_nutricional = TextEditingController();
  TextEditingController uso_y_aplicacion = TextEditingController();
  final dateNow = DateTime.now();
  var usuario_registro = "admin";

  final _formKey = GlobalKey<FormState>();

  void _register() {
    print('addData');
    var url = Uri.parse(conexion() + "especies/adddataespecie.php");

    http.post(url, body: {
      'nombre': nombre.text,
      'nombrecientifico': nombrecientifico.text,
      'familia': familia.text,
      'genero': genero.text,
      'especie': especie.text,
      'origen': origen.text,
      'taxonomia': taxonomia.text,
      'germina_prendimien': germina_prendimien.text,
      'variedad': variedad.text,
      'raiz': raiz.text,
      'hojas': hojas.text,
      'tallo': tallo.text,
      'inflorescencia': inflorescencia.text,
      'semillas': semillas.text,
      'material_vegetal': material_vegetal.text,
      'ciclo_de_vida': ciclo_de_vida.text,
      'altura': altura.text,
      'diametro': diametro.text,
      'clima': clima.text,
      'optima': optima.text,
      'temp_germinacion': temp_germinacion.text,
      'temp_min_crecimiento': temp_min_crecimiento.text,
      'temperaturas': temperaturas.text,
      'humedad': humedad.text,
      'humendad_porcentaje': humendad_porcentaje.text,
      'suelo': suelo.text,
      'textura_suelo': textura_suelo.text,
      'ph_textura': ph_textura.text,
      'zona_produccion': zona_produccion.text,
      'epoca_siembra': epoca_siembra.text,
      'riesgo_epoca': riesgo_epoca.text,
      'labores_cultivo': labores_cultivo.text,
      'semillero': semillero.text,
      'cantidad_semillero': cantidad_semillero.text,
      'preparacion_terreno': preparacion_terreno.text,
      'profun_preparacion': profun_preparacion.text,
      'recom_preparacion': recom_preparacion.text,
      'plantacion': plantacion.text,
      'distancia': distancia.text,
      'surcos': surcos.text,
      'plantas': plantas.text,
      'hileras': hileras.text,
      'buena_asosacion': buena_asosacion.text,
      'mala_asocsacion': mala_asocsacion.text,
      'riesgo': riesgo.text,
      'abon_y_fertilizant': abon_y_fertilizant.text,
      'mineral_quimico': mineral_quimico.text,
      'contr_malas_hierbas': contr_malas_hierbas.text,
      'plagas_enfermedades': plagas_enfermedades.text,
      'recol_almacen_dias': recol_almacen_dias.text,
      'recol_almacen_temp': recol_almacen_temp.text,
      'produc_promedia': produc_promedia.text,
      'valor_nutricional': valor_nutricional.text,
      'uso_y_aplicacion': uso_y_aplicacion.text,
      "fecha_registro": dateNow.toString(),
      "usuario_registro": usuario_registro,
    });
  }

  //late String _mySelection = "";
  //final List<Map> _myJson = [{"id":0,"name":"docentes"},{"id":1,"name":"alumnos"}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Especie"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Taxonomia"),
          Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: nombre,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'nombre',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: nombrecientifico,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'nombrecientifico',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: familia,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'familia',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: genero,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'genero',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: especie,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'especie',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: origen,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'origen',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: taxonomia,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'taxonomia',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: germina_prendimien,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'germina_prendimien',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: variedad,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'variedad',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: raiz,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'raiz',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: hojas,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'hojas',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: tallo,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'tallo',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: inflorescencia,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'inflorescencia',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: semillas,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'semillas',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: material_vegetal,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'material_vegetal',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: ciclo_de_vida,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'ciclo_de_vida',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: altura,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'altura',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: diametro,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'diametro',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: clima,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'clima',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: optima,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'optima',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: temp_germinacion,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'temp_germinacion',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: temp_min_crecimiento,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'temp_min_crecimiento',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: temperaturas,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'temperaturas',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: humedad,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'humedad',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: humendad_porcentaje,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'humendad_porcentaje',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: suelo,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'suelo',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: textura_suelo,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'textura_suelo',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: ph_textura,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'ph_textura',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: zona_produccion,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'zona_produccion',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: epoca_siembra,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'epoca_siembra',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: riesgo_epoca,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'riesgo_epoca',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: labores_cultivo,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'labores_cultivo',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: semillero,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'semillero',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: cantidad_semillero,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'cantidad_semillero',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: preparacion_terreno,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'preparacion_terreno',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: profun_preparacion,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'profun_preparacion',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: recom_preparacion,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'recom_preparacion',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: plantacion,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'plantacion',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: distancia,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'distancia',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: surcos,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'surcos',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: plantas,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'plantas',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: hileras,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'hileras',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: buena_asosacion,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'buena_asosacion',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: mala_asocsacion,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'mala_asocsacion',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: riesgo,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'riesgo',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: abon_y_fertilizant,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'abon_y_fertilizant',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: mineral_quimico,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'mineral_quimico',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: contr_malas_hierbas,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'contr_malas_hierbas',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: plagas_enfermedades,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'plagas_enfermedades',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: recol_almacen_dias,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'recol_almacen_dias',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: recol_almacen_temp,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'recol_almacen_temp',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: produc_promedia,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'produc_promedia',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: valor_nutricional,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'valor_nutricional',
        ),
      ),
    ),Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: uso_y_aplicacion,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'uso_y_aplicacion',
        ),
      ),
                  ),



        const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: GlobalColor.colorBotonTextPrincipal,
                        color: GlobalColor.colorBotonPrincipal,
                        child: Text('Agregar'),
                        onPressed: () {
                          _register();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      )),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: GlobalColor.colorBotonTextPrincipal,
                        color: GlobalColor.colorBotonPrincipal,
                        child: Text('Salir'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
