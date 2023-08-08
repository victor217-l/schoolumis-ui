// class Student{
//   final String id;
//   final String firstname;
//
// }



import 'dart:convert';

class Student {
  final String id;
  final String firstname;
  final String lastname;
  final String matric_no;
  final String email;
  final String address;
  final String password;
  final String departmant;


  Student({
      required this.matric_no,
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.address,
    required this.password,
    required this.departmant,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "firstname": firstname,
      "lastname": lastname,
      "matric_no":matric_no,
      "email": email,
      "address":address,
      "password":password,
      "department": departmant,


    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
        id: map['_id'] ?? '',
        firstname: map['firstname'] ?? '',
        lastname: map['lastname'] ?? '',
      matric_no:  map['matric_no'] ?? '',
        email: map['email'] ?? '',
       address: map['map'] ?? '',
      password: map['password'] ?? '',
      departmant: map['department'] ??  '',
     );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));
}
