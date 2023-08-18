import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(const DropDown());
}



class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List departmentsCategoryList= [];
  List programsCategoryList= [];

  Future getAllCategory() async {
    var deptbaseUrl = "https://centralattendance.fly.dev/api/collections/departments/records";
    var prgbaseUrl = "https://centralattendance.fly.dev/api/collections/programs/records";

    http.Response deptResponse = await http.get(Uri.parse(deptbaseUrl));
    http.Response prgResponse = await http.get(Uri.parse(prgbaseUrl));

    if (deptResponse.statusCode == 200) {
      var jsonData = json.decode(deptResponse.body);
      setState(() {
        departmentsCategoryList = jsonData['items'];
      });
    }
    if (prgResponse.statusCode == 200) {
      var jsonData = json.decode(prgResponse.body);
      setState(() {
        programsCategoryList = jsonData['items'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  var departmentsDropdownValue;
  var programsDropdownValue;

  @override
  Widget build(BuildContext context) {
    return 
            Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                         color : const Color(0xFF000000),  width : 1.0,  style : BorderStyle.solid,  strokeAlign : BorderSide.strokeAlignInside
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 255, 255)
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DropdownButton(
                      hint: Text('Department'),
                      items: departmentsCategoryList.map((item) {
                        return DropdownMenuItem(
                          value: item['id'].toString(),
                          child: Text(item['deptName'].toString(), 
                          style: TextStyle(
                            fontSize: 14
                          ),),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          departmentsDropdownValue = newVal;
                        });
                      },
                      value: departmentsDropdownValue,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                         color : const Color(0xFF000000),  width : 1.0,  style : BorderStyle.solid,  strokeAlign : BorderSide.strokeAlignInside
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 255, 255)
                    ),
                    child: DropdownButton(
                    hint: Text('Program'),
                    
                    items: programsCategoryList.map((item) {
                      return DropdownMenuItem(
                        value: item['id'].toString(),
                        child: Text(item['programName'].toString(),
                        style: TextStyle(
                          fontSize: 14
                        ),),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        programsDropdownValue = newVal;
                      });
                    },
                    value: programsDropdownValue,
                    ),
                  ),
                ]
              ),
            );
  }
}


