import 'package:flutter/material.dart';
import '../Lab17/student_db_helper.dart';
import '../Lab17/student_model.dart';


class EditScreen extends StatefulWidget {
  final Student student;
  final VoidCallback onUpdate;
  const EditScreen({super.key,required this.student,required this.onUpdate});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  final formKey=GlobalKey<FormState>();
  late  TextEditingController nameController;
  late TextEditingController  enrollmentController;
  late  TextEditingController  semController ;
  late  TextEditingController  branchController;
  late  TextEditingController mobileController ;

  @override
  void initState(){
    super.initState();
    nameController=TextEditingController(text: widget.student.name) ;
    enrollmentController=TextEditingController(text: widget.student.enrollmentNumber) ;
    semController=TextEditingController(text: widget.student.semester.toString()) ;
    branchController=TextEditingController(text: widget.student.branch) ;
    mobileController=TextEditingController(text: widget.student.mobileNumber) ;
  }

  void updateStudent() async{
    if(formKey.currentState!.validate()){
      StudentHelper studentHelper = StudentHelper();
      Student student = Student(
        id: widget.student.id,
        name: nameController.text,
        enrollmentNumber: enrollmentController.text,
        semester: int.parse(semController.text),
        branch: branchController.text,
        mobileNumber: mobileController.text,
        password: widget.student.password,
      );
      studentHelper.updateStudentDetail(student);
      widget.onUpdate();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Student")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
              TextFormField(controller: enrollmentController,keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Enrollment No')),
              TextFormField(controller: semController, keyboardType: TextInputType.number,decoration: const InputDecoration(labelText: 'Semester')),
              TextFormField(controller: branchController, decoration: const InputDecoration(labelText: 'Branch')),
              TextFormField(controller: mobileController, keyboardType: TextInputType.number,decoration: const InputDecoration(labelText: 'Mobile')),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: updateStudent, child: const Text("Update Student"))
            ],
          ),
        ),
      ),
    );
  }
}
