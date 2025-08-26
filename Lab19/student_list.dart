import 'package:flutter/material.dart';
import 'package:sqflite_demo/diploma_sem_5_flutter_sqflite/Lab19/studentDetailScreen.dart';
import '../Lab17/student_db_helper.dart';
import '../Lab17/student_model.dart';
import '../Lab18/student_form.dart';
import '../Lab20/EditScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Student> students = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getStudentData();
  }

  void getStudentData() async {
    setState(() {
      isLoading = true;
    });
    StudentHelper studentHelper = StudentHelper();
    List<Student> result = await studentHelper.getAll();
    setState(() {
      students = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student home screen'),
      ),

      body: isLoading ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          Student student = students[index];
          return Card(
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetailScreen(student: student)));
              },
              title: Text(student.name),
              subtitle: Text(student.enrollmentNumber),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditScreen(
                            student: student,
                            onUpdate: () => getStudentData()
                        ))
                    ).then((_){
                      getStudentData();
                    });
                  }, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () async {

                    bool? shouldDelete = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Delete Student"),
                        content: const Text("Are you sure you want to delete this student?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text("Yes"),
                          ),
                        ],
                      ),
                    );

                    if(shouldDelete != null && shouldDelete){
                      StudentHelper studentHelper = StudentHelper();
                      await studentHelper.deleteStudent(student.id!);
                      getStudentData();
                    }

                  }, icon: Icon(Icons.delete))
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton:  FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentForm())
          ).then((value){
            getStudentData();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}