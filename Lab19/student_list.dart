import 'package:flutter/material.dart';

import '../Lab17/student_db_helper.dart';
import '../Lab18/student_form.dart';
import '../Lab18/student_model.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  
  List<Student> students = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getStudents();
  }

  Future<void> getStudents() async {
    StudentHelper studentHelper = StudentHelper();
    List<Student> result = await studentHelper.getAll();
    print(result);
    setState(() {
      students = result;
      isLoading = false;
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      
      body: isLoading ?
          Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          Student student = students[index];
          return Card(
            child: ListTile(
              title: Text(student.name),
              subtitle: Text(student.enrollmentNumber),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => StudentForm()
              )
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
