import 'package:riverpod_with_database/db_provider.dart';
import 'package:riverpod_with_database/student.dart';
import 'package:sqflite/sqflite.dart';

class StudentDBProvider {
  static const String tablename = 'student';
  static const String keyrollno = 'rollNo';
  static const String keyname = 'name';
  static const String keyfee = 'fee';
  static const String createTable =
      'CREATE TABLE $tablename($keyrollno INTEGER AUTO INCREMENT,$keyname TEXT,$keyfee REAL)';
  static const String DropTable = 'DROP TABLE IF EXIST$tablename';

  Future<bool> insert(Student student) async {
    Database db = await DBProvider.database;
    int rowId = await db.insert(
      tablename,
      student.toMap(),
    );
    return rowId > 0;
  }

  Future<List<Student>> fetch() async {
    Database db = await DBProvider.database;
    var students = await db.query(tablename);
    return students.map((map) => Student.fromMap(map)).toList();
  }

  Future<bool> delete(int rollno) async {
    Database db = await DBProvider.database;
    int rowId =
        await db.delete(tablename, where: " $keyrollno=?", whereArgs: [rollno]);
    return rowId > 0;
  }

  Future<void> Update(Student student) async {
    Database db = await DBProvider.database;
    int rowId = await db.update(tablename, student.toMap(),
        where: '$keyrollno=?', whereArgs: [student.rollNo]);
    // return rowId > 0;
  }
}
