import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Lab17/student_model.dart';

class StudentHelper {

  StudentHelper._internal();
  static StudentHelper _instance = StudentHelper._internal();

  factory StudentHelper() {
    return _instance;
  }

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'database.db');

    Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version){
          db.execute('''
              CREATE TABLE STUDENT(
                ID INTEGER PRIMARY KEY AUTOINCREMENT,
                NAME TEXT,
                ENROLLMENT_NUMBER TEXT,
                SEMESTER INTEGER,
                BRANCH TEXT,
                MOBILE_NUMBER TEXT,
                PASSWORD TEXT
              )
            ''');
        }
    );
    return db;
  }


  Future<int> insert(Student student) async {
    Database database = await db;
    return await database.insert('STUDENT', Student.toMap(student));
  }


  Future<bool> login(String name, String password) async {
    Database database = await db;
    List<Map> student = await database.query(
        'STUDENT',
        where: 'NAME = ?',
        whereArgs: [name]
    );
    if (student.isNotEmpty){
      if (student[0]["PASSWORD"] == password) return true;
    }
    return false;
  }

  Future<List<Student>> getAll() async {
    Database database = await db;
    List<Map> students = await database.query('STUDENT');

    return students.map((student) {
      return Student.fromMap(student);
    }).toList();
  }

  Future<int> updateStudentDetail(Student student) async{
    Database database = await db;
    return await database.update("STUDENT",
      Student.toMap(student),
      where: "id = ?",
      whereArgs: [student.id],
    );
  }

  Future<int> deleteStudent(int id) async{
    Database database = await db;
    return await database.delete(
      "STUDENT",
      where: "id = ?",
      whereArgs: [id],
    );
  }

}