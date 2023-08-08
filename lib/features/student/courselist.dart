import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schoolumis/features/model/studentm.dart';
import 'package:schoolumis/features/student/selectedcourses.dart';
import 'package:schoolumis/features/student/submitregistration.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/globalvariables.dart';
import '../../common/navigation.dart';
import '../../common/user.dart';
import '../../constraint/error_handler.dart';
import '../../constraint/utill.dart';
import 'commenceregistration.dart';
import 'package:http/http.dart' as http;
import 'hallresidence.dart';
import 'modelsforstudent/modelsforcourse.dart';

class Courselist extends StatefulWidget {
  const Courselist({Key? key}) : super(key: key);

  @override
  State<Courselist> createState() => _CourselistState();
}

class _CourselistState extends State<Courselist> {




 Future<List<Course>> fetccourses() async {
   SharedPreferences prefss = await SharedPreferences.getInstance();
   final studentto = prefss.getString("studenttoken");

   List<Course> _allcourse = [];

   try {

     http.Response res = await http.get(Uri.parse(
         "https://universitymanagem.onrender.com/student/allcourses"),
         headers: <String, String>{
           "Content-type": "application/json; charset=UTF-8",
           "Authorization": "Bearer $studentto"
         }
     );

     print(res.body);


     httpErrorHandler(response: res, context: context, onSuccess: () {
       for (int i = 0; i < jsonDecode(res.body)['list'].length; i++) {
         _allcourse.add(
             Course.fromJson(jsonEncode(jsonDecode(res.body)['list'][i])));
       }
     });
   } catch (e) {
     showsnackbar(context, e.toString());
   }

   return _allcourse;
 }


 Future<void> sendcoures(String coursename,String shortname, String  year ,String lecturename, ) async{


   SharedPreferences prefs = await SharedPreferences.getInstance();
   final studentto = prefs.getString("studenttoken");


   SharedPreferences prefss = await  SharedPreferences.getInstance();
   final matric_no = prefss.getString("studentmatric_no");



   http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/student/addcoursesforstudent"),
       body: jsonEncode({
         "matric_no": matric_no,
         "coursename": coursename,
         "shortname":shortname,
         "lecturername": lecturename,
         "year":year,
         "credit": "3",
       }),

       headers: <String,String>{
         "Content-type": "application/json; charset=UTF-8",
         "Authorization": "Bearer $studentto"
       }
   );

   print(res.body);

   httpErrorHandler(response: res, context: context, onSuccess: () {
     showsnackbar(context, jsonDecode(res.body)['msg']);
     Navigator.of(context).push(MaterialPageRoute(builder: (_) => SubmitRegistration()));
   });

 }


 List<Course>? _allsocours;
 late List<Course> selectedUsers;

 void fetchrm() async {
   _allsocours = await fetccourses();
   setState(() {

   });

 }


 @override
  void initState() {
   fetchrm();
    // TODO: implement initState
    selectedUsers = [];
    super.initState();
  }

  onSelectedRow(bool selected, Course course) async {
    setState(() {
      if(selected){
        selectedUsers.add(course);
        sendcoures(course.nameofcourse,course.shortname,course.year,course.lecturername);
      }else{
        selectedUsers.remove(course);
      }
    });
  }

  DataTable datebody() {
   if(_allsocours == null){
     return DataTable(columns: [
     DataColumn(label: Text('Nameofcourse'),
    numeric: false,
    tooltip: "This is firstname",
    onSort: (columnIndex, ascending) {

    }
    ),
    DataColumn(label: Text('Shortname'),
    numeric: false,
    tooltip: "This is firstname",
    onSort: (columnIndex, ascending) {

    }
    ),
    DataColumn(label: Text('year'),
    numeric: false,
    tooltip: "This is firstname",
    onSort: (columnIndex, ascending) {

    }
    ),
    DataColumn(label: Text('Lecurername'),
    numeric: false,
    tooltip: "This is firstname"
    ),

    ], rows: [
      DataRow(cells: [
        DataCell(Center(child: CircularProgressIndicator(),)),
        DataCell(Center(child: CircularProgressIndicator(),)),
        DataCell(Center(child: CircularProgressIndicator(),)),
        DataCell(Center(child: CircularProgressIndicator(),)),
      ])
    ],
     );

   }else {
     return DataTable(columns: [
       DataColumn(label: Text('Nameofcourse'),
           numeric: false,
           tooltip: "This is firstname",
           onSort: (columnIndex, ascending) {

           }
       ),
       DataColumn(label: Text('Shortname'),
           numeric: false,
           tooltip: "This is firstname",
           onSort: (columnIndex, ascending) {

           }
       ),
       DataColumn(label: Text('year'),
           numeric: false,
           tooltip: "This is firstname",
           onSort: (columnIndex, ascending) {

           }
       ),
       DataColumn(label: Text('Lecurer name'),
           numeric: false,
           tooltip: "This is firstname"
       ),

     ],
         rows: _allsocours!.map(
                 (cours) =>
                 DataRow(
                     selected: selectedUsers.contains(cours),
                     onSelectChanged: (b) {
                       print("Onselect");
                       onSelectedRow(b!, cours);
                     },
                     cells: [
                       DataCell(Text(cours.nameofcourse), onTap: () {
                         print('Selected ${cours.nameofcourse}');
                       }),
                       DataCell(Text(cours.shortname), onTap: () {
                         print('Selected ${cours.shortname}');
                       }),
                       DataCell(Text(cours.year), onTap: () {
                         print('Selected ${cours.year}');
                       }),
                       DataCell(Text(cours.lecturername), onTap: () {
                         print('Selected ${cours.lecturername}');
                       })
                     ])
         ).toList()
     );
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
                            "List of Course",
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  SelectedCourses() ));
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
            SizedBox(height: size.height * 0.90,),
            Positioned(
                left: 0,
                bottom: 7,
                child: Image.asset('image/forcourses.png', height: 200, width: 100,)),

            Positioned(
                right: 0,
                bottom: 20,
                child: Image.asset("image/forstumeal.png", height: 50, width: 50,))

          ],
        ),

      ),
    );
  }
}
