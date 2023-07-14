import 'package:flutter/material.dart';
import 'package:schoolumis/common/costombotton.dart';
import 'package:schoolumis/common/costomtextfiel.dart';
import 'package:schoolumis/features/Lecturer/lectureservice/lectureservice.dart';

import '../../common/globalvariables.dart';

class Addcourses extends StatefulWidget {
  const Addcourses({Key? key}) : super(key: key);

  @override
  State<Addcourses> createState() => _AddcoursesState();
}

class _AddcoursesState extends State<Addcourses> {


  final addcourse = GlobalKey<FormState>();

  final TextEditingController  _nameofcourse = TextEditingController();
  final TextEditingController _shortname =  TextEditingController();
  final TextEditingController _yearname = TextEditingController();
  final TextEditingController _lecturername = TextEditingController();

  final LectureService lectureService = LectureService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameofcourse.dispose();
    _shortname.dispose();
    _yearname.dispose();
    _lecturername.dispose();
  }

  void Addcourle() {
    lectureService.AddCourse(context: context,
        coursename: _nameofcourse.text,
        shortnameofcourse: _shortname.text ,
        year: _yearname.text,
        lecturername: _lecturername.text);
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                key: addcourse,
                child: Column(
                  children: [
                    Customtextfiel(controller: _nameofcourse , title: "Coursename", iconData: Icons.leaderboard_outlined,
                        hintext: "Coursename"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: _shortname, title: "Shortname of course", iconData: Icons.swipe_left_alt_rounded,
                        hintext: "Shortname of course"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: _yearname, title: "Year of course ", iconData: Icons.radio_button_checked_rounded,
                        hintext: "Year of course"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: _lecturername , title: "Lecturer name", iconData: Icons.swipe_left_alt_rounded,
                        hintext: "Lecturer name"),
                    SizedBox(height: 10,),

                    ElevatedButton(
                      style:ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.0))),
                          minimumSize: Size(
                              double.infinity, 50),
                          primary: Globalvariables.primarycolor),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if(addcourse.currentState!.validate()){
                          Addcourle();
                        }
                        await Future.delayed(const Duration(seconds: 50));
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: (isLoading)
                          ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1.5,
                          ))
                          : const Text('Add course'),
                    ),


                    // CustomButton(text: "Add Course")







                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
