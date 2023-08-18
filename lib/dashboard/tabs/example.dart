import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../../api_services/students.dart';

class chats extends StatefulWidget {
  const chats({super.key});

  @override
  _chatsState createState() => _chatsState();
}

class _chatsState extends State<chats> {
  List<student> timetableItems = [];

  @override
  void initState() {
    super.initState();
    fetchTimetableData();
  }

  Future<void> fetchTimetableData() async {
    final url = Uri.parse(
        'https://centralattendance.fly.dev/api/collections/students/records');

    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        final items = jsonData['items'] as List<dynamic>;
        setState(() {
          timetableItems = items
              .map<student>((item) => student.fromJson(item))
              .toList();
        });
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: ListView.builder(
        itemCount: timetableItems.length,
        itemBuilder: (context, index) {
          final student item = timetableItems[index];
          return ListTile(
                    onTap: (){
                       
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset('assets/user.jpg',
                      width: 46,
                      height: 46,
                      fit: BoxFit.cover,),
                    ),
                    title: Text(item.username),
                    subtitle: Text(''),
                    // trailing: Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Text('10:00am', 
                    // style: TextStyle(
                    //   color: Colors.grey,
                    //   fontSize: 12
                    // ),),
                    //    Container(
                    //     padding: EdgeInsetsDirectional.symmetric(horizontal: 6),
                    //     decoration: BoxDecoration(
                    //       color: Color.fromARGB(255, 60, 250, 117),
                    //       borderRadius: BorderRadius.circular(20)
                    //     ),
                    //     child: Text('2', 
                    //     style: TextStyle(
                    //       fontSize: 12
                    //     ),),
                    //    )
                    //   ],
                    // )
                  );
          
        },
      ),
    );
  }
}

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}