import 'package:centralamss/dashboard/homeComp/lectures.dart';
import 'package:centralamss/dashboard/tabs/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../dashboard/tabs/analytics.dart';
import '../dashboard/tabs/home.dart';
import '../dashboard/tabs/lectures.dart';
// import '../dashboard/tabs/mail.dart';
import '../dashboard/tabs/Settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

// Current Index Var
int _selectedIndex = 0;

// List of Screens to navigate through
final List<Widget> screens = [
  const Home(),
  const Lectures(),
  // const Analytics(),
  // const chats(),
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
                      selectedIcon: SvgPicture.asset('assets/svg/home.svg',
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
                    // NavigationDestination(       
                    //   icon: SvgPicture.asset('assets/svg/mail.svg',
                    //   color: Color.fromARGB(111, 255, 255, 255)),
                    //   selectedIcon: SvgPicture.asset('assets/svg/mail.svg',
                    //   color: Colors.white,),
                    //   label: 'Mail'),
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