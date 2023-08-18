import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_services/timetableModel.dart';

class Friday extends StatefulWidget {
  const Friday({super.key});

  @override
  State<Friday> createState() => _FridayState();
}

class _FridayState extends State<Friday> {

 List<TimetableItem> timetableItems = [];

  // @override
  // void initState() {
  //   super.initState();
  //   // fetchTimetableData();
  // }

  Future fetchTimetableData() async {
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

      var filteredProgram;
      filteredProgram = items.where((year) => year["Year"] == studentYear);
      var filteredDay = filteredProgram.where((day) => day["Day"] == "Friday");
      // print(filteredDay);

      /*  End Trying */


        setState(() {
          timetableItems = filteredDay
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


  @override
  Widget build(BuildContext context) {
    return  
                FutureBuilder(
                  future: fetchTimetableData(),
                  builder: (context, snapshot) {
                  if(snapshot.data == 0){
                   return  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(255, 60, 60, 60)
                                    ),
                                    width: 90,
                                    height: 30,
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Friday',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 146, 146, 146),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12
                                        ),
                                        ),
                                      ],
                                    ),
                                  );
                  }
                  if(!snapshot.hasData){
                    return  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 63, 63, 63)
                                    ),
                                    width: 90,
                                    height: 30,
                                    // child:  Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //   ],
                                    // ),
                                  );
                  }
                  return
                    Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 231, 231, 231)
                                    ),
                                    width: 90,
                                    height: 30,
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Friday',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12
                                        ),
                                        ),
                                        Container(
                                          width: 22,
                                          height: 22,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 65, 105, 225),
                                            borderRadius: BorderRadius.circular(7)
                                          ),
                                          child: Center(child: Text(snapshot.data.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            // fontSize: 9 
                                          ),)),
                                        ),
                                      ],
                                    ),
                                  );
                  },
                );

  }
}