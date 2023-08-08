import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schoolumis/common/globalvariables.dart';

class Customtextfiel extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final IconData iconData;
  final String hintext;
  const Customtextfiel({Key? key, required this.controller, required this.title,
    required this.iconData, required this.hintext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,),
        SizedBox(height: 6,),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 1
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText:  hintext,
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                   iconData,
                  color: Globalvariables.primarycolor,
                ),
              ),
              border: UnderlineInputBorder(
    borderSide: BorderSide(width: 2, color: Globalvariables.colorforsomeheader)
    ),
                filled: true,
                fillColor: Colors.white,


                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Globalvariables.colorforstablel)
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Globalvariables.colorforstablel)
                )
            ),
          ),
        )
      ],
    );
  }
}

class Customtextfiell extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final IconData icon;
  const Customtextfiell({Key? key, required this.controller, required this.hintext, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintext,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              icon,
              color: Globalvariables.primarycolor,
            ),
          ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Globalvariables.colorforsomeheader)
        ),
          enabledBorder: UnderlineInputBorder(
             borderSide: BorderSide(width: 2, color: Globalvariables.colorforstablel)
          ),
          focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Globalvariables.colorforstablel)
      )
      ),
    );
  }
}



class   Passwortextfiell extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final IconData icon;
  const Passwortextfiell({Key? key, required this.controller, required this.hintext, required this.icon}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    bool isobscured = true;
    return TextFormField(
      controller: controller,
      obscureText: isobscured,
      decoration: InputDecoration(

          filled: true,
          fillColor: Colors.white,
          hintText: hintext,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              icon,
              color: Globalvariables.primarycolor,
            ),
          ),

          border: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Globalvariables.colorforsomeheader)
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Globalvariables.colorforstablel)
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Globalvariables.colorforstablel)
          )
      ),
    );
  }
}



TextFieldWidget(
    String title, IconData iconData, TextEditingController controller,Function validator,{Function? onTap,bool readOnly = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
      ),
      const SizedBox(
        height: 6,
      ),
      Container(
        width: Get.width,
        // height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          readOnly: readOnly,
          onTap: ()=> onTap!(),
          validator: (input)=> validator(input),
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                iconData,
                color: Colors.green,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      )
    ],
  );
}

