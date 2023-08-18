import 'dart:convert';

import 'package:centralamss/api_services/d.dart';
import 'package:centralamss/components/header.dart';
import 'package:centralamss/components/searchbutton.dart';
import 'package:centralamss/dashboard/homeComp/todaysLectures.dart';
import 'package:centralamss/dashboard/lecture%20Component/Friday.dart';
import 'package:centralamss/dashboard/lecture%20Component/Satuday.dart';
import 'package:centralamss/dashboard/lecture%20Component/Sunday.dart';
import 'package:centralamss/dashboard/lecture%20Component/Thursday.dart';
import 'package:centralamss/dashboard/lecture%20Component/Tuesday.dart';
import 'package:centralamss/dashboard/lecture%20Component/Wednesday.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_services/timetableModel.dart';
import '../lecture Component/Monday.dart';

class Lectures extends StatefulWidget {
  const Lectures({super.key});

  @override
  State<Lectures> createState() => _LecturesState();
}


// Sunday

bool sunday = false;
bool monday = false;
bool tuesday = false;
bool wednesday = false;
bool thursday = false;
bool friday = false;
bool saturday = false;
bool whiteSpace = true;


class _LecturesState extends State<Lectures> {

 List<TimetableItem> timetableItems = [];

  @override
  void initState() {
    super.initState();
    fetchTimetableDataSunday();
    fetchTimetableDataMonday();
  }

  Future fetchTimetableDataSunday() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    dynamic userProgram = user.getString('studentProgram');
    SharedPreferences usere = await SharedPreferences.getInstance();
    dynamic studentYear = usere.getString('studentYear');

    // String studentYear = userYear.toString();
    final url = Uri.parse(
        'https://centralattendance.fly.dev/api/collections/timetable/records?filter(Program="$userProgram")');

    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final items = jsonData['items'];


      /* Trying */

      var dt = DateTime.now();
      String datetime = DateTime.now().toString();
      String today = DateFormat('EEEEE').format(dt);
       
      var filteredProgram;
      filteredProgram = items.where((year) => year["Year"] == studentYear);
      var filteredDay = filteredProgram.where((day) => day["Day"] == "Sunday");
      var filteredSemester = filteredDay.where((semester) => semester["Semester"] == "Semester 2");
      // print(filteredDay);

      /*  End Trying */


        // setState(() {
          timetableItems = filteredSemester
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
        // });

        num totalLecturesSu = 0;
         totalLecturesSu += filteredDay.length;
      // print(totalLectures);


         return totalLecturesSu;

      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

// Monday

  Future fetchTimetableDataMonday() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    dynamic userProgram = user.getString('studentProgram');
    SharedPreferences usere = await SharedPreferences.getInstance();
    dynamic studentYear = usere.getString('studentYear');

    // String studentYear = userYear.toString();
    final url = Uri.parse(
        'https://centralattendance.fly.dev/api/collections/timetable/records?filter(Program="$userProgram")');

    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final items = jsonData['items'];


      /* Trying */

      var dt = DateTime.now();
      String datetime = DateTime.now().toString();
      String today = DateFormat('EEEEE').format(dt);
       
      var filteredProgram;
      filteredProgram = items.where((year) => year["Year"] == studentYear);
      var filteredDay = filteredProgram.where((day) => day["Day"] == "Monday");
      var filteredSemester = filteredDay.where((semester) => semester["Semester"] == "Semester 2");
      // print(filteredDay);

      /*  End Trying */


        // setState(() {
          timetableItems = filteredSemester
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
        // });

        num totalLecturesMo = 0;
         totalLecturesMo += filteredDay.length;
      // print(totalLectures);


         return totalLecturesMo;

      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

// Tuesday

  Future fetchTimetableDataTuesday() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    dynamic userProgram = user.getString('studentProgram');
    SharedPreferences usere = await SharedPreferences.getInstance();
    dynamic studentYear = usere.getString('studentYear');

    // String studentYear = userYear.toString();
    final url = Uri.parse(
        'https://centralattendance.fly.dev/api/collections/timetable/records?filter(Program="$userProgram")');

    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final items = jsonData['items'];


      /* Trying */

      var dt = DateTime.now();
      String datetime = DateTime.now().toString();
      String today = DateFormat('EEEEE').format(dt);
       
      var filteredProgram;
      filteredProgram = items.where((year) => year["Year"] == studentYear);
      var filteredDay = filteredProgram.where((day) => day["Day"] == "Tuesday");
      var filteredSemester = filteredDay.where((semester) => semester["Semester"] == "Semester 2");
      // print(filteredDay);

      /*  End Trying */


        // setState(() {
          timetableItems = filteredSemester
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
        // });

        num totalLecturesTu = 0;
         totalLecturesTu += filteredDay.length;
      // print(totalLectures);


         return totalLecturesTu;

      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
// Tuesday

  Future fetchTimetableDataWednesday() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    dynamic userProgram = user.getString('studentProgram');
    SharedPreferences usere = await SharedPreferences.getInstance();
    dynamic studentYear = usere.getString('studentYear');

    // String studentYear = userYear.toString();
    final url = Uri.parse(
        'https://centralattendance.fly.dev/api/collections/timetable/records?filter(Program="$userProgram")');

    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final items = jsonData['items'];


      /* Trying */

      var dt = DateTime.now();
      String datetime = DateTime.now().toString();
      String today = DateFormat('EEEEE').format(dt);
       
      var filteredProgram;
      filteredProgram = items.where((year) => year["Year"] == studentYear);
      var filteredDay = filteredProgram.where((day) => day["Day"] == "Wednesday");
      var filteredSemester = filteredDay.where((semester) => semester["Semester"] == "Semester 2");
      // print(filteredDay);

      /*  End Trying */


        // setState(() {
          timetableItems = filteredSemester
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
        // });

        num totalLecturesWe = 0;
         totalLecturesWe += filteredDay.length;
      // print(totalLectures);


         return totalLecturesWe;

      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

// Thursday

  Future fetchTimetableDataThursday() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    dynamic userProgram = user.getString('studentProgram');
    SharedPreferences usere = await SharedPreferences.getInstance();
    dynamic studentYear = usere.getString('studentYear');

    // String studentYear = userYear.toString();
    final url = Uri.parse(
        'https://centralattendance.fly.dev/api/collections/timetable/records?filter(Program="$userProgram")');

    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final items = jsonData['items'];


      /* Trying */

      var dt = DateTime.now();
      String datetime = DateTime.now().toString();
      String today = DateFormat('EEEEE').format(dt);
       
      var filteredProgram;
      filteredProgram = items.where((year) => year["Year"] == studentYear);
      var filteredDay = filteredProgram.where((day) => day["Day"] == "Thursday");
      var filteredSemester = filteredDay.where((semester) => semester["Semester"] == "Semester 2");
      // print(filteredDay);

      /*  End Trying */


        // setState(() {
          timetableItems = filteredSemester
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
        // });

        num totalLecturesTh = 0;
         totalLecturesTh += filteredDay.length;
      // print(totalLectures);


         return totalLecturesTh;

      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }


// Friday

  Future fetchTimetableDataFriday() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    dynamic userProgram = user.getString('studentProgram');
    SharedPreferences usere = await SharedPreferences.getInstance();
    dynamic studentYear = usere.getString('studentYear');

    // String studentYear = userYear.toString();
    final url = Uri.parse(
        'https://centralattendance.fly.dev/api/collections/timetable/records?filter(Program="$userProgram")');

    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final items = jsonData['items'];


      /* Trying */

      var dt = DateTime.now();
      String datetime = DateTime.now().toString();
      String today = DateFormat('EEEEE').format(dt);
       
      var filteredProgram;
      filteredProgram = items.where((year) => year["Year"] == studentYear);
      var filteredDay = filteredProgram.where((day) => day["Day"] == "Friday");
      var filteredSemester = filteredDay.where((semester) => semester["Semester"] == "Semester 2");
      // print(filteredDay);

      /*  End Trying */


        // setState(() {
          timetableItems = filteredSemester
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
        // });

        num totalLecturesFr = 0;
         totalLecturesFr += filteredDay.length;
      // print(totalLectures);


         return totalLecturesFr;

      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

// Friday

  Future fetchTimetableDataSaturday() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    dynamic userProgram = user.getString('studentProgram');
    SharedPreferences usere = await SharedPreferences.getInstance();
    dynamic studentYear = usere.getString('studentYear');

    // String studentYear = userYear.toString();
    final url = Uri.parse(
        'https://centralattendance.fly.dev/api/collections/timetable/records?filter(Program="$userProgram")');

    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final items = jsonData['items'];


      /* Trying */

      var dt = DateTime.now();
      String datetime = DateTime.now().toString();
      String today = DateFormat('EEEEE').format(dt);
       
      var filteredProgram;
      filteredProgram = items.where((year) => year["Year"] == studentYear);
      var filteredDay = filteredProgram.where((day) => day["Day"] == "Saturday");
      var filteredSemester = filteredDay.where((semester) => semester["Semester"] == "Semester 2");
      // print(filteredDay);

      /*  End Trying */


        // setState(() {
          timetableItems = filteredSemester
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
        // });

        num totalLecturesSa = 0;
         totalLecturesSa += filteredDay.length;
      // print(totalLectures);


         return totalLecturesSa;

      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LiquidPullToRefresh(
            color: const Color.fromARGB(255, 255, 157, 157),
        backgroundColor: Colors.red[900],
          onRefresh: fetchTimetableDataFriday,
          animSpeedFactor: 1,
          showChildOpacityTransition: false,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                SizedBox(height: 20,),
                // Search(),
                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Flex(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.vertical,
                      children: [
                        Text('Timetable', 
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width,
                          child: 
                          // SingleChildScrollView(
                            // scrollDirection: Axis.horizontal,
                            // child: Flex(
                              // direction: Axis.horizontal,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // children: [
                                Center(
                                  child: Wrap(
                                    runSpacing: 10,
                                    spacing: 10,
                                    runAlignment: WrapAlignment.start,
                                    direction: Axis.horizontal,
                                    children: [
                                      // SizedBox(width: MediaQuery.of(context).size.width / 4.4,),
                                //  Sunday
                                 
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                         sunday = true;
                                         monday = false;
                                         tuesday = false;
                                         wednesday = false;
                                         thursday = false;
                                         friday = false;
                                         saturday = false;
                                         whiteSpace = false;
                                      });
                                    },
                                    child: Sunday()
                                    ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                         sunday = false;
                                         monday = true;
                                         tuesday = false;
                                         wednesday = false;
                                         thursday = false;
                                         friday = false;
                                         saturday = false;
                                         whiteSpace = false;
                                      });
                                    },
                                    child: Monday()
                                    ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                         sunday = false;
                                         monday = false;
                                         tuesday = true;
                                         wednesday = false;
                                         thursday = false;
                                         friday = false;
                                         saturday = false;
                                         whiteSpace = false;
                                      });
                                    },
                                    child: Tuesday()
                                    ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                         sunday = false;
                                         monday = false;
                                         tuesday = false;
                                         wednesday = true;
                                         thursday = false;
                                         friday = false;
                                         saturday = false;
                                         whiteSpace = false;
                                      });
                                    },
                                    child: Wednesday()
                                    ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                         sunday = false;
                                         monday = false;
                                         tuesday = false;
                                         wednesday = false;
                                         thursday = true;
                                         friday = false;
                                         saturday = false;
                                         whiteSpace = false;
                                      });
                                    },
                                    child: Thursday()
                                    ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                         sunday = false;
                                         monday = false;
                                         tuesday = false;
                                         wednesday = false;
                                         thursday = false;
                                         friday = true;
                                         saturday = false;
                                         whiteSpace = false;
        
                                      });
                                    },
                                    child: Friday()
                                    ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                         sunday = false;
                                         monday = false;
                                         tuesday = false;
                                         wednesday = false;
                                         thursday = false;
                                         friday = false;
                                         saturday = true;
                                         whiteSpace = false;
                                      });
                                    },
                                    child: Saturday()
                                    ),
                                    ]
                                  ),
                                ),
                              // ],
                            // ),
                          // ),
                        ),
                        SizedBox(height: 50,),
        
                       Flex(
                        direction: Axis.vertical,
                         children: [
                           //  For Sunday
        
        
                        
                        if(sunday == true)
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            
                          ),
                          child: 
                              FutureBuilder(
                                future: fetchTimetableDataSunday(),
                                builder: ((context, snapshot) {
                                  if(snapshot.data == 0){
                                    return Text('');
                                  }
                                  return 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Lectures on Sunday'),
                                      Text('Total: ' + snapshot.data.toString()),
                                    ],
                                  );
                                }))
                        ),
        
                        if(sunday == true)
                        
                        Container(
                          height: 270,
                          // child: Visibility(
                          //  visible: sunday,
                           child: 
                           FutureBuilder(
                            future: fetchTimetableDataSunday(),
                            builder: (context, snapshot) {
                              if(snapshot.data == 0){
                                return Container(
                                  child: Center(
                                   child: Text('No Lectures on Sunday')
                                  ),
                                );
                              }
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                           
                                itemCount: timetableItems.length,
                                itemBuilder: (context, index) {
                                final TimetableItem item = timetableItems[index];
                        
                                   return  
                                   Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(255, 232, 232, 232)
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: 
                                      [
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children: 
                                        [
                                          Text(item.course.characters.take(25).toString() + '...', 
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700
                                          ),),
                                          SizedBox(height: 2,),
                                          Row(
                                            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Lecture's Name", 
                                             style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400
                                            )
                                            ),
                                            SizedBox(width: 10,),
                                            Text(item.startTime + ' - ' + item.endTime, 
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                            ),)
                                            ]
                                          )
                                          ]
                                          ),
                                          InkWell(
                                            onTap: (){},
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(15))
                                              ),
                                          )
                                      ]
                                      )
                                    );
                                }
                              );
                            },
                           )
                          //  ),
                        ),
        
                        if(monday == true)
                        
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: FutureBuilder(
                                  future: fetchTimetableDataMonday(),
                                  builder: ((context, snapshot) {
                                   if(snapshot.data == 0){
                                    return Text('');
                                  }
                                   return 
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Lectures on Monday', 
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700
                                        )),
                                        Text('Total: ' + snapshot.data.toString()),
                                      ],
                                    );
                                   
                                  })),
                              ),
                        if(tuesday == true)
                        
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: FutureBuilder(
                                  future: fetchTimetableDataTuesday(),
                                  builder: ((context, snapshot) {
                                   if(snapshot.data == 0){
                                    return Text('');
                                  }
                                   return 
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Lectures on Tuesday', 
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700
                                        )),
                                        Text('Total: ' + snapshot.data.toString()),
                                      ],
                                    );
                                   
                                  })),
                              ),
                        if(wednesday == true)
                        
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: FutureBuilder(
                                  future: fetchTimetableDataWednesday(),
                                  builder: ((context, snapshot) {
                                   if(snapshot.data == 0){
                                    return Text('');
                                  }
                                   return 
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Lectures on Wednesay', 
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700
                                        )),
                                        Text('Total: ' + snapshot.data.toString()),
                                      ],
                                    );
                                   
                                  })),
                              ),
                        if(thursday == true)
                        
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: FutureBuilder(
                                  future: fetchTimetableDataThursday(),
                                  builder: ((context, snapshot) {
                                   if(snapshot.data == 0){
                                    return Text('');
                                  }
                                   return 
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Lectures on Thursday', 
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700
                                        )),
                                        Text('Total: ' + snapshot.data.toString()),
                                      ],
                                    );
                                   
                                  })),
                              ),
                        if(friday == true)
                        
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: FutureBuilder(
                                  future: fetchTimetableDataFriday(),
                                  builder: ((context, snapshot) {
                                   if(snapshot.data == 0){
                                    return Text('');
                                  }
                                   return 
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Lectures on Friday', 
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700
                                        )),
                                        Text('Total: ' + snapshot.data.toString()),
                                      ],
                                    );
                                   
                                  })),
                              ),
                        if(saturday == true)
                        
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: FutureBuilder(
                                  future: fetchTimetableDataSaturday(),
                                  builder: ((context, snapshot) {
                                   if(snapshot.data == 0){
                                    return Text('');
                                  }
                                   return 
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Lectures on Saturday', 
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700
                                        )),
                                        Text('Total: ' + snapshot.data.toString(),
                                        style: TextStyle(
                                          fontSize: 10
                                        ),),
                                      ],
                                    );
                                   
                                  })),
                              ),
        
                        if(monday == true)
                        // For Monday
                        Container(
                          height: 270,
                          margin: EdgeInsets.only(bottom: 0),
                          // child: Visibility(
                          //  visible: monday,
                           child: 
                           FutureBuilder(
                            future: fetchTimetableDataMonday(),
                            builder: (context, snapshot) {
                              if(snapshot.data == 0){
                                return Container(
                                  child: Center(
                                   child: Text('No Lectures on Monday')
                                  ),
                                );
                              }
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                           
                                itemCount: timetableItems.length,
                                itemBuilder: (context, index) {
                                final TimetableItem item = timetableItems[index];
        
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(
                                    child: Container
                                    (
                                      margin: EdgeInsets.only(top: 20),
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        color: Colors.red[700],
                                        strokeWidth: 2,
                                      )),
                                  );
                                }
                        
                                   return  
                                   Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(255, 232, 232, 232)
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: 
                                      [
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children: 
                                        [
                                          Text(item.course.characters.take(22).toString() + '...', 
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w800
                                          ),),
                                          SizedBox(height: 2,),
                                          Row(
                                            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Lecture's Name", 
                                             style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400
                                            )
                                            ),
                                            SizedBox(width: 10,),
                                            Text(item.startTime + ' - ' + item.endTime, 
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600
                                            ),)
                                            ]
                                          )
                                          ]
                                          ),
                                          InkWell(
                                            onTap: (){},
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(15))
                                              ),
                                          )
                                      ]
                                      )
                                    );
                                }
                              );
                            },
                           )
                          //  ),
                        ),
        
                        if(tuesday == true)
        
                        // For Tuesday
                        Container(
                          height: 270,
                          margin: EdgeInsets.only(bottom: 0),
                          // child: Visibility(
                          //  visible: tuesday,
                           child: 
                           FutureBuilder(
                            future: fetchTimetableDataTuesday(),
                            builder: (context, snapshot) {
                              if(snapshot.data == 0){
                                return Container(
                                  child: Center(
                                   child: Text('No Lectures on Tuesday')
                                  ),
                                );
                              }
        
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                           
                                itemCount: timetableItems.length,
                                itemBuilder: (context, index) {
                                final TimetableItem item = timetableItems[index];
        
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(
                                    child: Container
                                    (
                                      margin: EdgeInsets.only(top: 20),
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        color: Colors.red[700],
                                        strokeWidth: 2,
                                      )),
                                  );
                                }
                        
                                   return  
                                   Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(255, 232, 232, 232)
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: 
                                      [
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children: 
                                        [
                                          Text(item.course.characters.take(22).toString() + '...', 
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700
                                          ),),
                                          SizedBox(height: 2,),
                                          Row(
                                            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                            children: [
                                            //   Text("Lecture's Name", 
                                            //  style: TextStyle(
                                            //   fontSize: 10,
                                            //   fontWeight: FontWeight.w400
                                            // )
                                            // ),
                                            SizedBox(width: 10,),
                                            Text(item.startTime + ' - ' + item.endTime, 
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600
                                            ),)
                                            ]
                                          )
                                          ]
                                          ),
                                          InkWell(
                                            onTap: (){},
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(15))
                                              ),
                                          )
                                      ]
                                      )
                                    );
                                }
                              );
                            },
                           )
                          //  ),
                        ),
        
                        if(wednesday == true)
        
                        // For Wednesday
                        Container(
                          height: 270,
                          margin: EdgeInsets.only(bottom: 0),
                          // child: Visibility(
                          //  visible: wednesday,
                           child: 
                           FutureBuilder(
                            future: fetchTimetableDataWednesday(),
                            builder: (context, snapshot) {
                              if(snapshot.data == 0){
                                return Container(
                                  child: Center(
                                   child: Text('No Lectures on Wednesday')
                                  ),
                                );
                              }
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                           
                                itemCount: timetableItems.length,
                                itemBuilder: (context, index) {
                                final TimetableItem item = timetableItems[index];
        
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(
                                    child: Container
                                    (
                                      margin: EdgeInsets.only(top: 20),
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        color: Colors.red[700],
                                        strokeWidth: 2,
                                      )),
                                  );
                                }
                        
                                   return  
                                   Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(255, 232, 232, 232)
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: 
                                      [
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children: 
                                        [
                                          Text(item.course.characters.take(22).toString() + '...', 
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700
                                          ),),
                                          SizedBox(height: 2,),
                                          Row(
                                            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Lecture's Name", 
                                             style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400
                                            )
                                            ),
                                            SizedBox(width: 10,),
                                            Text(item.startTime + ' - ' + item.endTime, 
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600
                                            ),)
                                            ]
                                          )
                                          ]
                                          ),
                                          InkWell(
                                            onTap: (){},
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(15))
                                              ),
                                          )
                                      ]
                                      )
                                    );
                                }
                              );
                            },
                           )
                          //  ),
                        ),
        
                        if(thursday == true)
                        // For Thursday
                        Container(
                          height: 270,
                          margin: EdgeInsets.only(bottom: 0),
                          // child: Visibility(
                          //  visible: wednesday,
                           child: 
                           FutureBuilder(
                            future: fetchTimetableDataThursday(),
                            builder: (context, snapshot) {
                              if(snapshot.data == 0){
                                return Container(
                                  child: Center(
                                   child: Text('No Lectures on Thursday')
                                  ),
                                );
                              }
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                           
                                itemCount: timetableItems.length,
                                itemBuilder: (context, index) {
                                
                                final TimetableItem item = timetableItems[index];
        
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(
                                    child: Container
                                    (
                                      margin: EdgeInsets.only(top: 20),
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        color: Colors.red[700],
                                        strokeWidth: 2,
                                      )),
                                  );
                                }
                        
                                   return  
                                   Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(255, 232, 232, 232)
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: 
                                      [
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children: 
                                        [
                                          Text(item.course.characters.take(22).toString() + '...', 
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700
                                          ),),
                                          SizedBox(height: 2,),
                                          Row(
                                            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Lecture's Name", 
                                             style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400
                                            )
                                            ),
                                            SizedBox(width: 10,),
                                            Text(item.startTime + ' - ' + item.endTime, 
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600
                                            ),)
                                            ]
                                          )
                                          ]
                                          ),
                                          InkWell(
                                            onTap: (){},
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(15))
                                              ),
                                          )
                                      ]
                                      )
                                    );
                                }
                              );
                            },
                           )
                          //  ),
                        ),
        
                        if(friday == true)
        
                        // For Friday
                        Container(
                          height: 270,
                          margin: EdgeInsets.only(bottom: 0),
                          // child: Visibility(
                          //  visible: wednesday,
                           child: 
                           FutureBuilder(
                            future: fetchTimetableDataFriday(),
                            builder: (context, snapshot) {
                              if(snapshot.data == 0){
                                return Container(
                                  child: Center(
                                   child: Text('No Lectures on Friday')
                                  ),
                                );
                              }
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                           
                                itemCount: timetableItems.length,
                                itemBuilder: (context, index) {
                                final TimetableItem item = timetableItems[index];
        
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(
                                    child: Container
                                    (
                                      margin: EdgeInsets.only(top: 20),
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        color: Colors.red[700],
                                        strokeWidth: 2,
                                      )),
                                  );
                                }
                        
                                   return  
                                   Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(255, 232, 232, 232)
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: 
                                      [
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children: 
                                        [
                                          Text(item.course.characters.take(22).toString() + '...', 
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700
                                          ),),
                                          SizedBox(height: 2,),
                                          Row(
                                            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Lecture's Name", 
                                             style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400
                                            )
                                            ),
                                            SizedBox(width: 10,),
                                            Text(item.startTime + ' - ' + item.endTime, 
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600
                                            ),)
                                            ]
                                          )
                                          ]
                                          ),
                                          InkWell(
                                            onTap: (){},
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(15))
                                              ),
                                          )
                                      ]
                                      )
                                    );
                                }
                              );
                            },
                           )
                          //  ),
                        ),
        
                        if(saturday == true)
        
                        // For Saturday
                        Container(
                          height: 270,
                          margin: EdgeInsets.only(bottom: 0),
                          // child: Visibility(
                          //  visible: wednesday,
                           child: 
                           FutureBuilder(
                            future: fetchTimetableDataSaturday(),
                            builder: (context, snapshot) {
                              if(snapshot.data == 0){
                                return Container(
                                  child: Center(
                                   child: Text('No Lectures on Saturday')
                                  ),
                                );
                              }
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                           
                                itemCount: timetableItems.length,
                                itemBuilder: (context, index) {
                                final TimetableItem item = timetableItems[index];
        
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(
                                    child: Container
                                    (
                                      margin: EdgeInsets.only(top: 20),
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        color: Colors.red[700],
                                        strokeWidth: 2,
                                      )),
                                  );
                                }
                        
                                   return  
                                   Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(255, 232, 232, 232)
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: 
                                      [
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children: 
                                        [
                                          Text(item.course.characters.take(22).toString() + '...', 
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700
                                          ),),
                                          SizedBox(height: 2,),
                                          Row(
                                            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Lecture's Name", 
                                             style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400
                                            )
                                            ),
                                            SizedBox(width: 10,),
                                            Text(item.startTime + ' - ' + item.endTime, 
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600
                                            ),)
                                            ]
                                          )
                                          ]
                                          ),
                                          InkWell(
                                            onTap: (){},
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(15))
                                              ),
                                          )
                                      ]
                                      )
                                    );
                                }
                              );
                            },
                           )
                          //  ),
                        ),
        
                        if(!sunday && !monday && !tuesday && !wednesday && !thursday && !friday && !saturday)
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 188, 202, 250),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            children: [
                              Text('Tap any of the days in the time table to know what you have within the day.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 17
                          )
                          ),
                          Container(
                            width: 120,
                            child: Lottie.asset('assets/point.json'))
                            ]
                          )
                          )
                         ],
                       )
                       
                      ],
                      ),
                  ),
                )
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}