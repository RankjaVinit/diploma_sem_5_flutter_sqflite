class Student {
   int? id;
   String name;
   String enrollmentNumber;
   int semester;
   String branch;
   String mobileNumber;
   String password;

   Student({
     this.id,
     required this.name,
     required this.enrollmentNumber,
     required this.semester,
     required this.branch,
     required this.mobileNumber,
     required this.password
   });

   static Map<String, dynamic> toMap(Student student){
     return {
       "ID" : student.id,
       "NAME": student.name,
       "ENROLLMENT_NUMBER": student.enrollmentNumber,
       "SEMESTER": student.semester,
       "BRANCH": student.branch,
       "MOBILE_NUMBER": student.mobileNumber,
       "PASSWORD": student.password
     };
   }

   factory Student.fromMap(Map map){
     return Student(
         id: map["ID"],
         name: map["NAME"],
         enrollmentNumber: map["ENROLLMENT_NUMBER"],
         semester: map["SEMESTER"],
         branch: map["BRANCH"],
         mobileNumber: map["MOBILE_NUMBER"],
         password: map["PASSWORD"]
     );
   }

}