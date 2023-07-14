import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:schoolumis/constraint/error_handler.dart';
import 'package:schoolumis/constraint/utill.dart';
import 'package:schoolumis/features/student/dashboardstudent.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StudentService{

  void loginstuent({
  required BuildContext  context,
    required String matric_no,
    required String password,
  })async{
    try{
      http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/student/loginstudent"),
        body: {
        "matric_no": matric_no,
          "password": password,
        }
      );

      print(res.body);

      httpErrorHandler(response: res, context: context, onSuccess: () async {
        showsnackbar(context, jsonDecode(res.body)['msg']);
        SharedPreferences prefs = await  SharedPreferences.getInstance();
        await prefs.setString("studenttoken", jsonDecode(res.body)['accessToken']);
        SharedPreferences prefss = await  SharedPreferences.getInstance();
        await prefss.setString("studentmatric_no", jsonDecode(res.body)['matric_no']);
        Navigator.pushNamedAndRemoveUntil(
            context,
            DashboardStudent.routeName,
                (route) => false);

      //  Navigator.pushNamedAndRemoveUntil(context, DashboardStudent.routeName, (route) => false);
        //store matric in it
      });
    }catch(e){
     showsnackbar(context, e.toString());
    }
  }




}