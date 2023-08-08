import 'package:flutter/material.dart';
import 'package:schoolumis/features/worshipquaerte/allstudentinchurch.dart';

import '../../common/globalvariables.dart';
import '../../common/navigation.dart';
import '';
import 'addscoreforcite.dart';

class WorshipquerterDashbo extends StatefulWidget {
  const WorshipquerterDashbo({Key? key}) : super(key: key);

  @override
  State<WorshipquerterDashbo> createState() => _WorshipquerterDashboState();
}

class _WorshipquerterDashboState extends State<WorshipquerterDashbo> {
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
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 310,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 175, 119, 51),
                        borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.search, color: Colors.white, ),
                          // SizedBox(width: size.width * 0.3,),
                          Text("Search", style: TextStyle(color: Colors.white,
                              fontSize: 15, fontWeight: FontWeight.w300 ),),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Globalvariables.colorforround,
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Text("Check student your in your church"),
                  SizedBox(height: size.height * 0.02,) ,
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AllStudentInAChurch()));
                    },
                    child: Container(
                      height: 80,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Globalvariables.primarycolor,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(24),),
                            child: Image.asset("image/Rectangle 189.png",),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            child: Column(
                                crossAxisAlignment:   CrossAxisAlignment.start,
                                children: [
                                  Text("See all student",style: TextStyle(color:Colors.black, ))

                                ]
                            ),
                          )

                        ],),
                    ),
                  ),
                  //SizedBox(height: size.height * 0.03,),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddScoreforstudentinChurch(studentname: '',)));
                  //   },
                  //   child: Container(
                  //     height: 80,
                  //     width: 320,
                  //     decoration: BoxDecoration(
                  //       color: Globalvariables.primarycolor,
                  //       borderRadius: BorderRadius.all(Radius.circular(24)),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         ClipRRect(
                  //           borderRadius: BorderRadius.all(Radius.circular(24),),
                  //           child: Image.asset("image/Rectangle 179.png",),
                  //         ),
                  //         Padding(
                  //           padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  //           child: Column(
                  //               crossAxisAlignment:CrossAxisAlignment.start,
                  //               children: [
                  //                 Text("Add  student score",style: TextStyle(color:Colors.black, ))
                  //
                  //               ]
                  //           ),
                  //         )
                  //
                  //       ],),
                  //   ),
                  // )`
                ],
              ) ,),
            SizedBox(height: size.height * 1.05,),
            Positioned(
              bottom: 0,
                right: -2,
                child: Image.asset("image/R (21) 1.png", height: 400
                  , width: 300, fit: BoxFit.fitWidth, ))
          ],
        ),
      ),
    );
  }
}
