
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:schoolumis/constraint/error_handler.dart';
import 'package:schoolumis/constraint/utill.dart';
import 'package:schoolumis/features/model/studentinhall.dart';
import 'package:schoolumis/features/worshipquaerte/wrshipdashbo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorshipCentress {
  void Logincentre ({
   required BuildContext context,
   required String email,
   required String password,
}) async {
    try{
      http.Response res  = await http.post(Uri.parse("https://universitymanagem.onrender.com/worship/login"),
        body: jsonEncode({
          'email':email,
          'password': password,
        }),
          headers: <String,String>{
          "Content-type":"application/json; charset=UTF-8",
          }
      );

      httpErrorHandler(response: res, context: context, onSuccess: () async {
        showsnackbar(context, jsonDecode(res.body)['msg']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("worhipcentretoken", jsonDecode(res.body)['accessToken']);
        SharedPreferences prefss = await SharedPreferences.getInstance();
        await prefss.setString("worshipname", jsonDecode(res.body)['worshipname']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> WorshipquerterDashbo()), (route) => false);

      });

    }catch(e){
      showsnackbar(context, e.toString());

    }
  }


  Future<List<StudentInyourHall>> fetchstudentincourse(BuildContext context, ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var worshiptokens = await prefs.getString("worhipcentretoken");

    SharedPreferences prefss = await SharedPreferences.getInstance();
    var worshipname = await prefss.getString("worshipname");



    List<StudentInyourHall> liststu = [];

    try{
      http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/lecturer/selectforparticularchurch"),
          body: jsonEncode({
            "worshipname":worshipname,
          }),
          headers: <String,String>{
            "Content-type":"application/json; charset=UTF-8",
            "Authorization": "Bearer $worshiptokens"
          }
      );

      print(res.body);
      print(worshipname);

      httpErrorHandler(response: res, context: context, onSuccess: () {
        showsnackbar(context, jsonDecode(res.body)['msg']);
        for(int i = 0; i < jsonDecode(res.body)['list'].length; i++){
          liststu.add(StudentInyourHall.fromJson(jsonEncode(jsonDecode(res.body)['list'][i])));

        }
      });
    }catch(e){
      showsnackbar(context, e.toString());

    }
    return liststu;
  }



  void Addscoree ({
    required BuildContext context,
    required String studentname,
    required String score,
  }) async {
    try{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var worshiptokens = await prefs.getString("worhipcentretoken");

      // SharedPreferences prefss = await SharedPreferences.getInstance();
      // var worshipname = await prefss.getString("worshipname");



      http.Response res  = await http.post(Uri.parse("https://universitymanagem.onrender.com/worship/scoreforstudent"),
          body: jsonEncode({
            'studentname':studentname,
            'score': score,
          }),
          headers: <String,String>{
            "Content-type":"application/json; charset=UTF-8",
            "Authorization": "Bearer $worshiptokens"
          }
      );

      httpErrorHandler(response: res, context: context, onSuccess: () async {
        showsnackbar(context, jsonDecode(res.body)['msg']);

      });

    }catch(e){
      showsnackbar(context, e.toString());

    }
  }


}