import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolumis/constraint/error_handler.dart';
import 'package:schoolumis/constraint/utill.dart';
import 'package:schoolumis/features/halladmin/halladmindashbo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Lecturer/lecturedashboa.dart';
import '../../model/studentinhall.dart';

class HallService {

  void LoginHal({
    required BuildContext  context,
    required String email,
    required String password,
  })async{
    try{
      http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/halladmin/login"),
          body: {
            "email": email,
            "password": password,
          }
      );

      print(res.body);

      httpErrorHandler(response: res, context: context, onSuccess: () async {
        showsnackbar(context, jsonDecode(res.body)['msg']);
        SharedPreferences prefs = await  SharedPreferences.getInstance();
        await prefs.setString("halltoken", jsonDecode(res.body)['accessToken']);
        SharedPreferences prefss = await  SharedPreferences.getInstance();
        await prefss.setString("hallname", jsonDecode(res.body)['hallname']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HallAdminDashboard()),
                (route) => false);

        //store matric in it
      });
    }catch(e){
      showsnackbar(context, e.toString());
    }
  }



  Future<List<StudentInyourHall>> fetchstudentinhall(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenforhaladmin = prefs.getString("halltoken");

    SharedPreferences prefss = await SharedPreferences.getInstance();
    var hallnameforha =  prefss.getString("hallname");
    List<StudentInyourHall> allstudent = [];


    http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/halladmin/allstudentinyourhall"),
      body: jsonEncode({
        "hallname": hallnameforha,
      }),
      headers: <String,String>{
       "Content-type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $tokenforhaladmin",
      }
    );

    print(res.body);


    httpErrorHandler(response: res, context: context, onSuccess: () {
      showsnackbar(context, jsonDecode(res.body)['msg']);
      for(int i = 0; i < jsonDecode(res.body)['list'].length; i++){
         allstudent.add(StudentInyourHall.fromJson(jsonEncode(jsonDecode(res.body)['list'][i])));
      }
    });

    return allstudent;
  }

  void citenShipScore({
   required BuildContext context,
    required String nameofStudent,
    required String scoreofStudent,
}) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var tokenforhaladmin = prefs.getString("hallaadmintoken");

      
      http.Response res = await http.post(Uri.parse("/"),
        body: jsonEncode({

        }),

           headers: <String,String>{
            "Content-type":"application/json; charset=UTF-8",
            "Authorization": "Bearer $tokenforhaladmin"

        }
      );

      httpErrorHandler(response: res, context: context, onSuccess: () {
        showsnackbar(context, jsonDecode(res.body)['msg']);
        for(int i = 0; i < jsonDecode(res.body)['list'].length; i++){

        }
      });
      
      
      
    }catch(e){
      
    }
  }
}