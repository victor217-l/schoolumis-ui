import 'package:flutter/material.dart';
import 'package:schoolumis/common/costombotton.dart';
import 'package:schoolumis/common/costomtextfiel.dart';
import 'package:schoolumis/features/Lecturer/lectureservice/lectureservice.dart';
import 'package:schoolumis/features/superadmin/supservice/service.dart';

import '../../common/globalvariables.dart';

class AddWorshipcentre extends StatefulWidget {
  const AddWorshipcentre({Key? key}) : super(key: key);

  @override
  State<AddWorshipcentre> createState() => _AddWorshipcentreState();
}

class _AddWorshipcentreState extends State<AddWorshipcentre> {


  final addworshipcente = GlobalKey<FormState>();

  final TextEditingController  worshipinst = TextEditingController();
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController password = TextEditingController();
  final  TextEditingController worshipcenternamw = TextEditingController();

  final SuperAdminService superAdminService = SuperAdminService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    worshipinst.dispose();
    _emailController.dispose();
    password.dispose();
    worshipcenternamw .dispose();
  }

  void addworsh() {
    superAdminService.addWorshipcentre(context: context,
      worshipinst: worshipinst.text,
      emailController: _emailController.text,
      password: password.text,
      worshipcentername: worshipcenternamw.text,
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
                key: addworshipcente,
                child: Column(
                  children: [
                    Customtextfiel(controller: worshipinst , title: " name", iconData: Icons.leaderboard_outlined,
                        hintext: "Firstname"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: _emailController, title: "Email ", iconData: Icons.swipe_left_alt_rounded,
                        hintext: "Email"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: password, title: "Password ", iconData: Icons.radio_button_checked_rounded,
                        hintext: "Password"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: worshipcenternamw , title: " Worship centre name", iconData: Icons.swipe_left_alt_rounded,
                        hintext: " Worship centre name"),
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
                        if(addworshipcente.currentState!.validate()){
                          addworsh();

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
