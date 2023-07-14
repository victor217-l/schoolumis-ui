import 'package:flutter/material.dart';

import '../../common/globalvariables.dart';

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
                  SizedBox(width: size.width * 0.4,),
                  Text("Check student your in your hall"),
                  SizedBox(width: size.width * 0.2,) ,
                  Container(
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
                  SizedBox(width: size.width * 0.3,),
                  Text("Add student that has a church"),
                  SizedBox(width: size.width * 0.2,) ,
                  Container(
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
                          child: Image.asset("image/Rectangle 179.png",),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text("Add  student courses",style: TextStyle(color:Colors.black, ))

                              ]
                          ),
                        )

                      ],),
                  )
                ],
              ) ,)
          ],
        ),
      ),
    );
  }
}
