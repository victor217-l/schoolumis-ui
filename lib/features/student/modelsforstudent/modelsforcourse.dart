// class Student{
//   final String id;
//   final String firstname;
//
// }



import 'dart:convert';

class Course {
  final String id;
  final String nameofcourse;
  final String shortname;
  final String year;
  final String lecturername;



  Course({
    required this.nameofcourse,
    required this.id,
    required this.shortname,
    required this.year,
    required this.lecturername,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nameofcourse": nameofcourse,
      "shortname": shortname,
      "year":year,
      "lecturername": lecturername,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['_id'] ?? '',
       nameofcourse: map['nameofcourse'] ?? '',
       shortname: map['shortname'] ?? '',
        year:  map['year'] ?? '',
        lecturername: map['lecturername'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source));
}
