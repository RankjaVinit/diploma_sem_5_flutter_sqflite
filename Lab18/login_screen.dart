import 'package:diploma_sem_5_flutter_labs/Lab18/student_db_helper.dart';
import 'package:flutter/material.dart';

import '../Lab18/student_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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

                ElevatedButton(onPressed: () async {
                  if ( _formKey.currentState!.validate() ) {
                    StudentHelper studentHelper = StudentHelper();

                    bool isLoggedIn = await studentHelper.login(
                      nameController.text,
                      passwordController.text
                    );

                    if(isLoggedIn){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login successful'))
                      );
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













//import 'package:flutter/material.dart';
//
// class StudentForm extends StatefulWidget {
//   const StudentForm({super.key});
//
//   @override
//   State<StudentForm> createState() => _StudentFormState();
// }
//
// class _StudentFormState extends State<StudentForm> {
//
//   final _formKey = GlobalKey<FormState>();
//
//   final nameController = TextEditingController();
//   final enrollController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Student'),
//       ),
//
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           children: [
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   hintText: "Enter your name",
//                 ),
//                 validator: (value){
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                 },
//               ),
//
//
//               TextFormField(
//               controller: enrollController,
//               decoration: InputDecoration(
//                 labelText: 'EnrollmentNumber',
//                 hintText: "Enter your EnrollmentNumber",
//               ),
//               validator: (value){
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your enrollment number';
//                 }
//               },
//             ),
//
//
//             ElevatedButton(onPressed: (){
//               if (_formKey.currentState!.validate()){z
//
//               }
//             }, child: Text('Submit'))
//           ],
//         ),
//       ),
//     );
//   }
// }
