


import 'dart:convert';

class Studentincoursewithscore {
  final String id;
  final String studentlastname;
  final String coursname;
  final int score;


  Studentincoursewithscore({ required this.coursname,
    required this.id,
    required this.studentlastname,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "studentlastname": studentlastname,
      "coursename": coursname,
      "score":score,


    };
  }

  factory Studentincoursewithscore.fromMap(Map<String, dynamic> map) {
    return Studentincoursewithscore(id: map['_id'] ?? '',
        studentlastname: map['studentlastname'] ?? '',
        coursname: map['coursename'] ?? '', score: map['score'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Studentincoursewithscore.fromJson(String source) =>
      Studentincoursewithscore.fromMap(json.decode(source));
}
