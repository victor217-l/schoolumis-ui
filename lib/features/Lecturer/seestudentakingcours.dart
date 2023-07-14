import 'package:flutter/material.dart';
import 'package:schoolumis/common/costombotton.dart';
import 'package:schoolumis/common/globalvariables.dart';
import 'package:schoolumis/features/Lecturer/lectureservice/lectureservice.dart';

import '../../common/navigation.dart';
import '../model/seestudentofferingcoures.dart';
import 'lectuscore/adscore.dart';

class SeeStudentTakingCourse extends StatefulWidget {
  final   String coursename;
  final String year;
  const SeeStudentTakingCourse({Key? key, required this.coursename, required this.year}) : super(key: key);

  @override
  State<SeeStudentTakingCourse> createState() => _SeeStudentTakingCourseState();
}


class _SeeStudentTakingCourseState extends State<SeeStudentTakingCourse> {


  final LectureService lectureService = LectureService();

  List<StudentIofferingYourcourse>? studencourse;

  void  fetchStudentCourse() async {
    studencourse = await lectureService.fetchstudenttakingcourse(context,
        widget.year, widget.coursename);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStudentCourse();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60.0) ,
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 14),
          child: AppBar(
            backgroundColor: Colors.white,
            shadowColor: null,
            elevation: 0,
            leading: Padding(padding: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25.0)) ,
                child: Image.asset("image/forstart.png", height: 20, width: 20, fit: BoxFit.cover,)  ,
            )
              ,),
              actions: [
                Builder(builder: (BuildContext context) {
                  return IconButton(onPressed: (){
                    Scaffold.of(context).openDrawer();
                  }, icon: Icon(Icons.menu, color: Colors.black, ),
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                })

            ],
          )
          ,) ,),
      drawer: NavigationdrawerforLecturer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("List of all student in the course"),
                  SizedBox(height: size.height * 0.02 ,),
                  CustomButtonfortable(text: widget.coursename,),
                  Text(widget.year),

                  Container(
                    height: 500,
                    width: double.infinity,
                    color: Colors.white,
                    child:    studencourse == null ? Center(child: CircularProgressIndicator(color: Globalvariables.primarycolor,)) :
                    ListView.builder(
                      itemCount: studencourse!.length,
                        itemBuilder: (context, index) {
                      final allstudentincoures = studencourse![index];
                      return Column(
                        children: [
                          SizedBox(height: 17,),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddScoree(
                                    couresname: allstudentincoures.coursname, studentname: allstudentincoures.studentname)));
                              },
                              child: Text("Name of Student : ${allstudentincoures.studentname}",
                                style: TextStyle(color: Colors.black),)),
                          SizedBox(height: 6,),
                          Image.asset("image/Rectangle 191.png",height: 2,  width: 350, fit: BoxFit.cover,),
                          SizedBox(height: 17,),
                          // Text("Name of student :", style: TextStyle(color: Colors.black),),
                          // SizedBox(height: 6,),
                          // Image.asset("image/Rectangle 191.png", height: 2, width: 350, fit: BoxFit.cover,),

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
            ),
          ],
        ),
      ),
    );
  }
}
