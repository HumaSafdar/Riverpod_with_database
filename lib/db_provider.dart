import 'package:path/path.dart';
import 'package:riverpod_with_database/student_db_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static Future<Database> get database async {
    String pathdirectory = await getDatabasesPath();
    String path = join(pathdirectory, 'student.db');
    return _database ??= await openDatabase(
      path,
      //'path:${pathdirectory.toString()}',
      version: 2,
      onCreate: (db, version) {
        db.execute(StudentDBProvider.createTable);
      },
    );
  }
}
