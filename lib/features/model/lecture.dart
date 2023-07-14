import 'dart:convert';

class LectureCourse {
  final String id;
  final String nameofcourse;
  final String shortname;
  final String year;
  final String lecturername;

  LectureCourse({
    required this.id,
    required this.nameofcourse,
    required this.shortname,
    required this.year,
    required this.lecturername,
});

  Map<String,dynamic> toMap() {
    return {
      "id": id,
      "nameofcourse": nameofcourse,
      "shortname": shortname,
      "year":  year,
      "lecturername": lecturername,
    };
  }

  factory LectureCourse.fromMap(Map<String,dynamic> map) {
    return LectureCourse(id: map['_id'] ?? '',
        nameofcourse: map['nameofcourse'] ?? '',
        shortname: map['shortname'] ?? '',
        year: map['year'] ?? '', lecturername: map['lecturername'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory LectureCourse.fromJson(String source) => LectureCourse.fromMap(json.decode(source));

}