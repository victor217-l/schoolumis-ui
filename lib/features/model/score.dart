import 'dart:convert';

class Score{
  final String id;
  final String coursename;
  final String studentlastname;
  final String score;

  Score({
    required this.id,
    required this.coursename,
    required this.studentlastname,
    required this.score,
  });

  Map<String,dynamic> toMap() {
    return {
      "id": id,
      "coursename": coursename,
      "studentlastname": studentlastname,
      "score": score,
    };
  }

  factory Score.fromMap(Map<String,dynamic> map) {
    return Score(id: map['_id'] ??'',
        coursename: map['coursename'] ?? '',
        studentlastname: map['studentlastname'] ?? '',
        score: map['score'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Score.fromJson(String source) => Score.fromMap(json.decode(source));

}