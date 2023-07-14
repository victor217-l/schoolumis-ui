class User{
  String firstname;
  String lastname;

  User({ required this.firstname, required this.lastname});

  static List<User> getUsers(){
    return <User>[
      User(firstname: "Aarya", lastname: "Sahh"),
      User(firstname: "Ben", lastname: "John")
    ];
  }
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