import 'package:flutter/material.dart';
import 'package:schoolumis/common/costomtextfiel.dart';
import 'package:schoolumis/common/navigation.dart';
import 'package:schoolumis/features/Lecturer/lectureservice/lectureservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/costombotton.dart';
import '../../../common/globalvariables.dart';

class AddScoree extends StatefulWidget {
  final String couresname;
  final String studentname;
  const AddScoree({Key? key,
    required this.couresname,
    required this.studentname}) : super(key: key);

  @override
  State<AddScoree> createState() => _AddScoreeState();
}

class _AddScoreeState extends State<AddScoree> {

  final  _coursenform = GlobalKey<FormState>();

  final TextEditingController _coursename = TextEditingController();
  final TextEditingController _scorecontroller = TextEditingController();

  final LectureService lectureService = LectureService();

  void addscro() async {
    lectureService.AddScore(context: context,
        studentname: widget.studentname,
        coursename: widget.couresname, score: _scorecontroller.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _coursename.dispose();
    _scorecontroller.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60.0) ,
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
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
                }, icon: Icon(Icons.menu, color: Colors.black,),
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
              child: Form(
                key: _coursenform,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add a score for this student offering this course"),
                    SizedBox(height: size.height * 0.02 ,),
                    CustomButtonfortable(text: widget.studentname,),
                    SizedBox(height: 12,),
                    InkWell(
                        onTap: () {

                        },
                        child: Text(" Course Name : ${widget.couresname}", style: TextStyle(color: Colors.black),)),
                    SizedBox(height: 5,),
                    // Customtextfiell(controller: _coursename, hintext: "Course Name", icon: Icons.icecream, ),
                   //SizedBox(height: 10,),
                    //Image.asset("image/Rectangle 191",height: 1,  width: 350, fit: BoxFit.contain,),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text("Score : ", style: TextStyle(color: Colors.black, ),
                      )
                    ),
                  SizedBox(height: 5,),
                  Customtextfiell(controller: _scorecontroller, hintext: "Score ", icon: Icons.nature_outlined,),
                  //  Image.asset("image/Rectangle 191", height: 1, width: 350, fit: BoxFit.contain,),
                    SizedBox(height: size.height * 0.40,),
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
                        if(_coursenform.currentState!.validate()){
                          addscro();
                        }

                      },
                      child: (isLoading)
                          ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1.5,
                          ))
                          : const Text('Submit score'),
                    ),
                    SizedBox(height: size.height * 0.32,),
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
            )
          ],
        ),
      ) ,
    );
  }
}
