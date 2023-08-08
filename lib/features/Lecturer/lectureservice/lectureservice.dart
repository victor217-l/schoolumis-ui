import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:schoolumis/features/Lecturer/lectuscore/seestudentwithscore.dart';
import 'package:schoolumis/features/Lecturer/seestudentakingcours.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


import '../../../constraint/error_handler.dart';
import '../../../constraint/utill.dart';
import '../../model/lecture.dart';
import '../../model/seestudentofferingcoures.dart';
import '../../model/studentwithscore.dart';
import '../../student/dashboardstudent.dart';
import '../lecturedashboa.dart';

class LectureService{

  void LoginLecture({
    required BuildContext  context,
    required String email,
    required String password,
  })async{
    try{
      http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/lecturer/loginlecturer"),
          body: {
            "email": email,
            "password": password,
          }
      );

      print(res.body);

      httpErrorHandler(response: res, context: context, onSuccess: () async {
        showsnackbar(context, jsonDecode(res.body)['msg']);
        SharedPreferences prefs = await  SharedPreferences.getInstance();
        await prefs.setString("lecturertoken", jsonDecode(res.body)['accessToken']);
        SharedPreferences prefss = await  SharedPreferences.getInstance();
        await prefss.setString("lecturename", jsonDecode(res.body)['lecturer_name']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LectureDashboard()),
                (route) => false);

        //store matric in it
      });
    }catch(e){
      showsnackbar(context, e.toString());
    }
  }


  void AddCourse({
   required BuildContext context,
    required String coursename,
    required String shortnameofcourse,
    required String year,
    required String lecturername,
}) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var lecturertokens = await prefs.getString("lecturertoken");

      http.Response res =  await http.post(Uri.parse("https://universitymanagem.onrender.com/lecturer/addlecturecourse"),
        body: jsonEncode({
          "nameofcourse": coursename ,
          "shortname": shortnameofcourse,
          "yearof": year,
          "lecturername": lecturername,
        }),

        //  "Content-type": "application/type; charset=UTF-8",
         // "Authorization": "Bearer $lecturertokens",
        headers: <String,String>{
        "Content-type": "application/json; charset=UTF-8",
          "Authorization": "Bearer $lecturertokens",
        }
      );

      print(coursename); print(shortnameofcourse); print(year); print(lecturername);

      httpErrorHandler(response: res, context: context, onSuccess: () async {
        showsnackbar(context, jsonDecode(res.body)['msg']);

      });

    }catch(e){

      showsnackbar(context, e.toString());
    }
  }

  //getallcouresforlecturer
 //lecturername

  //all courses lecturer is taking
  Future<List<LectureCourse>> fetchLectureteacehrcourse(BuildContext context ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var lecturertokens = await prefs.getString("lecturertoken");

    SharedPreferences prefss = await SharedPreferences.getInstance();
    var lecturername = await prefss.getString("lecturename");



    List<LectureCourse> listscorse = [];

    try{
      http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/lecturer/getallcouresforlecturer"),
          body: jsonEncode({
            "lecturername":lecturername,
          }),
          headers: <String,String>{
            "Content-type":"application/json; charset=UTF-8",
            "Authorization": "Bearer $lecturertokens"
          }
      );

      print(res.body);
      print(lecturername);

      httpErrorHandler(response: res, context: context, onSuccess: () {
        showsnackbar(context, jsonDecode(res.body)['msg']);
        for(int i = 0; i < jsonDecode(res.body)['list'].length; i++){
          listscorse.add(LectureCourse.fromJson(jsonEncode(jsonDecode(res.body)['list'][i])));

        }
      });
   }catch(e){
      showsnackbar(context, e.toString());

  }
    return listscorse;
    }


    //student taking course
  Future<List<StudentIofferingYourcourse>> fetchstudenttakingcourse(BuildContext context, String year, String coursename ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var lecturertokens = await prefs.getString("lecturertoken");

    SharedPreferences prefss = await SharedPreferences.getInstance();
    var lecturername = await prefss.getString("lecturename");



    List<StudentIofferingYourcourse> allstudentinclass = [];

    try{
      http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/lecturer/allstudentofferingcourse"),
          body: jsonEncode({
            "lecturername":lecturername,
            "year": year,
            "coursename":coursename,
          }),
          headers: <String,String>{
            "Content-type":"application/json; charset=UTF-8",
            "Authorization": "Bearer $lecturertokens"
          }
      );

      print(coursename);
      print(year);
      print(lecturername);

      print(res.body);

      httpErrorHandler(response: res, context: context, onSuccess: () {
        showsnackbar(context, jsonDecode(res.body)['msg']);
        for(int i = 0; i < jsonDecode(res.body)['list'].length; i++){
          allstudentinclass.add(StudentIofferingYourcourse.fromJson(jsonEncode(jsonDecode(res.body)['list'][i])));
        }
      });
    }catch(e){
      showsnackbar(context, e.toString());

    }
    return allstudentinclass;
  }






  void AddScore({
  required BuildContext context,
  required String studentname,
  required String coursename,
  required String score,

}) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
    var lecturertokens = await prefs.getString("lecturertoken");

    http.Response res =  await http.post(Uri.parse("https://universitymanagem.onrender.com/lecturer/addscoretostudent"),
    body: jsonEncode({
      "lastnameofstudent": studentname ,
       "coursename": coursename,
        "score": score,
    }),

      headers: <String,String>{
      "Content-type":"application/json; charset=UTF-8",
       "Authorization": "Bearer $lecturertokens",
      }
      );

      print(res.body);

       print(coursename);
       print(studentname);
      print(score);

      httpErrorHandler(response: res, context: context, onSuccess: () async {
      showsnackbar(context, jsonDecode(res.body)['msg']);
       });

      }catch(e){
      showsnackbar(context, e.toString());
     }
}





Future<List<Studentincoursewithscore>> fetchstudeentScore(BuildContext context, String coursename ) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var lecturertokens = await prefs.getString("lecturertoken");

  SharedPreferences prefss = await SharedPreferences.getInstance();
  var lecturername = await prefss.getString("lecturename");



  List<Studentincoursewithscore> scorse = [];

  try{
    http.Response res = await http.post(Uri.parse("https://universitymanagem.onrender.com/lecturer/seealscore"),
        body: jsonEncode({
          "coursename":coursename,
        }),
        headers: <String,String>{
          "Content-type":"application/json; charset=UTF-8",
          "Authorization": "Bearer $lecturertokens"
        }
    );

    print(res.body);

    httpErrorHandler(response: res, context: context, onSuccess: () {
      showsnackbar(context, jsonDecode(res.body)['msg']);
      for(int i = 0; i < jsonDecode(res.body)['list'].length; i++){
        scorse.add(Studentincoursewithscore.fromJson(jsonEncode(jsonDecode(res.body)['list'][i])));
      }
    });
  }catch(e){
    showsnackbar(context, e.toString());

  }
  return scorse;
}
}



// lecturer@gmail.com
// 12345678
// teacjher@gmail.com
// 12345678
//
//
// for hall
// micheal@gmail.com
// 1234567
// hall@gmail.com
// 1234567


