import 'package:flutter/material.dart';
import 'package:schoolumis/common/globalvariables.dart';

import '../common/navigation.dart';

class DashboardForeveryone extends StatefulWidget {
  const DashboardForeveryone({Key? key}) : super(key: key);

  @override
  State<DashboardForeveryone> createState() => _DashboardForeveryoneState();
}

class _DashboardForeveryoneState extends State<DashboardForeveryone> {
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
             Image.asset('image/every.png', height: 10, width: 10, fit: BoxFit.cover,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("image/Students typically.png",
                      height:100, width: 100, fit:BoxFit.fill),
                    SizedBox(width: 5,),
                    Image.asset("image/dashbordforev.png", height: 150, width:150)


                  ],

                ),
              ),
              SizedBox(height: size.height * 0.04 ,),

              Text('University', style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: size.height *0.02,),
              Container(
                height: 140,
                width: double.infinity,
                child: Stack(
                  children: [


                       Container(
                        height: 120,
                        width: 310,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('image/every.png',),
                            fit: BoxFit.cover
                          )
                        ),
                      ),

                    Positioned(
                      top: -10,
                      left: 28,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Globalvariables.seccondarycolor,
                            borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: Center(
                          child: Image.asset('image/apll.png',
                            height: 10,width: 10, fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                    


                  ],
                ),
              ),
              SizedBox(height: size.height * 0.06,),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("University, institution of higher",  style: TextStyle(color: Colors.black),),
                    Text("2030@openBrawer")
                  ],
                ),
              )
              
              
              
            ],
          ),
        ),

      ) ,
    );

  }
}
