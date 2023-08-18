import 'dart:convert';

import 'package:centralamss/api_services/getUserInfo.dart';
import 'package:centralamss/api_services/model_class.dart';
import 'package:centralamss/components/searchbutton.dart';
import 'package:centralamss/dashboard/tabs/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/responsive.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Greetings'),
                   FutureBuilder<UserModel>(
            future: StudentInfoService.getUserInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.firstName + " " + snapshot.data!.lastName, 
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700
                ),);
              } 

              // By default, show a loading spinner.
              return  Text(
                'To you...',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700
                ),
              );
            },
          ),
                 ]
               ),
               InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: (){
                  Navigator.push(
                      context,
                     MaterialPageRoute(builder: (context) =>  Settings()),
                    );
                },
                 child: Container(
                   width: 50,
                   height: 50,
                   decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)
                   ),
                   child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                     child: FutureBuilder<UserModel>(
            future: StudentInfoService.getUserInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.profilePicture != '' && !snapshot.hasError) {
                return Image.network("https://centralattendance.fly.dev/api/files/students/" + snapshot.data!.id + "/" + snapshot.data!.profilePicture,
                fit: BoxFit.cover,
                );
              } else if (snapshot.hasError) {
                return 
                SvgPicture.asset('assets/svg/usercircle.svg',
                color: Colors.white,);
              }

              // By default, show a loading spinner.
              return Container( 
                child: SvgPicture.asset('assets/svg/usercircle.svg',
              // height: 2,
              // width: 2,
              color: Colors.white,
              )
              );
            },
          ),
                     ),
                   ),
                 ),
             ],
           ),
    );
  }
}