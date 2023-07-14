class Mealsof{
  String name;


  Mealsof({ required this.name, });

  static List<Mealsof> getMeals(){
    return <Mealsof>[
      Mealsof(name: "Launch and Supper", ),
      Mealsof(name: "Breakfast and Launch", ),
      Mealsof(name: "Breakfast and Supper"),
    ];
  }
}