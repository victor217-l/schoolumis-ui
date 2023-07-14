import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globalvariables.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 320,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Globalvariables.primarycolor
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w400, fontSize: 15),
        ) ,
      ),
    );
  }
}


class CustomButtonfortable extends StatelessWidget {
  final String text;
  const CustomButtonfortable({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 330,
      decoration: BoxDecoration(
        color: Globalvariables.colorforstablel,
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),),
      ),
    );
  }
}
