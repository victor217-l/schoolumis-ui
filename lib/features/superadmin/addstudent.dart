import 'package:flutter/material.dart';
import 'package:schoolumis/common/costombotton.dart';
import 'package:schoolumis/common/costomtextfiel.dart';
import 'package:schoolumis/features/Lecturer/lectureservice/lectureservice.dart';
import 'package:schoolumis/features/superadmin/supservice/service.dart';

import '../../common/globalvariables.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {


  final addstu = GlobalKey<FormState>();

  final TextEditingController  firstname = TextEditingController();
  final TextEditingController _lastname =  TextEditingController();
  final TextEditingController matric_no = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController address = TextEditingController();
  final  TextEditingController department = TextEditingController();

  final SuperAdminService superAdminService = SuperAdminService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstname.dispose();
    _lastname.dispose();
    password.dispose();
    emailController.dispose();
    matric_no.dispose();
   department .dispose();
  }

  void addstuden() {
    superAdminService.addStudent(context: context,
        firstname: firstname.text,
        lastname: _lastname.text,
        email: emailController.text,
        password: password.text,
        matric_no: matric_no.text,
        address: address.text,
        department: department.text,
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
                key: addstu,
                child: Column(
                  children: [
                    Customtextfiel(controller: firstname , title: "Firstname", iconData: Icons.leaderboard_outlined,
                        hintext: "Firstname"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: _lastname, title: "Last name", iconData: Icons.swipe_left_alt_rounded,
                        hintext: "Lastname"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: matric_no, title: "Matric ", iconData: Icons.radio_button_checked_rounded,
                        hintext: "Matric"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: emailController, title: "Email ", iconData: Icons.radio_button_checked_rounded,
                        hintext: "Email"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: password, title: "Password ", iconData: Icons.radio_button_checked_rounded,
                        hintext: "Password"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: address , title: " Address", iconData: Icons.swipe_left_alt_rounded,
                        hintext: "Address"),
                    SizedBox(height: 10,),
                    Customtextfiel(controller: department , title: " Department", iconData: Icons.swipe_left_alt_rounded,
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
                        if(addstu.currentState!.validate()){
                          addstuden();
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
                          : const Text('Add Student'),
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
