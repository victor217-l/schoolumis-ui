import 'package:flutter/material.dart';
import 'package:schoolumis/common/costombotton.dart';
import 'package:schoolumis/common/costomtextfiel.dart';
import 'package:schoolumis/features/Lecturer/lectureservice/lectureservice.dart';
import 'package:schoolumis/features/superadmin/supservice/service.dart';

import '../../common/globalvariables.dart';

class AddHallPortal extends StatefulWidget {
  const AddHallPortal({Key? key}) : super(key: key);

  @override
  State<AddHallPortal> createState() => _AddHallPortalState();
}

class _AddHallPortalState extends State<AddHallPortal> {


  final addhall = GlobalKey<FormState>();

  final TextEditingController  firstname = TextEditingController();
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController password = TextEditingController();
  final  TextEditingController hallofresidence = TextEditingController();

  final SuperAdminService superAdminService = SuperAdminService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstname.dispose();
    _emailController.dispose();
    password.dispose();
    hallofresidence .dispose();
  }

  void addHall() {
    superAdminService.addHalla(context: context,
      firstname: firstname.text,
      emailController: _emailController.text,
      password: password.text,
      hallofresidence: hallofresidence.text,
    );
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
                key: addhall,
                child: Column(
                  children: [
                    Customtextfiel(controller: firstname , title: "Firstname", iconData: Icons.leaderboard_outlined,
                        hintext: "Firstname"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: _emailController, title: "Email ", iconData: Icons.swipe_left_alt_rounded,
                        hintext: "Email"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: password, title: "Password ", iconData: Icons.radio_button_checked_rounded,
                        hintext: "Password"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: hallofresidence , title: " Hall of residence", iconData: Icons.swipe_left_alt_rounded,
                        hintext: "Department"),
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
                        if(addhall.currentState!.validate()){
                          addHall();
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
                          : const Text('Add Hall portal'),
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
