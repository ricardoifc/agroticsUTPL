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
      String? id_siembra,
     // String? fecha_muestreo,
      String? altura,
      String? diametro,
      String? nro_racimos,
      String? nro_flores_racimos,
      String? nro_flores_totales,
      String? nro_frutos_racimos,
      String? nro_frutos_totales,
      String? longitud_fruto,
      String? diametro_fruto,
      String? peso_fruto,
      String? produccion_planta,
      String? ph_suelo,
      String? mo,
      String? nitrogeno,
      String? fosforo,
      String? potasio,
      String? otros_elementos,
      String? temperatura,
      String? humedad_relativa,
      String? riego_lluvia,
      String? fertiliza_abono,
      String? cantidad_fertiliza,
      String? fechas_aplic_fertiliza,
      String? control_plag_enferm,
      String? cantidad_control_plag,
      String? fecha_aplicacion,
      String? observaciones,
      String? fecha_registro,
      String? usuario_registro,
      ) async {
    final db = await DatabaseHelper.db();

    final data = {'id_siembra': id_siembra,
                  'altura': altura,
                  'diametro': diametro,
                  'nro_racimos': nro_racimos,
                  'nro_flores_racimos': nro_flores_racimos,
                  'nro_flores_totales': nro_flores_totales,
                  'nro_frutos_racimos': nro_frutos_racimos,
                  'nro_frutos_totales': nro_frutos_totales,
                  'longitud_fruto': longitud_fruto,
                  'diametro_fruto': diametro_fruto,
                  'peso_fruto': peso_fruto,
                  'produccion_planta': produccion_planta,
                  'ph_suelo': ph_suelo,
                  'mo': mo,
                  'nitrogeno': nitrogeno,
                  'fosforo': fosforo,
                  'potasio': potasio,
                  'otros_elementos': otros_elementos,
                  'temperatura': temperatura,
                  'humedad_relativa': humedad_relativa,
                  'riego_lluvia': riego_lluvia,
                  'fertiliza_abono': fertiliza_abono,
                  'cantidad_fertiliza': cantidad_fertiliza,
                  'fechas_aplic_fertiliza': fechas_aplic_fertiliza,
                  'control_plag_enferm': control_plag_enferm,
                  'cantidad_control_plag': cantidad_control_plag,
                  'fecha_aplicacion': fecha_aplicacion,
                  'observaciones': observaciones,
                  'fecha_registro': fecha_registro,
                  'usuario_registro': usuario_registro};

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
      String id_siembra,
      //String fecha_muestreo,
      String altura,
      String diametro,
      String nro_racimos,
      String nro_flores_racimos,
      String nro_flores_totales,
      String nro_frutos_racimos,
      String nro_frutos_totales,
      String longitud_fruto,
      String diametro_fruto,
      String peso_fruto,
      String produccion_planta,
      String ph_suelo,
      String mo,
      String nitrogeno,
      String fosforo,
      String potasio,
      String otros_elementos,
      String temperatura,
      String humedad_relativa,
      String riego_lluvia,
      String fertiliza_abono,
      String cantidad_fertiliza,
      String fechas_aplic_fertiliza,
      String control_plag_enferm,
      String cantidad_control_plag,
      String fecha_aplicacion,
      String observaciones,
      String fecha_registro,
      String usuario_registro
      ) async {
    final db = await DatabaseHelper.db();

    final data = {
      'id_siembra': id_siembra,

      'altura': altura,
      'diametro': diametro,
      'nro_racimos': nro_racimos,
      'nro_flores_racimos': nro_flores_racimos,
      'nro_flores_totales': nro_flores_totales,
      'nro_frutos_racimos': nro_frutos_racimos,
      'nro_frutos_totales': nro_frutos_totales,
      'longitud_fruto': longitud_fruto,
      'diametro_fruto': diametro_fruto,
      'peso_fruto': peso_fruto,
      'produccion_planta': produccion_planta,
      'ph_suelo': ph_suelo,
      'mo': mo,
      'nitrogeno': nitrogeno,
      'fosforo': fosforo,
      'potasio': potasio,
      'otros_elementos': otros_elementos,
      'temperatura': temperatura,
      'humedad_relativa': humedad_relativa,
      'riego_lluvia': riego_lluvia,
      'fertiliza_abono': fertiliza_abono,
      'cantidad_fertiliza': cantidad_fertiliza,
      'fechas_aplic_fertiliza': fechas_aplic_fertiliza,
      'control_plag_enferm': control_plag_enferm,
      'cantidad_control_plag': cantidad_control_plag,
      'fecha_aplicacion': fecha_aplicacion,
      'observaciones': observaciones,
      'fecha_registro': fecha_registro,
      'usuario_registro': usuario_registro,

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
