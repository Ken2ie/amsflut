import 'dart:convert';
import 'dart:ffi';

import 'package:centralamss/api_services/getUserInfo.dart';
import 'package:centralamss/api_services/timetableModel.dart';
import 'package:centralamss/dashboard/homeComp/lectures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import  'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todays extends StatefulWidget {
  const Todays({super.key});

  @override
  State<Todays> createState() => _TodaysState();
}




// Date and Time for timetable
var dt = DateTime.now();
String datetime = DateTime.now().toString();
String day = DateFormat('EEEEE').format(dt);
// String dy = dt.toString();

// var day = cdate.toString();

// class StudentInfoService {
   
// }

String tdata = DateFormat("hh:mm:ss a").format(DateTime.now());

class _TodaysState extends State<Todays> {

  
  @override
  Widget build(BuildContext context) {

  // List<Review> time = 
// print(day);
// print(tdata);


    return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Flex(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    direction: Axis.horizontal,
                    children: [
                      // SizedBox(width: 20,),
                      
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 170,
                        child: TimetableScreen()),
                      
                      // SizedBox(width: 20,),
                    ],
                    ),
                );
  }
}