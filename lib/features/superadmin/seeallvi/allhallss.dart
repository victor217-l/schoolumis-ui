import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schoolumis/common/costombotton.dart';
import 'package:schoolumis/features/Lecturer/lectureservice/lectureservice.dart';
import 'package:schoolumis/features/Lecturer/seestudentakingcours.dart';
import 'package:schoolumis/features/model/lectureresin.dart';
import 'package:schoolumis/features/superadmin/addhall.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import '../../../common/globalvariables.dart';
import '../../../common/navigation.dart';
import '../../../constraint/error_handler.dart';
import '../../../constraint/utill.dart';
import '../../model/halls.dart';
import '../../model/studentm.dart';
import '../../student/commenceregistration.dart';
import '../../student/worshipcentre.dart';



class AllHalls extends StatefulWidget {
  const AllHalls({Key? key}) : super(key: key);

  @override
  State<AllHalls> createState() => _AllHallsState();
}

class _AllHallsState extends State<AllHalls> {


  Future<List<Halls>> fetchHalls() async {
    SharedPreferences prefss = await SharedPreferences.getInstance();
    final studentto = prefss.getString("studenttoken");

    List<Halls> _allhall = [];

    try{

      http.Response res = await http.get(Uri.parse(
          "https://universitymanagem.onrender.com/superadmin/allhalladmin"),
          headers: <String, String>{
            "Content-type": "application/json; charset=UTF-8",
            "Authorization": "Bearer $studentto"
          }
      );

      print(res.body);


      httpErrorHandler(response: res, context: context, onSuccess: () {
        for(int i = 0; i < jsonDecode(res.body)['list'].length; i++ ){
          _allhall.add(Halls.fromJson(jsonEncode(jsonDecode(res.body)['list'][i])));
        }


      });

    }catch(e){
      showsnackbar(context, e.toString());

    }

    return _allhall;



    // if (res.statusCode == 200) {
    //   final jsonData = json.decode(res.body);
    //   var jsonlist = (jsonData['list'] as List).map((userli) => Hallfors.fromJson(jsonEncode(userli))).toList();
    //   return jsonlist;
    //   //  final jsonData = json.decode(response.body) as List<dynamic>;
    //   //  return jsonData.map((data) => Hallfors.fromJson(data)).toList();
    // } else {
    //   throw Exception("no data");
    // }
  }


  List<Halls>? hall;
  late List<Halls> selectedHalls;


  void fetch() async {
     hall = await fetchHalls();
    setState(() {

    });
  }


  @override
  void initState() {
    //alls = [];
    fetch();
    selectedHalls = [];
    //fetchHalls();
    super.initState();
  }


  void onSelectedRow(bool selected, Halls  hall) {
    if (selected) {
      setState(() {
        selectedHalls.add(hall);
        // sendhall(student.hallofresidence, hall.firstname);

      });
    } else {
      setState(() {
        selectedHalls.remove(hall);
      });
    }
  }


  DataTable databody() {
    if(hall == null){
      return   DataTable(columns: [
        DataColumn(label: Text("hallname"),
            numeric: false,
            tooltip: "Hallname",
            onSort: (columnIndex, ascendeing) {

            }),

        DataColumn(label: Text("halladmin"),
            numeric: false,
            tooltip: "Halladmin",
            onSort: (columnIndex, ascendeing) {}
        ),


      ], rows: [
        DataRow(cells: [
          DataCell(Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularProgressIndicator(color: Globalvariables.colorforstablel,),
          ),)),
          DataCell(Center(child: CircularProgressIndicator(color: Globalvariables.primarycolor,),)),


        ])
      ]);
    } else{
      return DataTable(columns: [
        DataColumn(label: Text("hallname"),
            numeric: false,
            tooltip: "Hallname",
            onSort: (columnIndex, ascendeing) {

            }),

        DataColumn(label: Text("halladmin"),
            numeric: false,
            tooltip: "Halladmin",
            onSort: (columnIndex, ascendeing) {}
        ),



      ], rows:  hall !.map(
            (halsl) =>
            DataRow(
              selected: selectedHalls.contains(halsl),
              onSelectChanged: (bool? selected) {
                print("Onselect");
                onSelectedRow(selected!, halsl);
              },
              cells: [
                DataCell(
                  Text(halsl.hallname,),
                  onTap: () {
                    print('Selected ${halsl.hallname}');
                  },
                ),
                DataCell(
                    Text(halsl.halladmin),
                    onTap: () {
                      print('Selected ${halsl.halladmin}');
                    }
                ),

              ],
            ),
      ).toList(),
      );

    }
  }


  //rows: fetchallhalls.map((user) =>
  //
  // DataRow(
  // selected: selectedUsers.contains(user),
  // onSelectChanged: (b){
  // print("Onselect");
  // onSelectedRow(b!, user);
  //
  // },
  // cells: [
  //
  //     DataCell(Text(user.firstname), onTap: (){
  //     print('Selected ${user.firstname}');
  //     }),
  //    DataCell(Text(user.lastname))
  //
  //    ])
  //
  // ).toList()m



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0) ,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: AppBar(
            backgroundColor: Colors.white,
            shadowColor: null,
            elevation: 0,
            leading: Padding(padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: Image.asset("image/forstart.png", height: 20, width: 20, fit: BoxFit.cover,),
              ),),

            actions: [
              Builder(builder: (BuildContext context) {
                return IconButton(onPressed: () {
                  Scaffold.of(context).openDrawer();

                }, icon: Icon(Icons.menu), color: Colors.black,
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,);
              })

            ],
          ),
        ) ,
      ),
      drawer: Navigationdrawer(),
      body:SingleChildScrollView(
        child: Stack(
          children: [
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
                      TopBar(text: "Refresh"),


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
                            "List of Halls",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ) ,
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddHallPortal()));
                          },

                          child: Text("Add Hall portal")),
                      SizedBox(height: 10,),
                      Center(
                        child: databody(),
                      ),
                      SizedBox(height: 12,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  Worshipcentre() ));
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
            SizedBox(height: size.height * 0.85,),
            //
            // Positioned(
            //     left: 10,
            //     bottom: 0,
            //     child: Image.asset("image/Group hall.png", height: 170, width: 180, fit: BoxFit.contain,)
            // )
            // //  ),

          ],
        ),
      ) ,
    );
  }
}
