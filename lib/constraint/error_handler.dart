

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:schoolumis/constraint/utill.dart';

void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,

}) async{
  switch(response.statusCode){
     case 200:
       onSuccess();
       break;
       case 404:
         showsnackbar(context, jsonDecode(response.body)['error']);
         break;
     case 422:
       showsnackbar(context, jsonDecode(response.body)['msg']);
       break;
     case 500:  
       showsnackbar(context, jsonDecode(response.body)['msg']);
       break;
    default:
      showsnackbar(context, jsonDecode(response.body)['msg']);

  }
}