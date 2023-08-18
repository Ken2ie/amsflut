import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'timetableModel.dart';

class Items extends Equatable {
  Items({
    required this.id,
    required this.course,
    required this.startTime,
    required this.endTime,
    required this.year,
  });
  final String id;
  final String course;
  final String startTime;
  final String endTime;
  final String year;

  factory Items.fromJson(Map<String, dynamic> data) {
    final id = data['id'];
    final course = data['Course'];
    final startTime = data['StartTime'];
    final endTime = data['EndTime'];
    final year = data['Year'];
    
    return Items(
      id: id,
      course: course,
      startTime: startTime,
      endTime: endTime,
      year: year,
 // use an empty list as fallback value
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Course': course,
      'StartTime': startTime,
      'EndTime': endTime,
      'Year': year,
    };
  }

  @override
  List<dynamic?> get props => [ {id, course, startTime, endTime, year}];

  @override
  bool? get stringify => true;
}

class getTimetable{
  Future fetchLecturefortoday() async {
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
      var filteredDay = filteredProgram.where((day) => day["Day"] == today);
      var filteredSemester = filteredDay.where((semester) => semester["Semester"] == "Semester 2");
      // print(filteredDay);

      /*  End Trying */


        // setState(() {
          var timetableItems = filteredSemester
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
        // });

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
}