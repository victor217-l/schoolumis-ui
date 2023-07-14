


import 'dart:convert';

class Hallfors {
  final String id;
  final String firstname;
  final String hallofresidence;


  Hallfors({
    required this.id,
    required this.firstname,
    required this.hallofresidence,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "firstname": firstname,
      "hallofresidence": hallofresidence,


    };
  }

  factory Hallfors.fromMap(Map<String, dynamic> map) {
    return Hallfors(id: map['_id'] ?? '',
        firstname: map['firstname'] ?? '',
        hallofresidence: map['hallofresidence'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Hallfors.fromJson(String source) =>
      Hallfors.fromMap(json.decode(source));
}





class Hall{
  String hallname;
  String halladmin;

  Hall({ required this.hallname, required this.halladmin});

  static List<Hall> getHall(){
    return <Hall>[
      Hall(hallname: "Aarya", halladmin: "Sahh"),
      Hall(hallname: "Ben", halladmin: "John")
    ];
  }
}
