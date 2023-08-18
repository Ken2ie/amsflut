import 'package:centralamss/dashboard/dashboard.dart';
import 'package:centralamss/login/forgot.dart';
import 'package:centralamss/login/login.dart';
import 'package:centralamss/login/register.dart';
import 'package:centralamss/login/registerSecond.dart';
import 'package:centralamss/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Poppins'),
    debugShowCheckedModeBanner: false,
    routes: {
      // SplashScreen
      "/": (context) => const Splash(),
      // "/intro": (context) => Intro(),

      // Sign, Signup, Forgot Password
      "/login": (context) => const Login(),
      "/registerSecond": (context) => const RegisterSecond(),
      "/forgot": (context) => const Forgot(),

      // Dashboard
      "/navigator": (context) => const Navigator(),
      "/dashboard": (context) => const Dashboard(),
    },
  ));
}
