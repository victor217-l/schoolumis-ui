import 'package:flutter/material.dart';
import 'package:schoolumis/features/student/acsemester/semester.dart';

import '../../../common/globalvariables.dart';
import '../../../common/user.dart';
import '../commenceregistration.dart';

class StudentProfil extends StatefulWidget {
  const StudentProfil({Key? key}) : super(key: key);

  @override
  State<StudentProfil> createState() => _StudentProfilState();
}

class _StudentProfilState extends State<StudentProfil> {

 late List<User> users;
 late List<User> selectedUsers;

  @override
  void initState() {
    // TODO: implement initState
    users = User.getUsers();
    selectedUsers = [];
    super.initState();

  }


  DataTable databody() {
    return DataTable(
        columns: [
          DataColumn(label: Text("All fields"),
              numeric: false,
              tooltip: "All fields",
              onSort: (columnIndex, ascending){

              }
          ),
          DataColumn(label: Text("Your "),
              numeric: false,
              tooltip: "All fields",
              onSort: (columnIndex, ascending){

              }
          ),

        ],
        rows: users.map((user) => DataRow(cells: [

          DataCell(Text(user.firstname)),
          DataCell(Text(user.firstname))

        ])).toList());

  }




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                        "Student Profile",
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
                            "Student Profile",
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  Semester() ));
                        },
                        child: Container(
                          height: 40,
                          width: 210,
                          decoration: BoxDecoration(
                              color: Globalvariables.primarycolor,
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          child: Center(
                            child: Text("Submit Registration",style: TextStyle(color: Colors.white, ),),
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
      ),
    );
  }
}
