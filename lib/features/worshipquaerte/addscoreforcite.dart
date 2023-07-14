import 'package:flutter/material.dart';
import 'package:schoolumis/features/worshipquaerte/service/servicereg.dart';

import '../../common/costombotton.dart';
import '../../common/costomtextfiel.dart';
import '../../common/globalvariables.dart';

class AddScoreforstudentinChurch extends StatefulWidget {
  final String studentname;
  const AddScoreforstudentinChurch({Key? key, required this.studentname}) : super(key: key);

  @override
  State<AddScoreforstudentinChurch> createState() => _AddScoreforstudentinChurchState();
}

class _AddScoreforstudentinChurchState extends State<AddScoreforstudentinChurch> {

  final addscore = GlobalKey<FormState>();

  final TextEditingController _studentname = TextEditingController();
  final TextEditingController _scorecontroller = TextEditingController();


  final WorshipCentress worshipCentress = WorshipCentress();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _studentname.dispose();
    _scorecontroller.dispose();
  }

  void addcorel() {
    worshipCentress.Addscoree(context: context, studentname: widget.studentname, score: _scorecontroller.text);
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: addscore,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add a score for this student offering this course"),
                    SizedBox(height: size.height * 0.02 ,),
                    CustomButtonfortable(text: " ${widget.studentname}",),
                    SizedBox(height: 12,),
                    // InkWell(
                    //     onTap: () {
                    //
                    //     },
                    //     child: Text(" Course Name", style: TextStyle(color: Colors.black),)),
                    // SizedBox(height: 5,),
                    // Customtextfiell(controller: _studentname, hintext: "Student Name", icon: Icons.mail, ),
                    SizedBox(height: 10,),
                    //Image.asset("image/Rectangle 191",height: 1,  width: 350, fit: BoxFit.contain,),
                    Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text("Score : ", style: TextStyle(color: Colors.black, ),
                        )
                    ),
                    SizedBox(height: 5,),
                    Customtextfiell(controller: _scorecontroller, hintext: "Score ", icon: Icons.cabin,),
                    //  Image.asset("image/Rectangle 191", height: 1, width: 350, fit: BoxFit.contain,),
                    SizedBox(height: size.height * 0.35,),
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
                        if(addscore.currentState!.validate()){
                          addcorel();

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
                          : const Text('Login'),
                    ),


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
      ),
    );
  }
}
