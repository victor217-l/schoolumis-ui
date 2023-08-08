


import 'dart:convert';

class Halls {
  final String id;
  final String hallname;
  final String halladmin;



  Halls({
    required this.id,
    required this.hallname,
    required this.halladmin,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "hallname": hallname,
      "halladmin": halladmin,

    };
  }

  factory Halls.fromMap(Map<String, dynamic> map) {
    return Halls(
      id: map['_id'] ?? '',
      hallname: map['hallname'] ?? '',
      halladmin: map['halladmin'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Halls.fromJson(String source) =>
      Halls.fromMap(json.decode(source));
}
