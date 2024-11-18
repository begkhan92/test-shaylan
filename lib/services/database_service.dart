import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Future<Database> setupDatabase() async {
  return openDatabase(
    path.join(await getDatabasesPath(), 'products_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, price REAL, stock INTEGER, barcode TEXT, is_sale INTEGER, created_date TEXT)');
    },
    version: 1,
  );
}
