import 'package:diploma_sem_5_flutter_labs/Lab17/student_model.dart';
import 'package:flutter/material.dart';


class ListDemo1 extends StatelessWidget {
  ListDemo1({super.key});

  List<Student> students=[
    Student( name: "abc", age: 20, id: 1),
    Student( name: "abc", age: 20, id: 2),
    Student( name: "abc", age: 20, id: 3),
    Student( name: "abc", age: 20, id: 4),
    Student( name: "abc", age: 20, id: 5),
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
            subtitle: Text(s1.age.toString()),
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