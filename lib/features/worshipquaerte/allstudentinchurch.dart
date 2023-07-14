import 'package:flutter/material.dart';
import 'package:schoolumis/features/student/worshipcentre.dart';
import 'package:schoolumis/features/worshipquaerte/addscoreforcite.dart';
import 'package:schoolumis/features/worshipquaerte/service/servicereg.dart';

import '../../common/costombotton.dart';
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
                  CustomButtonfortable(text: "Seng 308",),
                  SizedBox(height: 17,),
                  Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.white,
                    child:    _worship == null ? Center(child: CircularProgressIndicator(),) :
                        ListView.builder(
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
