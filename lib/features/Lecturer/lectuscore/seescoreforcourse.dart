import 'package:flutter/material.dart';
import 'package:schoolumis/common/costombotton.dart';
import 'package:schoolumis/features/Lecturer/lectureservice/lectureservice.dart';
import 'package:schoolumis/features/Lecturer/lectuscore/seestudentwithscore.dart';
import 'package:schoolumis/features/Lecturer/seestudentakingcours.dart';

import '../../../common/globalvariables.dart';
import '../../../common/navigation.dart';
import '../../model/lecture.dart';

class SeeCoursesforscoree extends StatefulWidget {
  const SeeCoursesforscoree({Key? key}) : super(key: key);

  @override
  State<SeeCoursesforscoree> createState() => _SeeCoursesforscoreeState();
}

class _SeeCoursesforscoreeState extends State<SeeCoursesforscoree> {

  final LectureService lectureService = LectureService();


  List<LectureCourse>? lecturesscore;


  void fetchallcourse() async{
    lecturesscore = await lectureService.fetchLectureteacehrcourse(context);
    setState(() {

    });
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchallcourse();
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
            leading:  Padding(
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
              Builder(builder: (BuildContext context) {
                return IconButton(onPressed: (){
                  Scaffold.of(context).openDrawer();
                }, icon: Icon(Icons.menu, color: Colors.black,),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              })

            ],
          )
          ,) ,),
      drawer: NavigationdrawerforLecturer(),
      body: SingleChildScrollView(
          child:Stack(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: size.height * 0.04,),


                    Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),child:
                    lecturesscore == null ? Center(child: CircularProgressIndicator(color: Globalvariables.colorforstablel,)) : ListView.builder(
                        itemCount: lecturesscore!.length,
                        itemBuilder: (context,index) {
                          final lecturess = lecturesscore![index];
                          return Column(
                            children: [
                              InkWell(                                                                                   //coursename,yearofcourse
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                                    SeeStudentWithScore(coursename: lecturess.nameofcourse, ) )),
                                child:Row(
                                  children: [
                                    CustomButtonfortable(text: lecturess.nameofcourse,),


                                  ],
                                ),
                              ),
                              //Text(lecturess.year),
                              SizedBox(height: size.height * 0.04,),

                              // CustomButtonfortable(text: "Seng 405"),

                            ],
                          );
                        }),

                    ),





                    SizedBox(height: size.height * 0.4,),
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
                ),),

            ],
          )

      ),
    );
  }
}
