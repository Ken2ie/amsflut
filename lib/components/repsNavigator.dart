import 'package:centralamss/dashboard/homeComp/lectures.dart';
import 'package:centralamss/dashboard/tabs/example.dart';
import 'package:centralamss/dashboard/tabs/manualAttendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../dashboard/tabs/analytics.dart';
import '../dashboard/tabs/home.dart';
import '../dashboard/tabs/lectures.dart';
// import '../dashboard/tabs/mail.dart';
import '../dashboard/tabs/Settings.dart';

class NavigationReps extends StatefulWidget {
  const NavigationReps({super.key});

  @override
  State<NavigationReps> createState() => _NavigationRepsState();
}

class _NavigationRepsState extends State<NavigationReps> {

// Current Index Var
int _selectedIndex = 0;

// List of Screens to navigate through
final List<Widget> screens = [
  const Home(),
  const Lectures(),
  // const Analytics(),
  const ManualAttendance(),
  // const Mail(),
  const Settings()
];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
           screens[_selectedIndex],
      // bottomNavigationBar: 
       Align(
        alignment: Alignment.bottomCenter,
         child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Container(
              decoration: 
              BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.symmetric(horizontal: 20,),
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  backgroundColor: Colors.white,
                  height: 60,
                  elevation: 0,
                  indicatorColor: Colors.black,
                  labelTextStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500)
                  )
                ),
                child:  NavigationBar(
                  selectedIndex: _selectedIndex,
                  labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                  // labelBehavior: ,
                  onDestinationSelected: (_selectedIndex) => 
                    setState(() => this._selectedIndex = _selectedIndex),
                  //  currentIndex: _selectedIndex,
                  backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                  destinations: [
                    NavigationDestination(
                      icon: SvgPicture.asset('assets/svg/home.svg',
                      color: const Color.fromARGB(111, 255, 255, 255),),
                      selectedIcon: SvgPicture.asset('assets/svg/homeA.svg',
                      color: Colors.white,),
                      label: 'Home'),
                    NavigationDestination(
                      icon: SvgPicture.asset('assets/svg/lectures.svg',
                      color: const Color.fromARGB(111, 255, 255, 255)),
                      selectedIcon: SvgPicture.asset('assets/svg/lectures.svg',
                      color: Colors.white,),
                      label: 'Lectures'),
                    // NavigationDestination(
                    //   icon: SvgPicture.asset('assets/svg/analytics.svg',
                    //   color: Color.fromARGB(111, 255, 255, 255)),
                    //   selectedIcon: SvgPicture.asset('assets/svg/analytics.svg',
                    //   color: Colors.white,),
                    //   label: 'Analytics'),
                    NavigationDestination(       
                      icon: SvgPicture.asset('assets/svg/check.svg',
                      color: Color.fromARGB(111, 255, 255, 255)),
                      selectedIcon: SvgPicture.asset('assets/svg/checkA.svg',
                      color: Colors.white,),
                      label: 'MA'),
                    NavigationDestination(
                      icon: SvgPicture.asset('assets/svg/settings.svg',
                      color: Color.fromARGB(111, 255, 255, 255)),
                      selectedIcon: SvgPicture.asset('assets/svg/settings.svg',
                      color: Colors.white,),
                      label: 'Settings'),
                  ],
                  ),
              ),
            ),
          ),
             ),
       )
        ],
      ),
    );

  }
}