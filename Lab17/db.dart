import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
    Future<Database> initDB() async {
      String dbPath = join( await getDatabasesPath(), 'database.db');
      Database db = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, version) {
          db.execute(''' 
            CREATE TABLE STUDENT (
              ID INTEGER PRIMARY KEY,
              NAME TEXT,
              AGE INTEGER
            )  
          ''');
        }
      );
      return db;
    }

    Future<List<Map>> getAll() async {
      Database db = await initDB();
      return db.query('STUDENT');
    }

}










// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class MyDatabase {
//     Future<Database> initDB() async {
//       String dbPath = await getDatabasesPath();
//       String path = join(dbPath, 'my_database.db');
//       Database db = await openDatabase(
//         path,
//         version: 1,
//         onCreate: (db, version) {
//           db.execute('''
//             CREATE TABLE STUDENT (
//               ID INTEGER PRIMARY KEY,
//               NAME TEXT,
//               AGE INTEGER
//             )
//           ''');
//         },
//       );
//       return db;
//     }
//
//     Future<List<Map>> getAll() async {
//         Database db = await initDB();
//         List<Map> data = await db.query('STUDENT');
//         return data;
//     }
// }


//
//
// class ListDemo extends StatelessWidget {
//   ListDemo({super.key});
//
//   List<Student> students = [
//     Student(id: 1, name: 'Abc', age: 18),
//     Student(id: 2, name: 'Abc2e2', age: 18),
//     Student(id: 3, name: 'Abcsdge', age: 18),
//     Student(id: 4, name: 'Abcsdf', age: 18),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Demo'),
//       ),
//       body: ListView.builder(
//         itemCount: students.length,
//         itemBuilder: (context, index) {
//           Student student = students[index];
//           return ListTile(
//             title: Text(student.name!),
//             subtitle: Text(student.age.toString()),
//           );
//         },
//       ),
//     );
//   }
// }


