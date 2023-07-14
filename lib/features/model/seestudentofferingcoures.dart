


import 'dart:convert';

class StudentIofferingYourcourse {
  final String id;
  final String studentname;
  final String coursname;


  StudentIofferingYourcourse({ required this.coursname,
    required this.id,
    required this.studentname,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "studentname": studentname,
      "coursename": coursname,


    };
  }

  factory StudentIofferingYourcourse.fromMap(Map<String, dynamic> map) {
    return StudentIofferingYourcourse(id: map['_id'] ?? '',
        studentname: map['studentname'] ?? '',
        coursname: map['coursename'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory StudentIofferingYourcourse.fromJson(String source) =>
      StudentIofferingYourcourse.fromMap(json.decode(source));
}
