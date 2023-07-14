import 'dart:convert';

class ListofMeals {
  final String id;
  final String lunchandsupper;
  final String breakfastandlunch;
  final String breakfastandsupper;

  ListofMeals({
    required this.id,
    required this.lunchandsupper,
    required this.breakfastandlunch,
    required this.breakfastandsupper
});

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "lunchandsupper": lunchandsupper,
      "breakfastandlunch":breakfastandlunch,
      "breakfastandsupper":breakfastandsupper,
    };
  }

  factory ListofMeals.fromMap(Map<String,dynamic> map) {
    return ListofMeals(id: map['id'] ?? '' ,
        lunchandsupper: map['lunchandsupper'] ?? '',
        breakfastandlunch: map['breakfastandlunch'] ?? '',
        breakfastandsupper: map['breakfastandsupper'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory ListofMeals.fromJson(String source) => ListofMeals.fromMap(json.decode(source));

}