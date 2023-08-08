import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolumis/constraint/error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/globalvariables.dart';
import '../../../common/navigation.dart';
import '../../../common/user.dart';
import '../../model/score.dart';
import 'package:http/http.dart' as http;
import '../commenceregistration.dart';
import '../hallresidence.dart';

class Semester extends StatefulWidget {
  const Semester({Key? key}) : super(key: key);

  @override
  State<Semester> createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {

  //late List<Score> users;
  late List<Score> selectedUsers;

  Future<List<Score>> _fetchscore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenforstudent = await prefs.getString("studenttoken");



    SharedPreferences prefss = await SharedPreferences.getInstance();
    var studentlastname = await prefss.getString("studentlastname");





    http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/student/allstudentscore"),
      body: jsonEncode({
       'studentname': studentlastname,
      }),
      headers: <String,String>{
        "Content-type":"application/json; charset=UTF-8",
        "Authorization": "Bearer $tokenforstudent"
      }
    );

    print(studentlastname);
    print(res.body);

   if(res.statusCode == 200){
     var jsonData = jsonDecode(res.body);
     var scorellist = (jsonData['list'] as List).map((scorelist) => Score.fromJson(jsonEncode(scorelist)))
         .toList();
     return  scorellist;
   }else{
     throw Exception("No data");
   }



  }

  List<Score>? _allscores;

  void fetch() async {
    _allscores = await _fetchscore();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    //users = User.getUsers();
    selectedUsers = [];
    fetch();

    super.initState();

  }

  onSelectedRow(bool selected, Score score) async {
    setState(() {
      if(selected){
        selectedUsers.add(score);

      }else{
        selectedUsers.remove(score);
      }
    });
  }



  DataTable databody() {
    if(_allscores == null){
      return DataTable(
          columns: [
            DataColumn(label: Text("Student"),
                numeric: false,
                tooltip: "All fields",
                onSort: (columnIndex, ascending){

                }
            ),
            DataColumn(label: Text("Course "),
                numeric: false,
                tooltip: "All fields",
                onSort: (columnIndex, ascending){

                }
            ),
            DataColumn(label: Text("Score "),
                numeric: false,
                tooltip: "All fields",
                onSort: (columnIndex, ascending){

                }
            ),

          ],
          rows: [ DataRow(

              cells: [

                DataCell(Center(child: CircularProgressIndicator(),)),
                DataCell(Center(child: CircularProgressIndicator(),)),
                DataCell(Center(child: CircularProgressIndicator(),)),
              ]) ]
      );


    }else{
      return DataTable(
          columns: [
            DataColumn(label: Text("Coursename "),
                numeric: false,
                tooltip: "All fields",
                onSort: (columnIndex, ascending){

                }
            ),
            DataColumn(label: Text("Score "),
                numeric: false,
                tooltip: "All fields",
                onSort: (columnIndex, ascending){

                }
            ),

          ],
          rows: _allscores!.map((allcoure) => DataRow(
              selected: selectedUsers.contains(allcoure),
              onSelectChanged: (b){
                print("Onselect");
                onSelectedRow(b!, allcoure);

              },
              cells: [


                DataCell(Text(allcoure.coursename), onTap: () {
                  print('Selected ${allcoure.coursename}');
                }),
                DataCell(Text(" ${allcoure.score}  "), onTap: (){
                  print('Selected ${allcoure.score}');
                })

              ])).toList());


    }

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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 13),
                child:   Container(
                  height: 40,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Globalvariables.primarycolor
                  ),
                  child: Center(
                    child: Text(
                      "Semester",
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w400, fontSize: 15),
                    ) ,
                  ),
                ),
                  ),
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
                            "Semester Score",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ) ,
                        ),
                      ),
                      Center(
                        child: databody(),
                      ),
                      SizedBox(height: 12,),

                    ],
                  ),
                )

              ],
            ),
            SizedBox(height: size.height * 0.90,),
            // Positioned(
            //     left: 2,
            //     bottom: 7,
            //     child: Image.asset('image/stissclipart.png', height: 170, width: 100,)),


          ],
        ),
      ),
    );
  }
}
