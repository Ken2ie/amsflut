import 'dart:convert';
import 'dart:io';
import  'package:intl/intl.dart';

import 'package:centralamss/api_services/model_class.dart';
import 'package:centralamss/api_services/timetableModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentInfoService {

  static Future<UserModel> getUserInfo() async {
    SharedPreferences user = await SharedPreferences.getInstance();
  dynamic stringValue = user.getString('userID');
  print("sdkvj" +stringValue);

  // Get User data from api
  Response response = await get(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/records/' + stringValue),
  );
  var data = jsonDecode(response.body.toString());
  // print(data);
   if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  }

}
