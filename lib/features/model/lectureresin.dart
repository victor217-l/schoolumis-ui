


import 'dart:convert';

class Lecturer {
  final String id;
  final String firstname;
  final String email;
  final String password;
  final String departmant;


  Lecturer({
    required this.id,
    required this.firstname,
    required this.email,
    required this.password,
    required this.departmant,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "firstname": firstname,
      "email": email,
      "password":password,
      "department": departmant,


    };
  }

  factory Lecturer.fromMap(Map<String, dynamic> map) {
    return Lecturer(
      id: map['_id'] ?? '',
      firstname: map['firstname'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      departmant: map['department'] ??  '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Lecturer.fromJson(String source) =>
      Lecturer.fromMap(json.decode(source));
}
