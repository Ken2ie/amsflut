import 'dart:convert';
import 'dart:ffi';

import 'package:centralamss/api_services/getUserInfo.dart';
import 'package:centralamss/components/header.dart';
import 'package:centralamss/components/searchbutton.dart';
import 'package:centralamss/dashboard/homeComp/summary.dart';
import 'package:centralamss/dashboard/homeComp/todaysLectures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/responsive.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}



// Date and Time for timetable

var dt = DateTime.now();
String datetime = DateTime.now().toString();
String day = DateFormat('EEEEE').format(dt);

class _HomeState extends State<Home> {


Future addStringToSF() async {
  SharedPreferences user = await SharedPreferences.getInstance();
  String? stringValue = user.getString('userID');
  print(stringValue);
  Response response = await get(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/records/' + stringValue.toString()),
  );
  var data = jsonDecode(response.body.toString());
  print(data);

  /* Student's First Name */
  var userFirstName = data['firstName'];
  print(userFirstName);
  // return stringValue;
}

@override
  void initState() {
    super.initState();
    DateTime.now();
   }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LiquidPullToRefresh(
        onRefresh: StudentInfoService.getUserInfo,
        animSpeedFactor: 1,
        color: const Color.fromARGB(255, 255, 157, 157),
        backgroundColor: Colors.red[900],
        showChildOpacityTransition: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            child: SingleChildScrollView(
              child: Flex(
                 direction: Axis.vertical,
                 children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: 
                    Header()
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: 
                    Search(),
                  ),
                  SizedBox(height: 30,),
      
                  // Main Activity
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text( day+"'s Lectures",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700
                      ),)]),
                  ),
                  SizedBox(height: 20,),
                  Todays(),
                  Column(
                    children: [
                      SizedBox(height: 50,),
                      Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Summary Attendance Analysis",
                        style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700
                      ),
                      ),
                      ]
                      ),
                  ),
                     Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: 
                         Summary()
                         ),
                         SizedBox(height: 70,)
                    ],
                  ),
                 ],
                 ),
            ),
          )
        ),
      ),
    );
  }
}
