import 'package:flutter/material.dart';

import '../../common/globalvariables.dart';
import '../../common/navigation.dart';
import '../../common/user.dart';
import 'commenceregistration.dart';
import 'hallresidence.dart';

class SubmitRegistration extends StatefulWidget {
  const SubmitRegistration({Key? key}) : super(key: key);

  @override
  State<SubmitRegistration> createState() => _SubmitRegistrationState();
}

class _SubmitRegistrationState extends State<SubmitRegistration> {
  
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
                        child: databody(),
                      ),
                      SizedBox(height: 12,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  HallofStudent() ));
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

      ) ,
    );
  }
}
