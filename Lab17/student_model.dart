class Student {
  int id;
  String name;
  int age;

  Student({ required this.id, required this.name, required this.age});

  Map toMap(Student student){
      return {
        "ID" : student.id,
        "NAME": student.name,
        "AGE": student.age
      };
  }

  Student fromMap(Map student){
      return Student(
          id: student['ID'],
          name: student['NAME'],
          age: student['AGE']
      );
  }
}

















// class Student {
//   int id;
//   String? name;
//   int? age;
//
//   Student({required this.id, this.name, this.age});
// }