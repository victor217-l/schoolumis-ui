import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolumis/common/globalvariables.dart';

void showsnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text, style: TextStyle(color: Colors.white,
  fontSize: 16),), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
    padding: EdgeInsets.all(10),
    elevation: 6,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Globalvariables.colorforstablel,//forsomeh
  ));
}
