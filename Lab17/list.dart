import 'package:sqflite_demo/diploma_sem_5_flutter_sqflite/Lab17/student_model.dart';
import 'package:flutter/material.dart';


class ListDemo1 extends StatelessWidget {
  ListDemo1({super.key});

  List<Student> students=[
    Student( name: "abc", enrollmentNumber: '1', branch: "CSE", mobileNumber: "1234567890", semester: 5, password: "123456"),
    Student( name: "abc", enrollmentNumber: '1', branch: "CSE", mobileNumber: "1234567890", semester: 5, password: "123456"),
    Student( name: "abc", enrollmentNumber: '1', branch: "CSE", mobileNumber: "1234567890", semester: 5, password: "123456"),
    Student( name: "abc", enrollmentNumber: '1', branch: "CSE", mobileNumber: "1234567890", semester: 5, password: "123456"),
    Student( name: "abc", enrollmentNumber: '1', branch: "CSE", mobileNumber: "1234567890", semester: 5, password: "123456"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Demo'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          Student s1=students[index];
          return ListTile(
            title: Text(s1.name.toString()),
            subtitle: Text(s1.enrollmentNumber),
          );
        },
      ),
    );
  }
}


























void main(){
  runApp(App());
}
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListDemo1(),);
  }
}