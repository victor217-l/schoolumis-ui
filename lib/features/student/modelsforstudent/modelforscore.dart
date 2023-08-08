class Scorefoes{
  final String id;
  final String name;
  final String coursename;
  final String score;

  Scorefoes({
    required  this.id,
    required this.name,
    required this.coursename,
    required this.score,
});

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "name":name,
      "coursename":coursename,
      "score":score,
    };
  }

  factory Scorefoes.fromMap(Map<String,dynamic> map){
    return Scorefoes(id: map['id'] ?? '',
        name: map['name'] ?? '',
        coursename: map['coursename']?? '', score: map['score'] ?? '');
  }
}