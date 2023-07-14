import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schoolumis/common/costombotton.dart';
import 'package:schoolumis/common/costomtextfiel.dart';
import 'package:schoolumis/common/globalvariables.dart';
import 'package:schoolumis/features/student/service/studentservice.dart';

class LoginStudent extends StatefulWidget {
  const LoginStudent({Key? key}) : super(key: key);

  @override
  State<LoginStudent> createState() => _LoginStudentState();
}

class _LoginStudentState extends State<LoginStudent> {

  final TextEditingController _matricController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final StudentService studentService = StudentService();



  bool isLoading = false;

  final _loginStuden = GlobalKey<FormState>();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _matricController.dispose();
    _passwordController.dispose();
  }

  void loginst() {
    studentService.loginstuent(context: context,
        matric_no: _matricController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              height: Get.height * 0.87,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key:  _loginStuden,
                  child: Column(
                    children: [
                      greenIntroWidgetWithoutLogos(),
                      SizedBox(height: 10,),
                      Customtextfiel(controller: _matricController, title: "Matric_no" , iconData: Icons.cabin, hintext: "Email"),
                     SizedBox(height: 10,),
                      Passwortextfiell(controller: _passwordController, hintext: "Password", icon: Icons.type_specimen,),
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
                          if(_loginStuden.currentState!.validate()){
                            loginst();

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




                    ],
                  ),
                ),
              ),
            ),
          ],),
        )



    );
  }
}


Widget greenIntroWidgetWithoutLogos({String title = "Login",String? subtitle}){
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("image/Ellipse 33.png"),
            fit: BoxFit.fill
        )
    ),
    height: Get.height*0.3,
    child: Container(
        height: Get.height*0.1,
        width: Get.width,
        margin: EdgeInsets.only(bottom: Get.height*0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,),
          ],
        )),

  );
}
// class MyProfile extends StatefulWidget {
//   static const String routeName = '/myprofie';
//   const MyProfile({Key? key}) : super(key: key);
//
//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }
//
// class _MyProfileState extends State<MyProfile> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController homeController = TextEditingController();
//   TextEditingController businessController = TextEditingController();
//   TextEditingController shopController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//
//   final _createyourprofile = GlobalKey<FormState>();
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _surnameCntroller = TextEditingController();
//   final TextEditingController _matricController = TextEditingController();
//   final TextEditingController _universityController = TextEditingController();
//   final TextEditingController _facultyController = TextEditingController();
//   final TextEditingController _departmentController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _nameController.dispose();
//     _surnameCntroller.dispose();
//     _matricController.dispose();
//     _universityController.dispose();
//     _facultyController.dispose();
//     _departmentController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
//   final RegisterService registerService = RegisterService();
//
//   void createprofile() async {
//     registerService.createYourProfile(
//       context: context, firstname: _nameController.text,
//       lastname: _surnameCntroller.text,
//       matric: _matricController.text,
//       university: _universityController.text,
//       faculty: _facultyController.text,
//       department: _departmentController.text, email: _emailController.text,
//     );
//
//   }
//
//
//
//   final ImagePicker _picker = ImagePicker();
//   File? selectedImage;
//
//   getImage(ImageSource source) async {
//     final XFile? image = await _picker.pickImage(source: source);
//     if (image != null) {
//       selectedImage = File(image.path);
//       setState(() {});
//     }
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: Get.height * 0.4,
//                     child: Stack(
//                       children: [
//                         greenIntroWidgetWithoutLogos(),
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: InkWell(
//                               onTap: () {
//                                 getImage(ImageSource.camera);
//                               },
//                               child: Stack(
//                                 children: [
//                                   selectedImage == null
//                                       ? Container(
//                                     width: 120,
//                                     height: 120,
//                                     margin: EdgeInsets.only(bottom: 20),
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Color(0xffD6D6D6)),
//                                     child: Center(
//                                       child: Icon(
//                                         Icons.camera_alt_outlined,
//                                         size: 40,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   )
//                                       : Container(
//                                     width: 120,
//                                     height: 120,
//                                     margin: EdgeInsets.only(bottom: 20),
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             image: FileImage(selectedImage!),
//                                             fit: BoxFit.fill),
//                                         shape: BoxShape.circle,
//                                         color: Color(0xffD6D6D6)),
//                                   ),
//                                   Positioned(
//                                       bottom: 5,
//                                       right: 10,
//                                       child: Container(
//                                         height: 40,
//                                         width: 40,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           border: Border.all(
//                                             width: 4,
//                                             color: Theme.of(context).scaffoldBackgroundColor,
//                                           ),
//                                           color: Colors.green,
//                                         ),
//                                         child: Icon(
//                                           Icons.edit,
//                                           color: Colors.white,
//                                         ),
//                                       )),
//
//
//                                 ],
//                               )
//
//
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 23),
//                     child: Form(
//                         key: formKey,
//                         child: Column(
//                             children: [
//                               TextFieldWidget(
//                                 ' FirstName', Icons.person_outlined, nameController,(String? input){
//
//                                 if(input!.isEmpty){
//                                   return 'Name is required!';
//                                 }
//
//                                 if(input.length<5){
//                                   return 'Please enter a valid name!';
//                                 }
//
//                                 return null;
//
//                               },),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               TextFieldWidget(
//                                 'Last Name', Icons.drive_file_rename_outline,  _surnameCntroller,(String? input){
//
//                                 if(input!.isEmpty){
//                                   return 'Home Address is required!';
//                                 }
//
//                                 return null;
//
//                               },onTap: ()async{
//
//                                 /// now let's translate this selected address and convert it to latlng obj
//
//
//                                 ///store this information into firebase together once update is clicked
//
//
//
//                               },),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               TextFieldWidget('Matric', Icons.school,
//                                 _matricController ,(String? input){
//                                   if(input!.isEmpty){
//                                     return 'Business Address is required!';
//                                   }
//
//                                   return null;
//                                 },onTap: ()async{
//
//
//                                   /// now let's translate this selected address and convert it to latlng obj
//
//
//                                   ///store this information into firebase together once update is clicked
//
//                                 },),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               TextFieldWidget('University',
//                                 Icons.shopping_cart_outlined, _universityController,(String? input){
//                                   if(input!.isEmpty){
//                                     return 'Shopping Center is required!';
//                                   }
//
//                                   return null;
//                                 },onTap: ()async{
//
//                                   /// now let's translate this selected address and convert it to latlng obj
//
//
//                                   ///store this information into firebase together once update is clicked
//
//                                 },),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               TextFieldWidget('Email',
//                                 Icons.ad_units, _emailController,(String? input){
//                                   if(input!.isEmpty){
//                                     return 'Shopping Center is required!';
//                                   }
//
//                                   return null;
//                                 },onTap: ()async{
//
//                                   /// now let's translate this selected address and convert it to latlng obj
//
//
//                                   ///store this information into firebase together once update is clicked
//
//                                 },),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               TextFieldWidget('Department',
//                                 Icons.school_sharp, _departmentController,(String? input){
//                                   if(input!.isEmpty){
//                                     return 'Shopping Center is required!';
//                                   }
//
//                                   return null;
//                                 },onTap: ()async{
//
//                                   /// now let's translate this selected address and convert it to latlng obj
//
//
//                                   ///store this information into firebase together once update is clicked
//
//                                 },),
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                               ElevatedButton(
//                                 style:ElevatedButton.styleFrom(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(12.0))),
//                                     minimumSize: Size(
//                                         double.infinity, 50),
//                                     primary: Colors.green),
//                                 onPressed: () async {
//                                   setState(() {
//                                     isLoading = true;
//                                   });
//                                   if(formKey.currentState!.validate()){
//                                     createprofile();
//                                   }
//                                   await Future.delayed(const Duration(seconds: 50));
//                                   setState(() {
//                                     isLoading = false;
//                                   });
//                                 },
//                                 child: (isLoading)
//                                     ? const SizedBox(
//                                     width: 16,
//                                     height: 16,
//                                     child: CircularProgressIndicator(
//                                       color: Colors.white,
//                                       strokeWidth: 1.5,
//                                     ))
//                                     : const Text('Send'),
//                               ),
//
//
//
//
//
//                             ])),
//
//                   ),
//                 ]
//             )
//         ) );
//
//
//   }
//
//   TextFieldWidget(
//       String title, IconData iconData, TextEditingController controller,Function validator,{Function? onTap,bool readOnly = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//         ),
//         const SizedBox(
//           height: 6,
//         ),
//         Container(
//           width: Get.width,
//           // height: 50,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     spreadRadius: 1,
//                     blurRadius: 1)
//               ],
//               borderRadius: BorderRadius.circular(8)),
//           child: TextFormField(
//             readOnly: readOnly,
//             onTap: ()=> onTap!(),
//             validator: (input)=> validator(input),
//             controller: controller,
//             decoration: InputDecoration(
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Icon(
//                   iconData,
//                   color: Colors.green,
//                 ),
//               ),
//               border: InputBorder.none,
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget greenButton(String title, Function onPressed) {
//     return MaterialButton(
//       minWidth: 140,
//       height: 50,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//       color:Colors.grey,
//       onPressed: () => onPressed(),
//       child: Text(
//         title,
//
//       ),
//     );
//   }
// }

