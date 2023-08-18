import 'dart:io';

import 'package:centralamss/api_services/getUserInfo.dart';
import 'package:centralamss/components/navigator.dart';
import 'package:centralamss/components/repsNavigator.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/sockets/src/sockets_io.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return  
      Scaffold(
        resizeToAvoidBottomInset: false,
        // drawer: Drawer(),
        // drawerEnableOpenDragGesture: true,
        // appBar: AppBar(
        //   elevation: 0,
        //   title: Text('Home'),
        // ),
        body: FutureBuilder(
          future: StudentInfoService.getUserInfo(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectivityResult.none){
              return Scaffold(
                body: LiquidPullToRefresh(
                  onRefresh: StudentInfoService.getUserInfo,
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height / 3,),
                            Container(
                              width: 120,
                              child: Lottie.asset('assets/offline.json'),
                              ),
                            SizedBox(height: 30,),
                            Text('You are currently offline \n Please scroll down to try again.', 
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 129, 129, 129)
                            ),),
                            ]
                            )
                            ),
                  ),
                ),
              );
            }else{
              if(snapshot.data?.rep == true){
                return NavigationReps();
              }
              else if(snapshot.data?.rep == false){
                return Navigation();
              }
            return Navigation();
            }
          }
          ),
      );
  }
}