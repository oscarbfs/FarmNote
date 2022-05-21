import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'cattle.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE cattle (id TEXT PRIMARY KEY, name TEXT, image TEXT, description TEXT, growthRate REAL, weightArroba REAL, weightKg REAL)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> update(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    await db.update(
      table,
      data,
      where: "id = ?",
      whereArgs: [data["id"]],
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> delete(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    await db.delete(
      table,
      where: "id = ?",
      whereArgs: [data["id"]],
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbUtil.database();
    return db.query(table);
  }
}
