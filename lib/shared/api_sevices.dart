import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class ApiServices{


  static getRequest(String url)async{
    try {
      var response =await http.get(Uri.parse(url),
          headers: {
            "Authorization":"Bearer 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",
            "Content-Type": "application/json"}
      );
      if(response.statusCode ==200){
        var res = jsonDecode(response.body);
        return res;
      }else {
         print(response.statusCode);
         print('Status code is:${response.body.toString()}');

      }
    }catch(e){
      print('ERROR IS ${e.toString()}');
    }
  }

  static  postRequest(String url,String message,String model)async{
    try {
      var response =await http.post(Uri.parse(url),
          headers: {
        "Authorization":"Bearer sk-xJbeonTnGxnO2nCoEHZcT2BlbkFJvYQH7s9C5s4CPCHeQu0f",
            "Content-Type": "application/json"

          }
          ,body:
        jsonEncode(
          {
            "model": model,
            "messages": [
              {
                "role": "user",
                "content": message,
              }
            ]
          },
        ),
      );
      if(response.statusCode ==200){
     //   print(response.body);
        var res = jsonDecode(response.body);

        return res;

      }else {
        //print('Status code is:${response.body.toString()}');
        SnackBar(content: Text('Status code is:${response.body.toString()}'),);
      }
    }catch(e){
     // print('ERROR Is ${e.toString()}');
      SnackBar(content: Text('ERROR Is ${e.toString()}'));
    }
  }
}