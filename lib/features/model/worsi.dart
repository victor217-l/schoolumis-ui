


import 'dart:convert';

class Worshipcenter {
  final String id;
  final String name;
  final String email;
  final String password;
  final String worshipcentername;


  Worshipcenter({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.worshipcentername,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password":password,
      "worshipcentername": worshipcentername,


    };
  }

  factory Worshipcenter.fromMap(Map<String, dynamic> map) {
    return Worshipcenter(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      worshipcentername: map['worshipcentername'] ??  '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Worshipcenter.fromJson(String source) =>
      Worshipcenter.fromMap(json.decode(source));
}
