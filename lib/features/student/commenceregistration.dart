import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schoolumis/common/globalvariables.dart';
import 'package:schoolumis/constraint/error_handler.dart';
import 'package:schoolumis/constraint/utill.dart';
import 'package:schoolumis/features/model/Listofmeal.dart';
import 'package:schoolumis/features/student/hallresidence.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../common/navigation.dart';
import '../../common/user.dart';
import 'modelsforstudent/listmeals.dart';

class CommenceRegistration extends StatefulWidget {
  const CommenceRegistration({Key? key}) : super(key: key);

  @override
  State<CommenceRegistration> createState() => _CommenceRegistrationState();
}

class _CommenceRegistrationState extends State<CommenceRegistration> {


  // Future<List<ListofMeals>> _fetchmeals() async  {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var tokenforstudent = await prefs.getString("studenttoken");
  //
  //   http.Response res = await http.get(Uri.parse(""),
  //     headers: <String,String>{
  //      "Content-type":"application/json; charset=UTF-8",
  //       "Authorization": "Bearer $tokenforstudent"
  //     }
  //   );
  //
  //   if(res.statusCode == 200){
  //     var jsonDate = jsonDecode(res.body);
  //     var jsonlist = (jsonDate['list'] as List).map((mealslist) => ListofMeals.fromJson(jsonEncode(mealslist)))
  //         .toList();
  //     return jsonlist;
  //   }else{
  //     throw Exception("No data");
  //   }
  // }

  Future<void> seletMeals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenforstudent = await prefs.getString("studenttoken");

    http.Response res = await http.post(Uri.parse("/formeals"),
      body: jsonEncode({

      })
    );

  }

  List<ListofMeals> listmeal = [];

  // void getmealsFrom() {
  //   _fetchmeals().then((fetchme) => {
  //     setState(() {
  //       listmeal = fetchme;
  //     })
  //   }).catchError((error) {
  //     print('Error fetching users : $error');
  //   });
  // }
  //

  late List<Mealsof> mealss;
  // bool sort;
  late List<Mealsof> selectedmeals;
  
  Future<void> sendSelectedMeal(String selectectermeal) async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var studenttokem = await prefs.getString("studenttoken");

    SharedPreferences prefss = await SharedPreferences.getInstance();
    var studentmatri = await prefs.getString("studentmatric_no");


    
    http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/student/formeal"),
      body: jsonEncode({
        "matric_no": studentmatri,
        "typeofmeal": selectectermeal,
      }),
      headers: <String,String>{
    "Content-type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $studenttokem",

      }
    );

    print(res.body);

    httpErrorHandler(response: res, context: context, onSuccess: () {
       showsnackbar(context, jsonDecode(res.body)['msg']);
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HallofStudent()), (route) => false);
    });
  }



  @override
  void initState() {
    mealss = Mealsof.getMeals();
    // TODO: implement initState
    selectedmeals = [];
    super.initState();
  }

  onSelectedRow(bool selected, Mealsof meals) async {
    setState(() {
      if(selected){
        setState(() {
          selectedmeals.add(meals);
          sendSelectedMeal(meals.name);
        });

      }else{
        setState(() {
          selectedmeals.remove(meals);
        });

      }
    });
  }

  DataTable datebody() {
    return DataTable(columns: [
      DataColumn(label: Text('Meal'),
        numeric: false,
        tooltip: "Meal",
        onSort: (columnIndex, ascending){

        }
      ),
    ],
    rows:
        mealss.map((meal) =>
            DataRow(
                selected: selectedmeals.contains(meal),
                onSelectChanged: (b){
                  print("Onselect");
                  onSelectedRow(b!, meal);
                },
                cells: [

                  DataCell(Text(meal.name), onTap: (){
                    print('Selected ${meal.name}');

                  }),
                //  DataCell(Text(meal.name))

                ])

        ).toList()
    );
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: AppBar(
            backgroundColor: Colors.white,
            shadowColor: null,
            elevation: 0,
            leading:
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child:
                Image.asset('image/forstart.png',
                  height: 20, width: 20, fit: BoxFit.cover,
                ),
              ),
            ),
            actions: [
              Builder(builder: (BuildContext context){
                return   IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },

                  icon: Icon(Icons.menu), color: Colors.black,
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip ,
                );
              })

            ],
          ),
        ),),
      drawer: Navigationdrawer(),
      body:SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(height: 10,),
            Column(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.02  ,),
                      TopBar(text: "PDF",),
                      SizedBox(width: size.width * 0.08 ,),
                      TopBar(text: "Export"),
                      SizedBox(width: size.width * 0.08,),
                      TopBar(text: "Refresh")

                    ],
                  ),
                ),
                SizedBox(height: 2,),
                Padding(padding: EdgeInsets.all(13),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Globalvariables.primarycolor
                        ),
                        child: Center(
                          child: Text(
                            "List of Meals",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ) ,
                        ),
                      ),
                      Center(
                        child: datebody(),
                      ),
                      SizedBox(height: 12,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  HallofStudent() ));
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Globalvariables.colorforstablel,
                            borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          child: Center(
                            child: Text("Next Page",style: TextStyle(),),
                          ),
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
            SizedBox(height: size.height * 0.90,),
            Positioned(
              left: 0,
                bottom: 7,
                child: Image.asset('image/bmeal.png', height: 170, width: 100,)),

            Positioned(
              right: 0,
              bottom: 20,
                child: Image.asset("image/forstumeal.png", height: 50, width: 50,))

          ],
        ),

    )
    );


  }
  TableRow buildRow(List<String> cells) => TableRow(
    children: [

    ]
  );
}

class TopBar extends StatelessWidget {
  final String text;
  const TopBar({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 86,
      decoration: BoxDecoration(
        color: Globalvariables.seccondarycolor,
        borderRadius: BorderRadius.all(Radius.circular(10))
        
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("image/apll.png", height: 20, width: 10,
            fit: BoxFit.contain,),
            Text(text, style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }
}
