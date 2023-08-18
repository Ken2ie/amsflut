import 'dart:convert';

import 'package:centralamss/api_services/timetableModel.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

var timetableItems;

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

      var dt = DateTime.now();
      String datetime = DateTime.now().toString();
      String today = DateFormat('EEEEE').format(dt);
       
      var filteredProgram;
      filteredProgram = items.where((year) => year["Year"] == studentYear);
      var filteredSemester = filteredProgram.where((semester) => semester["Semester"] == "Semester 2");
      // print(filteredDay);

      /*  End Trying */


           timetableItems = filteredSemester
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
      // print(totalLectures);



      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
}