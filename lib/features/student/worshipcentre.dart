import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:schoolumis/features/student/courselist.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/globalvariables.dart';
import '../../common/navigation.dart';
import 'package:http/http.dart' as http;
import '../../common/user.dart';
import 'commenceregistration.dart';
import 'modelsforstudent/modelfotshowingchur.dart';

class Worshipcentre extends StatefulWidget {
  const Worshipcentre({Key? key}) : super(key: key);

  @override
  State<Worshipcentre> createState() => _WorshipcentreState();
}

class _WorshipcentreState extends State<Worshipcentre> {


 Future<List<Showingchurch>>  fetchallchurches() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   final studento = prefs.getString("studenttoken");
   
   http.Response res = await http.get(Uri.parse("https://universitymanagem.onrender.com/student/allchurchesavailable"),
     headers: <String,String>{
     "Content-type":"application/json; charset=UTF-8",
       "Authorization": "Bearer $studento",
     }
   );

   print(res.body);

   if(res.statusCode == 200){
      var jsonData = json.decode(res.body);
      var jsonlistt = (jsonData['list'] as List).map((urle) =>
          Showingchurch.fromJson(jsonEncode(urle))).toList();
      return jsonlistt;
    }else{
     throw Exception("no data");
   }


 }

 List<Showingchurch>? allstu;

 late List<Showingchurch> selectedUsers;



 void fetchal() async {
   allstu =  await fetchallchurches();
 }


  @override
  void initState() {
    //users = User.getUsers();
    // TODO: implement initState
    selectedUsers = [];
    fetchal();
    super.initState();
  }

  onSelectedRow(bool selected, Showingchurch user) async {
    setState(() {
      if(selected){
        setState(() {
          selectedUsers.add(user);

        });

      }else{
        setState(() {
          selectedUsers.remove(user);
        });

      }
    });
  }

  DataTable datebody() {

    return DataTable(columns: [
      DataColumn(label: Text('Worshipcentre'),
          numeric: false,
          tooltip: "Name of church",
          onSort: (columnIndex, ascending){

          }
      ),
      DataColumn(label: Text('Centre man'),
          numeric: false,
          tooltip: "This is firstname"
      ),

    ],
        rows: allstu!.map(
                (userL)  => DataRow(
                selected: selectedUsers.contains(userL),
                onSelectChanged: (b){
                  print("Onselect");
                  onSelectedRow(b!, userL);

                },
                cells: [
                  DataCell(Text(userL.worshipcentrename), onTap: (){
                    print('Selected ${userL.worshipcentrename}');
                  }),
                  DataCell(Text(userL.name), onTap: () {
                    print('Selected ${userL.name}');
                  })
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
      body: SingleChildScrollView(
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
                            "List of Worshipcentre",
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  Courselist() ));
                        },
                        child: Container(
                          height: 30,
                          width: 70,
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
            SizedBox(height: size.height * 0.883,),
            Positioned(
                right: 0,
                bottom: 7,
                child: Image.asset('image/R (23) 1.png', height: 190, width: 140, fit: BoxFit.contain,)),


          ],
        ),

      ),
    );
  }
}
