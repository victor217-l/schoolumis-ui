import 'package:flutter/material.dart';
import 'package:schoolumis/features/student/worshipcentre.dart';
import 'package:schoolumis/features/worshipquaerte/addscoreforcite.dart';
import 'package:schoolumis/features/worshipquaerte/service/servicereg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/costombotton.dart';
import '../../common/navigation.dart';
import '../model/studentinhall.dart';

class AllStudentInAChurch extends StatefulWidget {
  const AllStudentInAChurch({Key? key}) : super(key: key);

  @override
  State<AllStudentInAChurch> createState() => _AllStudentInAChurchState();
}

class _AllStudentInAChurchState extends State<AllStudentInAChurch> {


  final WorshipCentress worshipCentress = WorshipCentress();

  
  List<StudentInyourHall>? _worship ;

  void fetchworship() async {
   _worship = await worshipCentress.fetchstudentincourse(context);
   // SharedPreferences prefs = await SharedPreferences.getInstance();
   // final churchs = prefs.getString(" ")

   setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchworship();
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
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("List of all student in the church"),
                  SizedBox(height: size.height * 0.02 ,),
                  CustomButtonfortable(text: "Pioneer",),
                  SizedBox(height: 17,),
                  Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.white,
                    child:    _worship == null ? Center(child: CircularProgressIndicator(),) :
                        ListView.builder(
                          itemCount: _worship!.length,
                            itemBuilder: (context,index) {
                              final  worship = _worship![index];
                          return Column(
                            children: [
                              InkWell(
                              onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddScoreforstudentinChurch(studentname: worship.studentname,)));
                          },
                          child: Text("Name of Student :  ${worship.studentname}", style: TextStyle(color: Colors.black),)),
                          SizedBox(height: 10,),
                          Image.asset("image/Rectangle 191.png",height: 2,  width: 350, fit: BoxFit.cover,),
                          SizedBox(height: 17,),
                          Text("Name of church : ${worship.worshipname}",  style: TextStyle(color: Colors.black),),
                          // SizedBox(height: 6,),
                          // Image.asset("image/Rectangle 191.png", height: 2, width: 350, fit: BoxFit.cover,),,



                          ],
                          );

                        }),
                  ),


                  SizedBox(height: size.height * 0.9,),

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
            )
          ],
        ),
      ),
    );
  }
}
