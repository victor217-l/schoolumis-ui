import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schoolumis/common/costombotton.dart';
import 'package:schoolumis/features/Lecturer/lectureservice/lectureservice.dart';
import 'package:schoolumis/features/Lecturer/seestudentakingcours.dart';
import 'package:schoolumis/features/superadmin/addstudent.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import '../../../common/globalvariables.dart';
import '../../../common/navigation.dart';
import '../../../constraint/error_handler.dart';
import '../../../constraint/utill.dart';
import '../../model/studentm.dart';
import '../../student/commenceregistration.dart';
import '../../student/worshipcentre.dart';



class AllStudent extends StatefulWidget {
  const AllStudent({Key? key}) : super(key: key);

  @override
  State<AllStudent> createState() => _AllStudentState();
}

class _AllStudentState extends State<AllStudent> {


  Future<List<Student>> fetchHalls() async {
    SharedPreferences prefss = await SharedPreferences.getInstance();
    final studentto = prefss.getString("studenttoken");

    List<Student> _allstutm = [];

    try{

      http.Response res = await http.get(Uri.parse(
          "https://universitymanagem.onrender.com/superadmin/forstudent"),
          headers: <String, String>{
            "Content-type": "application/json; charset=UTF-8",
            "Authorization": "Bearer $studentto"
          }
      );

      print(res.body);


      httpErrorHandler(response: res, context: context, onSuccess: () {
        for(int i = 0; i < jsonDecode(res.body)['list'].length; i++ ){
          _allstutm.add(Student.fromJson(jsonEncode(jsonDecode(res.body)['list'][i])));
        }


      });

    }catch(e){
      showsnackbar(context, e.toString());

    }

    return _allstutm;



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


  List<Student>? srudent;
  late List<Student> selectedHalls;


  void fetch() async {
    srudent = await fetchHalls();
    setState(() {

    });
  }


  @override
  void initState() {
    //halls = [];
    fetch();
    selectedHalls = [];
    //fetchHalls();
    super.initState();
  }


  void onSelectedRow(bool selected, Student  student) {
    if (selected) {
      setState(() {
        selectedHalls.add(student);
       // sendhall(student.hallofresidence, hall.firstname);

      });
    } else {
      setState(() {
        selectedHalls.remove(student);
      });
    }
  }


  DataTable databody() {
    if(srudent == null){
      return   DataTable(columns: [
        DataColumn(label: Text("First name"),
            numeric: false,
            tooltip: "Hallname",
            onSort: (columnIndex, ascendeing) {

            }),
        DataColumn(label: Text("Last Name"),
            numeric: false,
            tooltip: "Halladmin",
            onSort: (columnIndex, ascendeing) {}
        ),
        DataColumn(label: Text("Matric_no"),
            numeric: false,
            tooltip: "Hallname",
            onSort: (columnIndex, ascendeing) {

            }),
        DataColumn(label: Text("Email"),
            numeric: false,
            tooltip: "Halladmin",
            onSort: (columnIndex, ascendeing) {}
        ),
        DataColumn(label: Text("Password"),
            numeric: false,
            tooltip: "Password",
            onSort: (columnIndex, ascendeing) {

            }),
        DataColumn(label: Text(""),
            numeric: false,
            tooltip: "Halladmin",
            onSort: (columnIndex, ascendeing) {}
        )

      ], rows: [
        DataRow(cells: [
          DataCell(Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularProgressIndicator(color: Globalvariables.colorforstablel,),
          ),)),
          DataCell(Center(child: CircularProgressIndicator(color: Globalvariables.primarycolor,),)),
          DataCell(Center(child: CircularProgressIndicator(color: Globalvariables.primarycolor,),)),
          DataCell(Center(child: CircularProgressIndicator(color: Globalvariables.primarycolor,),)),
          DataCell(Center(child: CircularProgressIndicator(color: Globalvariables.primarycolor,),)),
          DataCell(Center(child: CircularProgressIndicator(color: Globalvariables.primarycolor,),)),
        ])
      ]);
    } else{
      return DataTable(columns: [
        DataColumn(label: Text("Firstname"),
            numeric: false,
            tooltip: "Hallname",
            onSort: (columnIndex, ascendeing) {

            }),
        DataColumn(label: Text("LastName"),
            numeric: false,
            tooltip: "Halladmin",
            onSort: (columnIndex, ascendeing) {}
        ),
        DataColumn(label: Text("Matric_no"),
            numeric: false,
            tooltip: "Hallname",
            onSort: (columnIndex, ascendeing) {

            }),
        DataColumn(label: Text("Email"),
            numeric: false,
            tooltip: "Halladmin",
            onSort: (columnIndex, ascendeing) {}
        ),
        DataColumn(label: Text("Password"),
            numeric: false,
            tooltip: "Password",
            onSort: (columnIndex, ascendeing) {

            }),
        DataColumn(label: Text("address"),
            numeric: false,
            tooltip: "Halladmin",
            onSort: (columnIndex, ascendeing) {}
        ),
        DataColumn(label: Text("department"),
            numeric: false,
            tooltip: "Halladmin",
            onSort: (columnIndex, ascendeing) {}
        )


      ], rows:  srudent !.map(
            (stuen) =>
            DataRow(
              selected: selectedHalls.contains(stuen),
              onSelectChanged: (bool? selected) {
                print("Onselect");
                onSelectedRow(selected!, stuen);
              },
              cells: [
                DataCell(
                  Text(stuen.firstname,),
                  onTap: () {
                    print('Selected ${stuen.firstname}');
                  },
                ),
                DataCell(
                    Text(stuen.lastname),
                    onTap: () {
                      print('Selected ${stuen.lastname}');
                    }
                ),
                DataCell(
                    Text(stuen.matric_no),
                    onTap: () {
                      print('Selected ${stuen.matric_no}');
                    }
                ),
                DataCell(
                    Text(stuen.email),
                    onTap: () {
                      print('Selected ${stuen.email}');
                    }
                ),
                DataCell(
                    Text(stuen.password),
                    onTap: () {
                      print('Selected ${stuen.password}');
                    }
                ),
                DataCell(
                    Text(stuen.address),
                    onTap: () {
                      print('Selected ${stuen.address}');
                    }
                ),
                DataCell(
                    Text(stuen.departmant),
                    onTap: () {
                      print('Selected ${stuen.departmant}');
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
                            "List of Student",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ) ,
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddStudent()));
                        },

                          child: Text("Add student")),
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

            Positioned(
                left: 10,
                bottom: 0,
                child: Image.asset("image/Group hall.png", height: 170, width: 180, fit: BoxFit.contain,)
            )
            //  ),

          ],
        ),
      ) ,
    );
  }
}
