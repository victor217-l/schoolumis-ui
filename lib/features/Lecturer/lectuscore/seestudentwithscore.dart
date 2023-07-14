import 'package:flutter/material.dart';
import 'package:schoolumis/common/globalvariables.dart';
import 'package:schoolumis/features/Lecturer/lectureservice/lectureservice.dart';

import '../../../common/costombotton.dart';
import '../../model/studentwithscore.dart';

class SeeStudentWithScore extends StatefulWidget {
  final String coursename;
  const SeeStudentWithScore({Key? key, required this.coursename}) : super(key: key);

  @override
  State<SeeStudentWithScore> createState() => _SeeStudentWithScoreState();
}

class _SeeStudentWithScoreState extends State<SeeStudentWithScore> {

  List<Studentincoursewithscore>? _stuscore;

  final LectureService lectureService = LectureService();

  void fetchscore() async {
    _stuscore = await lectureService.fetchstudeentScore(context, widget.coursename);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchscore();
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
                children: [
                  Text("Student with scores"),
                  SizedBox(height: size.height * 0.1 ,),
                  CustomButtonfortable(text: widget.coursename,),
                  Container(
                    height: 500,
                    width: double.infinity,
                    color: Colors.white,
                    child: _stuscore == null ? Center(child: CircularProgressIndicator(color: Globalvariables.colorforstablel,),) : ListView.builder(
                      itemCount: _stuscore!.length,
                        itemBuilder: (context, index) {
                        final studentscore = _stuscore![index];
                          return Column(
                            children: [
                              InkWell(
                                  onTap: () {

                                  },
                                  child:
                                      Column(
                                        children: [
                                     Row(
                                  children: [
                                        Text(" Name of student : ${studentscore.studentlastname}", style: TextStyle(color: Colors.black),),
                                        SizedBox(width: 10,),

                                  ],
                                  ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text(" Score : ${studentscore.score}", style: TextStyle(color: Colors.black),),
                                            ],
                                          )

                                        ],
                                      )
                              ),
                              SizedBox(height: 10,),

                              Image.asset("image/Rectangle 191.png",height: 1,  width: 350, fit: BoxFit.cover,),
                              SizedBox(height: 10,)
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Text("Name of student", style: TextStyle(color: Colors.black),),
                              //     Text("score", style: TextStyle(color: Colors.black),)
                              //
                              //   ],
                              // ),
                              //
                              // Image.asset("image/Rectangle 191.png", height: 1, width: 350, fit: BoxFit.contain,),

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
      ) ,
    );
  }
}
