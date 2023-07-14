import 'dart:convert';

class Showingchurch{
  final String id;
  final String name;
  final String email;
  final String worshipcentrename;

  Showingchurch({
    required this.id,
    required  this.name,
    required this.email,
    required this.worshipcentrename,
});

  Map<String,dynamic>toMap() {
    return {
      "id":id,
      "name": name,
      "email":email,
      "worshipcentersname":worshipcentrename,
    };
  }

  factory Showingchurch.fromMap(Map<String,dynamic> map) {
    return Showingchurch(id: map['_id'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        worshipcentrename: map['worshipcentersname'] ?? '');
  }

  String toJson()  => json.encode(toMap());

  factory Showingchurch.fromJson(String source) => Showingchurch.fromMap(jsonDecode(source));
}