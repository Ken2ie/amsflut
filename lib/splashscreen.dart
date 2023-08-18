import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

@override
void initState(){
  // TODO: implement initState
  startTimer();
  check();
  super.initState();
}
  Timer startTimer() {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

bool userLoggedin = false;

check() async{
    SharedPreferences user = await SharedPreferences.getInstance();
  dynamic userlogged = user.getString('userID');
  print(userlogged);
  
}

route() async{
    SharedPreferences user = await SharedPreferences.getInstance();
  dynamic userlogged = user.getString('userID');
  print(userlogged);

  if(userlogged != null){
    Navigator.of(context).pushReplacementNamed('/dashboard');
  } else if(userlogged == null){
    Navigator.of(context).pushReplacementNamed('/login');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body : Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/cu-logo.png'),
                SizedBox(height: 30,),
                Container(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: Colors.red[900],
                    strokeWidth: 2,
                  ),
                )
              ],
            ),
          ),
     )
    );
  }
  
}