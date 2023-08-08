import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schoolumis/constraint/error_handler.dart';
import 'package:schoolumis/constraint/utill.dart';
import 'package:schoolumis/features/student/commenceregistration.dart';
import 'package:schoolumis/features/student/worshipcentre.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/globalvariables.dart';
import '../../common/navigation.dart';
import 'package:http/http.dart' as http;
import '../../common/user.dart';
import 'modelsforstudent/modelforshowinghall.dart';

class HallofStudent extends StatefulWidget {
  const HallofStudent({Key? key}) : super(key: key);

  @override
  State<HallofStudent> createState() => _HallofStudentState();
}

class _HallofStudentState extends State<HallofStudent> {


  Future<List<Hallfors>> fetchHalls() async {
    SharedPreferences prefss = await SharedPreferences.getInstance();
    final studentto = prefss.getString("studenttoken");

    List<Hallfors> _hallstu = [];

    try{

      http.Response res = await http.get(Uri.parse(
          "https://universitymanagem.onrender.com/student/allhallsavailable"),
          headers: <String, String>{
            "Content-type": "application/json; charset=UTF-8",
            "Authorization": "Bearer $studentto"
          }
      );

      print(res.body);


      httpErrorHandler(response: res, context: context, onSuccess: () {
        for(int i = 0; i < jsonDecode(res.body)['list'].length; i++ ){
          _hallstu.add(Hallfors.fromJson(jsonEncode(jsonDecode(res.body)['list'][i])));
        }


      });

    }catch(e){
      showsnackbar(context, e.toString());
    }

    return _hallstu;



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

  Future<void> sendhall(String hallname,String halladmin ) async{


    SharedPreferences prefs = await SharedPreferences.getInstance();
    final studentto = prefs.getString("studenttoken");


    SharedPreferences prefss = await  SharedPreferences.getInstance();
    final matric_no = prefss.getString("studentmatric_no");



    http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/student/selectresidence"),
      body: jsonEncode({
        "matric_no": matric_no,
        "hallname": hallname,
        "halladmin":halladmin,
      }),

    headers: <String,String>{
          "Content-type": "application/json; charset=UTF-8",
          "Authorization": "Bearer $studentto"
        }
    );

    print(res.body);

    httpErrorHandler(response: res, context: context, onSuccess: () {
      showsnackbar(context, jsonDecode(res.body)['msg']);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Worshipcentre()));
    });

  }

  List<Hallfors>? halls;
  late List<Hallfors> selectedHalls;


  void fetch() async {
    halls = await fetchHalls();
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


  void onSelectedRow(bool selected, Hallfors hall) {
    if (selected) {
      setState(() {
        selectedHalls.add(hall);
        sendhall(hall.hallofresidence, hall.firstname);
        
      });
    } else {
      setState(() {
        selectedHalls.remove(hall);
      });
    }
  }


  DataTable databody() {
    if(halls == null){
      return   DataTable(columns: [
        DataColumn(label: Text("Hallname"),
          numeric: false,
          tooltip: "Hall admin",
          onSort: (columnIndex, asccending){

          }
        ),
        DataColumn(label: Text("HallAdmin"),
          numeric: false,
          tooltip: "Hall Admin",
          onSort: (columnIndex, ascending){

          }

        )

      ], rows: [
        DataRow(cells: [
          DataCell(Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularProgressIndicator(color: Globalvariables.colorforstablel,),
          ),)),
          DataCell(Center(child: CircularProgressIndicator(color: Globalvariables.primarycolor,),))
        ])
      ]);
    } else{
      return DataTable(columns: [
        DataColumn(label: Text("HallName"),
            numeric: false,
            tooltip: "Hallname",
            onSort: (columnIndex, ascendeing) {

            }),
        DataColumn(label: Text("HallAdmin"),
            numeric: false,
            tooltip: "Halladmin",
            onSort: (columnIndex, ascendeing) {}
        )


      ], rows:  halls!.map(
            (hall) =>
            DataRow(
              selected: selectedHalls.contains(hall),
              onSelectChanged: (bool? selected) {
                print("Onselect");
                onSelectedRow(selected!, hall);
              },
              cells: [
                DataCell(
                  Text(hall.hallofresidence),
                  onTap: () {
                    print('Selected ${hall.hallofresidence}');
                  },
                ),
                DataCell(
                    Text(hall.firstname),
                    onTap: () {
                      print('Selected ${hall.firstname}');
                    }
                ),
        // DataCell(
        //   Checkbox(
        //     value: selectedHalls.contains(hall),
        //     onChanged: (bool? value) {
        //       onSelectedRow(value!, hall);
        //     },
        //     checkColor: Colors.white,
        //     activeColor: Colors.blue, // Change the color of the selected checkbox
        //   ),
              ],
            ),
      ).toList(),
      );

    }
  }


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
