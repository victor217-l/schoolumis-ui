import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:schoolumis/constraint/error_handler.dart';
import 'package:schoolumis/constraint/utill.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SuperAdminService{

  void addStudent({
    required BuildContext context,
   required String firstname,
    required String lastname,
    required String matric_no,
    required String email,
    required String password,
    required String address,
    required String department,
}) async {
    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final superto = prefs.getString("");

      http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/superadmin/forstudent"),
        body: jsonEncode({
          "firstname": firstname,
          "lastname": lastname,
          "matric_no":matric_no,
           "email":email,
           "password": password,
          "address": address,
          "department": department,
        }),

          headers: <String,String>{
            "Content-type":"application/json; charset=UTF-8",
            //"Authorization": "Bearer $superto",
          }
      );

      print(res.body);

      httpErrorHandler(response: res, context: context, onSuccess: () {
        showsnackbar(context, jsonDecode(res.body)['msg']);
      });



    }catch(e){
      showsnackbar(context, e.toString());

    }
  }



  void addLecture({
    required BuildContext context,
    required String firstname,
    required String emailController,
    required String password,
    required String department,
  }) async {
    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final superto = prefs.getString("");

      http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/superadmin/lecturer"),
          body: jsonEncode({
            "firstname": firstname,
            "email": emailController,
            "password":password,
            "department": department,
          }),

          headers: <String,String>{
            "Content-type":"application/json; charset=UTF-8",
           // "Authorization": "Bearer $superto",
          }
      );

      print(res.body);

      httpErrorHandler(response: res, context: context, onSuccess: () {
        showsnackbar(context, jsonDecode(res.body)['msg']);
      });



    }catch(e){
      showsnackbar(context, e.toString());

    }
  }



  void addHalla({
    required BuildContext context,
    required String firstname,
    required String emailController,
    required String password,
    required String hallofresidence,
  }) async {
    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final superto = prefs.getString("");

      http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/superadmin/addhalladmin"),
          body: jsonEncode({
            "firstname": firstname,
            "email": emailController,
            "password":password,
            "hallofresidence": hallofresidence,
          }),

          headers: <String,String>{
            "Content-type":"application/json; charset=UTF-8",
           // "Authorization": "Bearer $superto",
          }
      );

      print(res.body);

      httpErrorHandler(response: res, context: context, onSuccess: () {
        showsnackbar(context, jsonDecode(res.body)['msg']);
      });



    }catch(e){
      showsnackbar(context, e.toString());

    }
  }




  void addWorshipcentre({
    required BuildContext context,
    required String worshipinst,
    required String emailController,
    required String password,
    required String worshipcentername,
  }) async {
    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final superto = prefs.getString("");

      http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/superadmin/worshipcon"),
          body: jsonEncode({
            "worshipinst": worshipinst,
            "email": emailController,
            "password":password,
            "worshipcentername": worshipcentername,
          }),

          headers: <String,String>{
            "Content-type":"application/json; charset=UTF-8",
            //"Authorization": "Bearer $superto",
          }
      );
      print(worshipinst);
      print(emailController);
      print(password);
      print(worshipcentername);

      print(res.body);

      httpErrorHandler(response: res, context: context, onSuccess: () {
        showsnackbar(context, jsonDecode(res.body)['msg']);
      });



    }catch(e){
      showsnackbar(context, e.toString());

    }
  }

}