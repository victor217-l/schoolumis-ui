import 'package:flutter/material.dart';
import 'package:schoolumis/features/student/selectedcourses.dart';

import '../../common/globalvariables.dart';
import '../../common/navigation.dart';
import '../../common/user.dart';
import 'commenceregistration.dart';
import 'hallresidence.dart';

class Courselist extends StatefulWidget {
  const Courselist({Key? key}) : super(key: key);

  @override
  State<Courselist> createState() => _CourselistState();
}

class _CourselistState extends State<Courselist> {

 late List<User> users;
  late List<User> selectedUsers;


  @override
  void initState() {
    users = User.getUsers();
    // TODO: implement initState
    selectedUsers = [];
    super.initState();
  }

  onSelectedRow(bool selected, User user) async {
    setState(() {
      if(selected){
        selectedUsers.add(user);
      }else{
        selectedUsers.add(user);
      }
    });
  }

  DataTable datebody() {
    return DataTable(columns: [
      DataColumn(label: Text('First name'),
          numeric: false,
          tooltip: "This is firstname",
          onSort: (columnIndex, ascending){

          }
      ),
      DataColumn(label: Text('First name'),
          numeric: false,
          tooltip: "This is firstname"
      ),

    ],
        rows: users.map(
                (user)  => DataRow(
                selected: selectedUsers.contains(user),
                onSelectChanged: (b){
                  print("Onselect");
                  onSelectedRow(b!, user);

                },
                cells: [
                  DataCell(Text(user.firstname), onTap: (){
                    print('Selected ${user.firstname}');
                  }),
                  DataCell(Text(user.lastname))
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
