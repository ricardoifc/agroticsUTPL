import 'package:agrotics/conexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarEspecie extends StatefulWidget {
  final List list;
  final int index;

  EditarEspecie({required this.list, required this.index});

  @override
  _EditarEspecieState createState() => _EditarEspecieState();
}

class _EditarEspecieState extends State<EditarEspecie> {
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



  void editData() {
    print("editespecies.php");
    var url = Uri.parse(conexion() + "especies/editdataespecie.php");
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "nombre": nombre.text,
      "nombrecientifico": nombrecientifico.text,
      "familia": familia.text,
      "genero": genero.text,
      "especie": especie.text,
      "origen": origen.text,
      "taxonomia": taxonomia.text,
      "germina_prendimien": germina_prendimien.text,
      "variedad": variedad.text,
      "raiz": raiz.text,
      "hojas": hojas.text,
      "tallo": tallo.text,
      "inflorescencia": inflorescencia.text,
      "semillas": semillas.text,
      "material_vegetal": material_vegetal.text,
      "ciclo_de_vida": ciclo_de_vida.text,
      "altura": altura.text,
      "diametro": diametro.text,
      "clima": clima.text,
      "optima": optima.text,
      "temp_germinacion": temp_germinacion.text,
      "temp_min_crecimiento": temp_min_crecimiento.text,
      "temperaturas": temperaturas.text,
      "humedad": humedad.text,
      "humendad_porcentaje": humendad_porcentaje.text,
      "suelo": suelo.text,
      "textura_suelo": textura_suelo.text,
      "ph_textura": ph_textura.text,
      "zona_produccion": zona_produccion.text,
      "epoca_siembra": epoca_siembra.text,
      "riesgo_epoca": riesgo_epoca.text,
      "labores_cultivo": labores_cultivo.text,
      "semillero": semillero.text,
      "cantidad_semillero": cantidad_semillero.text,
      "preparacion_terreno": preparacion_terreno.text,
      "profun_preparacion": profun_preparacion.text,
      "recom_preparacion": recom_preparacion.text,
      "plantacion": plantacion.text,
      "distancia": distancia.text,
      "surcos": surcos.text,
      "plantas": plantas.text,
      "hileras": hileras.text,
      "buena_asosacion": buena_asosacion.text,
      "mala_asocsacion": mala_asocsacion.text,
      "riesgo": riesgo.text,
      "abon_y_fertilizant": abon_y_fertilizant.text,
      "mineral_quimico": mineral_quimico.text,
      "contr_malas_hierbas": contr_malas_hierbas.text,
      "plagas_enfermedades": plagas_enfermedades.text,
      "recol_almacen_dias": recol_almacen_dias.text,
      "recol_almacen_temp": recol_almacen_temp.text,
      "produc_promedia": produc_promedia.text,
      "valor_nutricional": valor_nutricional.text,
      "uso_y_aplicacion": uso_y_aplicacion.text,

    });
  }

  @override
  void initState() {
    nombre= TextEditingController(text: widget.list[widget.index]['nombre'] );
    nombrecientifico= TextEditingController(text: widget.list[widget.index]['nombrecientifico'] );
    familia= TextEditingController(text: widget.list[widget.index]['familia'] );
    genero= TextEditingController(text: widget.list[widget.index]['genero'] );
    especie= TextEditingController(text: widget.list[widget.index]['especie'] );
    origen= TextEditingController(text: widget.list[widget.index]['origen'] );
    taxonomia= TextEditingController(text: widget.list[widget.index]['taxonomia'] );
    germina_prendimien= TextEditingController(text: widget.list[widget.index]['germina_prendimien'] );
    variedad= TextEditingController(text: widget.list[widget.index]['variedad'] );
    raiz= TextEditingController(text: widget.list[widget.index]['raiz'] );
    hojas= TextEditingController(text: widget.list[widget.index]['hojas'] );
    tallo= TextEditingController(text: widget.list[widget.index]['tallo'] );
    inflorescencia= TextEditingController(text: widget.list[widget.index]['inflorescencia'] );
    semillas= TextEditingController(text: widget.list[widget.index]['semillas'] );
    material_vegetal= TextEditingController(text: widget.list[widget.index]['material_vegetal'] );
    ciclo_de_vida= TextEditingController(text: widget.list[widget.index]['ciclo_de_vida'] );
    altura= TextEditingController(text: widget.list[widget.index]['altura'] );
    diametro= TextEditingController(text: widget.list[widget.index]['diametro'] );
    clima= TextEditingController(text: widget.list[widget.index]['clima'] );
    optima= TextEditingController(text: widget.list[widget.index]['optima'] );
    temp_germinacion= TextEditingController(text: widget.list[widget.index]['temp_germinacion'] );
    temp_min_crecimiento= TextEditingController(text: widget.list[widget.index]['temp_min_crecimiento'] );
    temperaturas= TextEditingController(text: widget.list[widget.index]['temperaturas'] );
    humedad= TextEditingController(text: widget.list[widget.index]['humedad'] );
    humendad_porcentaje= TextEditingController(text: widget.list[widget.index]['humendad_porcentaje'] );
    suelo= TextEditingController(text: widget.list[widget.index]['suelo'] );
    textura_suelo= TextEditingController(text: widget.list[widget.index]['textura_suelo'] );
    ph_textura= TextEditingController(text: widget.list[widget.index]['ph_textura'] );
    zona_produccion= TextEditingController(text: widget.list[widget.index]['zona_produccion'] );
    epoca_siembra= TextEditingController(text: widget.list[widget.index]['epoca_siembra'] );
    riesgo_epoca= TextEditingController(text: widget.list[widget.index]['riesgo_epoca'] );
    labores_cultivo= TextEditingController(text: widget.list[widget.index]['labores_cultivo'] );
    semillero= TextEditingController(text: widget.list[widget.index]['semillero'] );
    cantidad_semillero= TextEditingController(text: widget.list[widget.index]['cantidad_semillero'] );
    preparacion_terreno= TextEditingController(text: widget.list[widget.index]['preparacion_terreno'] );
    profun_preparacion= TextEditingController(text: widget.list[widget.index]['profun_preparacion'] );
    recom_preparacion= TextEditingController(text: widget.list[widget.index]['recom_preparacion'] );
    plantacion= TextEditingController(text: widget.list[widget.index]['plantacion'] );
    distancia= TextEditingController(text: widget.list[widget.index]['distancia'] );
    surcos= TextEditingController(text: widget.list[widget.index]['surcos'] );
    plantas= TextEditingController(text: widget.list[widget.index]['plantas'] );
    hileras= TextEditingController(text: widget.list[widget.index]['hileras'] );
    buena_asosacion= TextEditingController(text: widget.list[widget.index]['buena_asosacion'] );
    mala_asocsacion= TextEditingController(text: widget.list[widget.index]['mala_asocsacion'] );
    riesgo= TextEditingController(text: widget.list[widget.index]['riesgo'] );
    abon_y_fertilizant= TextEditingController(text: widget.list[widget.index]['abon_y_fertilizant'] );
    mineral_quimico= TextEditingController(text: widget.list[widget.index]['mineral_quimico'] );
    contr_malas_hierbas= TextEditingController(text: widget.list[widget.index]['contr_malas_hierbas'] );
    plagas_enfermedades= TextEditingController(text: widget.list[widget.index]['plagas_enfermedades'] );
    recol_almacen_dias= TextEditingController(text: widget.list[widget.index]['recol_almacen_dias'] );
    recol_almacen_temp= TextEditingController(text: widget.list[widget.index]['recol_almacen_temp'] );
    produc_promedia= TextEditingController(text: widget.list[widget.index]['produc_promedia'] );
    valor_nutricional= TextEditingController(text: widget.list[widget.index]['valor_nutricional'] );
    uso_y_aplicacion= TextEditingController(text: widget.list[widget.index]['uso_y_aplicacion'] );

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
        controller: nombre,
          validator: (value) {
            if (value == null) return 'Ingresa nombre' ;
          },
          decoration: const InputDecoration(
            hintText: 'nombre', labelText: 'nombre',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: nombrecientifico,
          validator: (value) {
            if (value == null) return 'Ingresa nombrecientifico' ;
          },
          decoration: const InputDecoration(
            hintText: 'nombrecientifico', labelText: 'nombrecientifico',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: familia,
          validator: (value) {
            if (value == null) return 'Ingresa familia' ;
          },
          decoration: const InputDecoration(
            hintText: 'familia', labelText: 'familia',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: genero,
          validator: (value) {
            if (value == null) return 'Ingresa genero' ;
          },
          decoration: const InputDecoration(
            hintText: 'genero', labelText: 'genero',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: especie,
          validator: (value) {
            if (value == null) return 'Ingresa especie' ;
          },
          decoration: const InputDecoration(
            hintText: 'especie', labelText: 'especie',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: origen,
          validator: (value) {
            if (value == null) return 'Ingresa origen' ;
          },
          decoration: const InputDecoration(
            hintText: 'origen', labelText: 'origen',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: taxonomia,
          validator: (value) {
            if (value == null) return 'Ingresa taxonomia' ;
          },
          decoration: const InputDecoration(
            hintText: 'taxonomia', labelText: 'taxonomia',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: germina_prendimien,
          validator: (value) {
            if (value == null) return 'Ingresa germina_prendimien' ;
          },
          decoration: const InputDecoration(
            hintText: 'germina_prendimien', labelText: 'germina_prendimien',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: variedad,
          validator: (value) {
            if (value == null) return 'Ingresa variedad' ;
          },
          decoration: const InputDecoration(
            hintText: 'variedad', labelText: 'variedad',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: raiz,
          validator: (value) {
            if (value == null) return 'Ingresa raiz' ;
          },
          decoration: const InputDecoration(
            hintText: 'raiz', labelText: 'raiz',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: hojas,
          validator: (value) {
            if (value == null) return 'Ingresa hojas' ;
          },
          decoration: const InputDecoration(
            hintText: 'hojas', labelText: 'hojas',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: tallo,
          validator: (value) {
            if (value == null) return 'Ingresa tallo' ;
          },
          decoration: const InputDecoration(
            hintText: 'tallo', labelText: 'tallo',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: inflorescencia,
          validator: (value) {
            if (value == null) return 'Ingresa inflorescencia' ;
          },
          decoration: const InputDecoration(
            hintText: 'inflorescencia', labelText: 'inflorescencia',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: semillas,
          validator: (value) {
            if (value == null) return 'Ingresa semillas' ;
          },
          decoration: const InputDecoration(
            hintText: 'semillas', labelText: 'semillas',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: material_vegetal,
          validator: (value) {
            if (value == null) return 'Ingresa material_vegetal' ;
          },
          decoration: const InputDecoration(
            hintText: 'material_vegetal', labelText: 'material_vegetal',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: ciclo_de_vida,
          validator: (value) {
            if (value == null) return 'Ingresa ciclo_de_vida' ;
          },
          decoration: const InputDecoration(
            hintText: 'ciclo_de_vida', labelText: 'ciclo_de_vida',
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
          controller: clima,
          validator: (value) {
            if (value == null) return 'Ingresa clima' ;
          },
          decoration: const InputDecoration(
            hintText: 'clima', labelText: 'clima',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: optima,
          validator: (value) {
            if (value == null) return 'Ingresa optima' ;
          },
          decoration: const InputDecoration(
            hintText: 'optima', labelText: 'optima',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: temp_germinacion,
          validator: (value) {
            if (value == null) return 'Ingresa temp_germinacion' ;
          },
          decoration: const InputDecoration(
            hintText: 'temp_germinacion', labelText: 'temp_germinacion',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: temp_min_crecimiento,
          validator: (value) {
            if (value == null) return 'Ingresa temp_min_crecimiento' ;
          },
          decoration: const InputDecoration(
            hintText: 'temp_min_crecimiento', labelText: 'temp_min_crecimiento',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: temperaturas,
          validator: (value) {
            if (value == null) return 'Ingresa temperaturas' ;
          },
          decoration: const InputDecoration(
            hintText: 'temperaturas', labelText: 'temperaturas',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: humedad,
          validator: (value) {
            if (value == null) return 'Ingresa humedad' ;
          },
          decoration: const InputDecoration(
            hintText: 'humedad', labelText: 'humedad',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: humendad_porcentaje,
          validator: (value) {
            if (value == null) return 'Ingresa humendad_porcentaje' ;
          },
          decoration: const InputDecoration(
            hintText: 'humendad_porcentaje', labelText: 'humendad_porcentaje',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: suelo,
          validator: (value) {
            if (value == null) return 'Ingresa suelo' ;
          },
          decoration: const InputDecoration(
            hintText: 'suelo', labelText: 'suelo',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: textura_suelo,
          validator: (value) {
            if (value == null) return 'Ingresa textura_suelo' ;
          },
          decoration: const InputDecoration(
            hintText: 'textura_suelo', labelText: 'textura_suelo',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: ph_textura,
          validator: (value) {
            if (value == null) return 'Ingresa ph_textura' ;
          },
          decoration: const InputDecoration(
            hintText: 'ph_textura', labelText: 'ph_textura',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: zona_produccion,
          validator: (value) {
            if (value == null) return 'Ingresa zona_produccion' ;
          },
          decoration: const InputDecoration(
            hintText: 'zona_produccion', labelText: 'zona_produccion',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: epoca_siembra,
          validator: (value) {
            if (value == null) return 'Ingresa epoca_siembra' ;
          },
          decoration: const InputDecoration(
            hintText: 'epoca_siembra', labelText: 'epoca_siembra',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: riesgo_epoca,
          validator: (value) {
            if (value == null) return 'Ingresa riesgo_epoca' ;
          },
          decoration: const InputDecoration(
            hintText: 'riesgo_epoca', labelText: 'riesgo_epoca',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: labores_cultivo,
          validator: (value) {
            if (value == null) return 'Ingresa labores_cultivo' ;
          },
          decoration: const InputDecoration(
            hintText: 'labores_cultivo', labelText: 'labores_cultivo',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: semillero,
          validator: (value) {
            if (value == null) return 'Ingresa semillero' ;
          },
          decoration: const InputDecoration(
            hintText: 'semillero', labelText: 'semillero',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: cantidad_semillero,
          validator: (value) {
            if (value == null) return 'Ingresa cantidad_semillero' ;
          },
          decoration: const InputDecoration(
            hintText: 'cantidad_semillero', labelText: 'cantidad_semillero',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: preparacion_terreno,
          validator: (value) {
            if (value == null) return 'Ingresa preparacion_terreno' ;
          },
          decoration: const InputDecoration(
            hintText: 'preparacion_terreno', labelText: 'preparacion_terreno',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: profun_preparacion,
          validator: (value) {
            if (value == null) return 'Ingresa profun_preparacion' ;
          },
          decoration: const InputDecoration(
            hintText: 'profun_preparacion', labelText: 'profun_preparacion',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: recom_preparacion,
          validator: (value) {
            if (value == null) return 'Ingresa recom_preparacion' ;
          },
          decoration: const InputDecoration(
            hintText: 'recom_preparacion', labelText: 'recom_preparacion',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: plantacion,
          validator: (value) {
            if (value == null) return 'Ingresa plantacion' ;
          },
          decoration: const InputDecoration(
            hintText: 'plantacion', labelText: 'plantacion',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: distancia,
          validator: (value) {
            if (value == null) return 'Ingresa distancia' ;
          },
          decoration: const InputDecoration(
            hintText: 'distancia', labelText: 'distancia',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: surcos,
          validator: (value) {
            if (value == null) return 'Ingresa surcos' ;
          },
          decoration: const InputDecoration(
            hintText: 'surcos', labelText: 'surcos',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: plantas,
          validator: (value) {
            if (value == null) return 'Ingresa plantas' ;
          },
          decoration: const InputDecoration(
            hintText: 'plantas', labelText: 'plantas',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: hileras,
          validator: (value) {
            if (value == null) return 'Ingresa hileras' ;
          },
          decoration: const InputDecoration(
            hintText: 'hileras', labelText: 'hileras',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: buena_asosacion,
          validator: (value) {
            if (value == null) return 'Ingresa buena_asosacion' ;
          },
          decoration: const InputDecoration(
            hintText: 'buena_asosacion', labelText: 'buena_asosacion',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: mala_asocsacion,
          validator: (value) {
            if (value == null) return 'Ingresa mala_asocsacion' ;
          },
          decoration: const InputDecoration(
            hintText: 'mala_asocsacion', labelText: 'mala_asocsacion',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: riesgo,
          validator: (value) {
            if (value == null) return 'Ingresa riesgo' ;
          },
          decoration: const InputDecoration(
            hintText: 'riesgo', labelText: 'riesgo',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: abon_y_fertilizant,
          validator: (value) {
            if (value == null) return 'Ingresa abon_y_fertilizant' ;
          },
          decoration: const InputDecoration(
            hintText: 'abon_y_fertilizant', labelText: 'abon_y_fertilizant',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: mineral_quimico,
          validator: (value) {
            if (value == null) return 'Ingresa mineral_quimico' ;
          },
          decoration: const InputDecoration(
            hintText: 'mineral_quimico', labelText: 'mineral_quimico',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: contr_malas_hierbas,
          validator: (value) {
            if (value == null) return 'Ingresa contr_malas_hierbas' ;
          },
          decoration: const InputDecoration(
            hintText: 'contr_malas_hierbas', labelText: 'contr_malas_hierbas',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: plagas_enfermedades,
          validator: (value) {
            if (value == null) return 'Ingresa plagas_enfermedades' ;
          },
          decoration: const InputDecoration(
            hintText: 'plagas_enfermedades', labelText: 'plagas_enfermedades',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: recol_almacen_dias,
          validator: (value) {
            if (value == null) return 'Ingresa recol_almacen_dias' ;
          },
          decoration: const InputDecoration(
            hintText: 'recol_almacen_dias', labelText: 'recol_almacen_dias',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: recol_almacen_temp,
          validator: (value) {
            if (value == null) return 'Ingresa recol_almacen_temp' ;
          },
          decoration: const InputDecoration(
            hintText: 'recol_almacen_temp', labelText: 'recol_almacen_temp',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: produc_promedia,
          validator: (value) {
            if (value == null) return 'Ingresa produc_promedia' ;
          },
          decoration: const InputDecoration(
            hintText: 'produc_promedia', labelText: 'produc_promedia',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: valor_nutricional,
          validator: (value) {
            if (value == null) return 'Ingresa valor_nutricional' ;
          },
          decoration: const InputDecoration(
            hintText: 'valor_nutricional', labelText: 'valor_nutricional',
          ),
        ),
      ),
      ListTile(
        title: TextFormField(
          controller: uso_y_aplicacion,
          validator: (value) {
            if (value == null) return 'Ingresa uso_y_aplicacion' ;
          },
          decoration: const InputDecoration(
            hintText: 'uso_y_aplicacion', labelText: 'uso_y_aplicacion',
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
