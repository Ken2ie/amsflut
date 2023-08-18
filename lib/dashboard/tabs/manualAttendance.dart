import 'dart:convert';

import 'package:centralamss/api_services/students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManualAttendance extends StatefulWidget {
  const ManualAttendance({super.key});

  @override
  State<ManualAttendance> createState() => _ManualAttendanceState();
}

class _ManualAttendanceState extends State<ManualAttendance> {

   List<student> timetableItems = [];

  @override
  void initState() {
    super.initState();
    fetchTimetableData();
  }

  Future<void> fetchTimetableData() async {

    SharedPreferences user = await SharedPreferences.getInstance();
    dynamic userProgram = user.getString('studentProgram');
    SharedPreferences usere = await SharedPreferences.getInstance();
    dynamic studentYear = usere.getString('studentYear');


    final url = Uri.parse(
        "https://centralattendance.fly.dev/api/collections/students/records?filter=(program='${userProgram}')");

    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        final items = jsonData['items'] as List<dynamic>;

        var filteredProgram;
        filteredProgram = items.where((year) => year["year"] == '100');
        setState(() {
          timetableItems = filteredProgram
              .map<student>((item) => student.fromJson(item))
              .toList();
        });
        print(filteredProgram + ' iohbiu');

      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  bool marked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Attendance',
        style: TextStyle(
          fontSize: 18
        ),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            fetchTimetableData();
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView.builder(
        itemCount: timetableItems.length,
        itemBuilder: (context, index) {
          final student item = timetableItems[index];
          return Container(
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              onTap: (){},
              title: Text(item.username),
              subtitle: Text(item.firstName + " " + item.lastName),
              trailing:
                  IconButton(
                    selectedIcon: Icon(Icons.check, color: Colors.green,),
                    onPressed: (){
                    marked = true;
                  }, icon: Icon(Icons.check),
                    isSelected: marked,
                  )
            )
          );
        }
      )
    );
  }
}