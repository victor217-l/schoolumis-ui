import 'dart:convert';

class StudentInyourHall {
  final String id;
  final String studentname;
  final String typeofmeal;
  final String  hallname;
  final String worshipname;


  StudentInyourHall({
    required this.id,
    required this.studentname,
    required this.typeofmeal,
    required this.hallname,
    required this.worshipname,
});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "studentname": studentname,
      "typeofmeal": typeofmeal,
      "hallname": hallname,
      "worshipname": worshipname,
    };
  }

  factory StudentInyourHall.fromMap(Map<String,dynamic> map) {
    return StudentInyourHall(id: map['_id'] ?? '',
        studentname: map['studentname'] ?? '', typeofmeal: map['typeofmeal'] ?? '',
        hallname: map['hallname'] ?? '',
      worshipname: map['worshipname'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentInyourHall.fromJson(String source) => StudentInyourHall.fromMap(json.decode(source));

}