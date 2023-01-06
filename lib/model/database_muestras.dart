import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        id_siembra TEXT,
        altura TEXT,
        diametro TEXT,
        nro_racimos TEXT,
        nro_flores_racimos TEXT,
        nro_flores_totales TEXT,
        nro_frutos_racimos TEXT,
        nro_frutos_totales TEXT,
        longitud_fruto TEXT,
        diametro_fruto TEXT,
        peso_fruto TEXT,
        produccion_planta TEXT,
        ph_suelo TEXT,
        mo TEXT,
        nitrogeno TEXT,
        fosforo TEXT,
        potasio TEXT,
        otros_elementos TEXT,
        temperatura TEXT,
        humedad_relativa TEXT,
        riego_lluvia TEXT,
        fertiliza_abono TEXT,
        cantidad_fertiliza TEXT,
        fechas_aplic_fertiliza TEXT,
        control_plag_enferm TEXT,
        cantidad_control_plag TEXT,
        fecha_aplicacion TEXT,
        observaciones TEXT,
        fecha_registro TEXT,
        usuario_registro TEXT
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'muestras.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item
  static Future<int> createItem(
      String? idSiembra,
     // String? fecha_muestreo,
      String? altura,
      String? diametro,
      String? nroRacimos,
      String? nroFloresRacimos,
      String? nroFloresTotales,
      String? nroFrutosRacimos,
      String? nroFrutosTotales,
      String? longitudFruto,
      String? diametroFruto,
      String? pesoFruto,
      String? produccionPlanta,
      String? phSuelo,
      String? mo,
      String? nitrogeno,
      String? fosforo,
      String? potasio,
      String? otrosElementos,
      String? temperatura,
      String? humedadRelativa,
      String? riegoLluvia,
      String? fertilizaAbono,
      String? cantidadFertiliza,
      String? fechasAplicFertiliza,
      String? controlPlagEnferm,
      String? cantidadControlPlag,
      String? fechaAplicacion,
      String? observaciones,
      String? fechaRegistro,
      String? usuarioRegistro,
      ) async {
    final db = await DatabaseHelper.db();

    final data = {'id_siembra': idSiembra,
                  'altura': altura,
                  'diametro': diametro,
                  'nro_racimos': nroRacimos,
                  'nro_flores_racimos': nroFloresRacimos,
                  'nro_flores_totales': nroFloresTotales,
                  'nro_frutos_racimos': nroFrutosRacimos,
                  'nro_frutos_totales': nroFrutosTotales,
                  'longitud_fruto': longitudFruto,
                  'diametro_fruto': diametroFruto,
                  'peso_fruto': pesoFruto,
                  'produccion_planta': produccionPlanta,
                  'ph_suelo': phSuelo,
                  'mo': mo,
                  'nitrogeno': nitrogeno,
                  'fosforo': fosforo,
                  'potasio': potasio,
                  'otros_elementos': otrosElementos,
                  'temperatura': temperatura,
                  'humedad_relativa': humedadRelativa,
                  'riego_lluvia': riegoLluvia,
                  'fertiliza_abono': fertilizaAbono,
                  'cantidad_fertiliza': cantidadFertiliza,
                  'fechas_aplic_fertiliza': fechasAplicFertiliza,
                  'control_plag_enferm': controlPlagEnferm,
                  'cantidad_control_plag': cantidadControlPlag,
                  'fecha_aplicacion': fechaAplicacion,
                  'observaciones': observaciones,
                  'fecha_registro': fechaRegistro,
                  'usuario_registro': usuarioRegistro,
    };


    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Get a single item by id
  //We dont use this method, it is for you if you want it.
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DatabaseHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id,
      String idSiembra,
      //String fecha_muestreo,
      String altura,
      String diametro,
      String nroRacimos,
      String nroFloresRacimos,
      String nroFloresTotales,
      String nroFrutosRacimos,
      String nroFrutosTotales,
      String longitudFruto,
      String diametroFruto,
      String pesoFruto,
      String produccionPlanta,
      String phSuelo,
      String mo,
      String nitrogeno,
      String fosforo,
      String potasio,
      String otrosElementos,
      String temperatura,
      String humedadRelativa,
      String riegoLluvia,
      String fertilizaAbono,
      String cantidadFertiliza,
      String fechasAplicFertiliza,
      String controlPlagEnferm,
      String cantidadControlPlag,
      String fechaAplicacion,
      String observaciones,
      String fechaRegistro,
      String usuarioRegistro,
      ) async {
    final db = await DatabaseHelper.db();

    final data = {
      'id_siembra': idSiembra,
      'altura': altura,
      'diametro': diametro,
      'nro_racimos': nroRacimos,
      'nro_flores_racimos': nroFloresRacimos,
      'nro_flores_totales': nroFloresTotales,
      'nro_frutos_racimos': nroFrutosRacimos,
      'nro_frutos_totales': nroFrutosTotales,
      'longitud_fruto': longitudFruto,
      'diametro_fruto': diametroFruto,
      'peso_fruto': pesoFruto,
      'produccion_planta': produccionPlanta,
      'ph_suelo': phSuelo,
      'mo': mo,
      'nitrogeno': nitrogeno,
      'fosforo': fosforo,
      'potasio': potasio,
      'otros_elementos': otrosElementos,
      'temperatura': temperatura,
      'humedad_relativa': humedadRelativa,
      'riego_lluvia': riegoLluvia,
      'fertiliza_abono': fertilizaAbono,
      'cantidad_fertiliza': cantidadFertiliza,
      'fechas_aplic_fertiliza': fechasAplicFertiliza,
      'control_plag_enferm': controlPlagEnferm,
      'cantidad_control_plag': cantidadControlPlag,
      'fecha_aplicacion': fechaAplicacion,
      'observaciones': observaciones,
      'fecha_registro': fechaRegistro,
      'usuario_registro': usuarioRegistro,

    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DatabaseHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
