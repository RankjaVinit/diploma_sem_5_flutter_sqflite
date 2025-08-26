import 'package:sqflite_demo/diploma_sem_5_flutter_sqflite/Lab17/student_db_helper.dart';
import 'package:flutter/material.dart';

import '../Lab17/student_model.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final enrollmentNumberController = TextEditingController();
  final semesterController = TextEditingController();
  final branchController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Form'),
      ),

      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Name
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return 'Please enter your name';
                    }
                  },
                ),
                SizedBox(height: 15,),

                // Enrollment Number
                TextFormField(
                  controller: enrollmentNumberController,
                  decoration: InputDecoration(
                      labelText: 'Enrollment Number',
                      hintText: 'Enter your enrollment number'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return 'Please enter your enrollment number';
                    }
                  },
                ),
                SizedBox(height: 15,),

                // Semester
                TextFormField(
                  controller: semesterController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Semester',
                      hintText: 'Enter your semester'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return 'Please enter your semester';
                    }
                    int sem = int.parse(value);
                    if (sem < 1 || sem > 8) {
                      return 'Please enter a valid semester';
                    }
                  },
                ),
                SizedBox(height: 15,),

                //Branch
                TextFormField(
                  controller: branchController,
                  decoration: InputDecoration(
                      labelText: 'Branch',
                      hintText: 'Enter your branch'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return 'Please enter your branch';
                    }
                  },
                ),
                SizedBox(height: 15,),

                //Mobile Number
                TextFormField(
                  controller: mobileNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: 'Enter your mobile number'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return 'Please enter your mobile number';
                    }

                    if (value.length != 10){
                      return 'Please enter a valid mobile number';
                    }
                  },
                ),
                SizedBox(height: 15,),

                // Password
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6){
                      return 'Password should be at least 6 characters';
                    }
                  },
                ),
                SizedBox(height: 15,),

                // Conform Password
                TextFormField(
                  controller: conformPasswordController,
                  decoration: InputDecoration(
                      labelText: 'Conform Password',
                      hintText: 'Enter your password'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return 'Please enter password again';
                    }
                    if (value != passwordController.text){
                      return 'Password does not match';
                    }
                  },
                ),
                SizedBox(height: 30,),


                ElevatedButton(onPressed: () async {
                  if ( _formKey.currentState!.validate() ) {
                      StudentHelper studentHelper = StudentHelper();
                      Student student = Student(
                        name: nameController.text,
                        enrollmentNumber: enrollmentNumberController.text,
                        semester: int.parse(semesterController.text),
                        branch: branchController.text,
                        mobileNumber: mobileNumberController.text,
                        password: passwordController.text,
                      );
                      int isInserted = await studentHelper.insert(student);
                      if(isInserted == 1){
                          _formKey.currentState!.reset();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Student added successfully'))
                          );
                          Navigator.of(context).pop();
                      }
                  }
                }, child: Text('Submit')),
              ],
            )
        ),
      ),
    );
  }
}
