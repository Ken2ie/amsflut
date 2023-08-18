import 'package:centralamss/api_services/getUserInfo.dart';
import 'package:centralamss/config/responsive.dart';
import 'package:centralamss/dashboard/homeComp/todaysLectures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_services/timetableModel.dart';

class TimetableScreen extends StatefulWidget {
  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> with SingleTickerProviderStateMixin {



  List<TimetableItem> timetableItems = [];

  @override
  void initState() {
    super.initState();
    fetchTimetableData();
    _controller = AnimationController(vsync: this,
    duration: Duration(seconds: 3));
  }

// Lottie Animation Controller
late final AnimationController _controller;

    // @override
    // void dispose(){
    //   // super.dispose();
    //   // _controller.dispo+se();
    // }


// Api Request for current Day lecture(s)
  Future fetchTimetableData() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    dynamic userProgram = user.getString('studentProgram');
    SharedPreferences usere = await SharedPreferences.getInstance();
    dynamic studentYear = usere.getString('studentYear');

    // String studentYear = userYear.toString();
    final url = Uri.parse(
        'https://centralattendance.fly.dev/api/collections/timetable/records?filter(Program="$userProgram")');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final items = jsonData['items'];


      /* Trying */

      var dt = DateTime.now();
      String datetime = DateTime.now().toString();
      String today = DateFormat('EEEEE').format(dt);
       
      var filteredProgram;
      filteredProgram = items.where((year) => year["Year"] == studentYear);
      var filteredDay = filteredProgram.where((day) => day["Day"] == today);
      var filteredSemester = filteredDay.where((semester) => semester["Semester"] == "Semester 2");
      // print(filteredDay);

      /*  End Trying */


        setState(() {
          timetableItems = filteredSemester
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
        });

        num totalLectures = 0;
         totalLectures += filteredDay.length;
      // print(totalLectures);


         return totalLectures;

      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  bool noLectures = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      FutureBuilder(
        future: fetchTimetableData(),
        builder: (context, snapshot) {
          if(snapshot.data == 0){
            noLectures = true;
            _controller.forward();
           return Center(
            child: Lottie.asset('assets/nolecturess.json',
            // controller: _controller
            width: 300
            ),
           );
          }
            noLectures = false;
            _controller.reverse();
          return   
          ListView.builder(
        scrollDirection: Axis.horizontal,
        
        itemCount: timetableItems.length,
        itemBuilder: (context, index) {
          final TimetableItem item = timetableItems[index];
          return 
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[ 
              SizedBox(width: 20,),
              Container(
                margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  height: MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20), 
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(item.code,
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 109, 109, 109),
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600
                                    ),
                                    ),
                                    if(Responsive.isMobile(context))
                                    SizedBox(height: 8),
                                    Text(item.course.characters.take(18).toString() + '...', 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                    ),),
                                        ],
                                      ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(30)
                                              ),
                                              child: ClipOval(
                                                child: Image.asset('assets/usersLect.png',
                                                width: 20,
                                                height: 20,
                                                // color: Colors.grey,
                                                fit: BoxFit.cover,),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Lecturer', 
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white
                                                ),),
                                                Text('Unkown', 
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white
                                                ),),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('Time', 
                                            style: TextStyle(
                                              color: const Color.fromARGB(255, 156, 156, 156),
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600
                                            ),),
                                            Text(item.startTime + ' - ' + item.endTime, 
                                            style: TextStyle(
                                              color: const Color.fromARGB(255, 156, 156, 156),
                                              fontSize: 8
                                            ),),
                                          ],
                                        )
                                      ],
                                      )
                                    ]
                                  )
            
                              ),
                              // SizedBox(width: 20,)
            ]
          );
        },
      );
        },
      )
    );
  }
}