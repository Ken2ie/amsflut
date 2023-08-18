import 'dart:convert';
import 'dart:io';

import 'package:centralamss/api_services/getUserInfo.dart';
import 'package:centralamss/api_services/model_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_services/timetableModel.dart';
import '../../login/login.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

String selectedImagePath = '';



class _SettingsState extends State<Settings> {

  void initState() {
  super.initState();
  // firstName.text = '';
  // lastName.text = '';
  // year.text = '';
  Future<UserModel>;
}

final newEmail = TextEditingController();
final firstName =   TextEditingController();
final lastName =  TextEditingController();
final year =  TextEditingController();
var active = Colors.black;
var inactive = Color.fromARGB(255, 173, 173, 173);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // minimum: EdgeInsets.symmetric(horizontal:20, vertical: 30),
      child: LiquidPullToRefresh(
        onRefresh: StudentInfoService.getUserInfo,
        color:  Color.fromARGB(255, 254, 180, 180),
        backgroundColor: Colors.red[900],
        animSpeedFactor: 1,
        showChildOpacityTransition: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body:  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child:
              Flex(
                  direction: Axis.vertical,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Settings', 
                        style: 
                        TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600
                        ),),
                        TextButton(onPressed: (){
                          // if(firstName.text.isEmpty || lastName.text.isEmpty || year.text.isEmpty){
                          //   active = inactive;
                          // }else if(firstName.text.isNotEmpty || lastName.text.isNotEmpty || year.text.isNotEmpty){
                          //   active = Colors.black;
                            saveChanged();
                          // }
                           }, child: Text('Save',
                       style: TextStyle( fontSize: 15, fontWeight: FontWeight.w600,
                       color: active
                       )
                        ))
                      ],
                    ),
                      //   Column(
                      //     children: [
                      //       Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                         
                      // Text(
                      //   'Select Image',
                      //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      // ),
                      //   ],
                      // ),
                      // ElevatedButton(
                      //     style: ButtonStyle(
                      //         backgroundColor: MaterialStateProperty.all(Colors.black),
                      //         padding:
                      //             MaterialStateProperty.all(const EdgeInsets.all(20)),
                      //         textStyle: MaterialStateProperty.all(
                      //             const TextStyle(fontSize: 14, color: Colors.white))),
                      //     onPressed: () async {
                      //       selectImage(context);
                      //       setState(() {});
                      //     },
                      //     child: const Text('Select')),
                      //     ],
                      //   ),
                    SizedBox(height: 30,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child:  SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: InkWell(
                                  onTap: (){
                                    selectImage(context);
                                  },
                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                     child: FutureBuilder<UserModel>(
                                            future: StudentInfoService.getUserInfo(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData && snapshot.data!.profilePicture != '' && !snapshot.hasError) {
                                                return
                                                selectedImagePath == '' 
                                                 ? Image.network("https://centralattendance.fly.dev/api/files/students/" + snapshot.data!.id + "/" + snapshot.data!.profilePicture,
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width: 100,
                                                ) : Image.file(File(selectedImagePath),
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width: 100);
                                              } else if (snapshot.hasError) {
                                                return 
                                                SvgPicture.asset('assets/svg/usercircle.svg',
                                                color: Colors.white,);
                                              }
                                
                                              // By default, show a loading spinner.
                                              return Container( 
                                                child: SvgPicture.asset('assets/svg/usercircle.svg',
                                              // height: 2,
                                              // width: 2,
                                              color: Colors.white,
                                              )
                                              );
                                            },
                                          ),
                                                     ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              Text('Profile', 
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 137, 137, 137)
                              ),),
                              SizedBox(height: 20,),
                             FutureBuilder<UserModel>(
                              future: StudentInfoService.getUserInfo(),
                              builder: (context, snapshot){
         
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 2),
                                        child: Text('First Name', 
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),),
                                      ),
                                      SizedBox(height: 7,),
                                      Container(
                                        height: 45,
                                        child: TextField(
                                          controller: firstName,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide.none
                                            ),
                                          filled: true,
                                          fillColor: Color.fromARGB(255, 237, 237, 237),
                                          hintText: snapshot.data?.firstName,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 15,),
                                          hintStyle: TextStyle(
                                            color: Color.fromARGB(255, 137, 137, 137)
                                          )
                                        ),
                                                                    ),
                                      ),
                                      SizedBox(height: 20,),
                                      Container(
                                        padding: EdgeInsets.only(left: 2),
                                        child: Text('Last Name', 
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),),
                                      ),
                                      SizedBox(height: 7,),
                                      Container(
                                        height: 45,
                                        child: TextField(
                                          controller: lastName,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide.none
                                            ),
                                          filled: true,
                                          hintText: snapshot.data?.lastName,
                                          fillColor: Color.fromARGB(255, 237, 237, 237),
                                          contentPadding: EdgeInsets.symmetric(horizontal: 15,),
                                          hintStyle: TextStyle(
                                            color: Color.fromARGB(255, 137, 137, 137)
                                          )
                                        ),
                                                                    ),
                                      ),
            
            
                                      // Academic 
                                      SizedBox(height: 30,),
                                      Text('Academic', 
                                       style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w500,
                                       color: Color.fromARGB(255, 137, 137, 137)
                                       ),),
                                      SizedBox(height: 10,),
                                      Container(
                                        padding: EdgeInsets.only(left: 2),
                                        child: Text('Index number', 
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),),
                                      ),
                                      SizedBox(height: 7,),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 15),
                                        width: MediaQuery.of(context).size.width,
                                        height: 45,
                                        alignment: Alignment.centerLeft,
                                        // child:
                                        //  Text(snapshot.data!.id, 
                                        // style: TextStyle(
                                        //   fontSize: 15
                                        // ),),
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 237, 237, 237),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                                                    // ),
                                      ),
                                      SizedBox(height: 20,),
                                      Container(
                                        padding: EdgeInsets.only(left: 2),
                                        child: Text('Year', 
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),),
                                      ),
                                      SizedBox(height: 7,),
                                      Container(
                                        height: 45,
                                        child: TextField(
                                          controller: year,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide.none
                                            ),
                                          filled: true,
                                          fillColor: Color.fromARGB(255, 237, 237, 237),
                                          contentPadding: EdgeInsets.symmetric(horizontal: 15,),
                                          hintText: snapshot.data?.year,
                                          hintStyle: TextStyle(
                                            color: Color.fromARGB(255, 137, 137, 137)
                                          )
                                        ),
                                                                    ),
                                      ),
                                      SizedBox(height: 30,),
                                      Text('Security', 
                                       style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w500,
                                       color: Color.fromARGB(255, 137, 137, 137)
                                       ),),
                                       SizedBox(height: 10,),
                                      Container(
                                        height: 45,
                                        child: TextField(
                                          controller: newEmail,
                                        decoration: InputDecoration(
                                          hintText: 'New Email',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide.none
                                            ),
                                          filled: true,
                                          fillColor: Color.fromARGB(255, 237, 237, 237),
                                          contentPadding: EdgeInsets.symmetric(horizontal: 15,),
                                          hintStyle: TextStyle(
                                            color: Color.fromARGB(255, 137, 137, 137)
                                          )
                                        ),
                                                                    ),
                                      ),
                                       SizedBox(height: 10,),
                                       InkWell(
                                        onTap: (){
                                          changeEmail();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          width: MediaQuery.of(context).size.width,
                                          height: 45,
                                          child: Text('Change Email', 
                                           style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15 
                                           ),
                                          )
                                          ),
                                       ),
                                       SizedBox(height: 10,),
                                       SizedBox(height: 10,),
                                       InkWell(
                                        onTap: (){
                                          changePassword();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          width: MediaQuery.of(context).size.width,
                                          height: 45,
                                          child: Text('Change Password', 
                                           style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15 
                                           ),
                                          )
                                          ),
                                       ),
                                       SizedBox(height: 10,),
                                       InkWell(
                                        onTap: () async {
                                         SharedPreferences prefs = await SharedPreferences.getInstance();
                                         prefs.remove('userID');
                                         prefs.remove('token');
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Login()));
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 205, 18, 18),
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          width: MediaQuery.of(context).size.width,
                                          height: 45,
                                          child: Text('Logout', 
                                           style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15 
                                           ),
                                          )
                                          ),
                                       ),
                                       SizedBox(height: MediaQuery.of(context).size.height / 10)
                                      ]
                                  ),
                                );
                              }
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
      )
    );
  }

  Future changeEmail() async{
    
     
     SharedPreferences token = await SharedPreferences.getInstance();
  dynamic tokeen = token.getString('token');
  // print(tokeen);
    
      Response response = await post(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/request-email-change'),
      headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization" : tokeen
          },
          body: jsonEncode(<String, String>{
            "newEmail" : newEmail.text
            })
      );

      if(response.statusCode > 200){
        print(response);
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Email changed to ' + newEmail.text.toString()), backgroundColor: const Color.fromARGB(255, 28, 183, 44),));
        
      }
  }

  Future saveChanged() async {

SharedPreferences user = await SharedPreferences.getInstance();
  dynamic stringValue = user.getString('userID');
  // print(stringValue);
    Response response = await get(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/records/' + stringValue),
  );

  var data = jsonDecode(response.body);

  var fName = data['firstName'];
  var lName = data['lastName'];
  var yearr = data['year'];
  
     if(firstName.text != fName && firstName.text != ''){
      Response response = await patch(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/records/' + stringValue),
       headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "firstName" : firstName.text
            })
  );
  if(response.statusCode == 200){
       ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Your First Name has been changed'), backgroundColor: Color.fromARGB(255, 0, 0, 0),));
  }else{
       ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Not successful'), backgroundColor: Color.fromARGB(255, 181, 1, 1)),);
  }
     }else if(lastName.text != lName && lastName.text != ''){
      Response response = await patch(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/records/' + stringValue),
      headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "lastName" : lastName.text
            })
  );
  if(response.statusCode == 200){
       ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Your Last Name has been changed'), backgroundColor: Color.fromARGB(255, 0, 0, 0),));
  }else{
       ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Not successful'), backgroundColor: Color.fromARGB(255, 181, 1, 1)),);
  }
     }else if(year.text != yearr && year.text != ''){
      Response response = await patch(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/records/' + stringValue),
      headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "year" : year.text
            })
  );

  if(response.statusCode == 200){
       ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Your year has been changed'), backgroundColor: Color.fromARGB(255, 0, 0, 0),));
  }else{
       ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Not successful'), backgroundColor: Color.fromARGB(255, 181, 1, 1)),);
  }
     }else if(lastName.text.isNotEmpty && firstName.text.isNotEmpty && year.text.isNotEmpty){
      Response response = await patch(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/records/' + stringValue),
      headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "firstName" : firstName.text,
            "lastName" : lastName.text,
            "year" : year.text,
            })
  );
  
  if(response.statusCode == 200){
       ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('All has been changed'), backgroundColor: Color.fromARGB(255, 0, 0, 0),));
  }else{
       ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Not successful'), backgroundColor: Color.fromARGB(255, 181, 1, 1)),);
  }
     }
  }
  
  
  Future changePassword() async{
    
     
     SharedPreferences token = await SharedPreferences.getInstance();
  dynamic email = token.getString('email');
  print(email);
    
      Response response = await post(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/request-password-reset'),
      headers: {
        'Application' : "application/json; charset=UTF-8",
        // 'Authorization' : tokeen
      },
      body: {
        'email' : email
      }
      );

      if(response.statusCode == 204){
        print(response);
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Password change request send to ' + email.toString()), backgroundColor: const Color.fromARGB(255, 28, 183, 44),));
      }
  }

// uploadFile() async {
//     var postUri = Uri.parse("");
//     var request = new MultipartRequest("POST", postUri);
//     request.fields['user'] = 'blah';
//     request.files.add(new MultipartFile.fromBytes('file', await File.fromUri(file.path).readAsBytes(), contentType: new MediaType('image', 'jpeg')));

//     request.send().then((response) {
//       if (response.statusCode == 200) print("Uploaded!");
//     });
//   }


 Future<void> selectImage(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 220,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();
                            print('Image_Path:-');
                            print(selectedImagePath);
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              // setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/images.svg',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            print('Image_Path:-');
                            print(selectedImagePath);

                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              // setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/camera.svg',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      SharedPreferences user = await SharedPreferences.getInstance();
      dynamic stringValue = user.getString('userID');
      print(stringValue);
      Response response = await patch(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/records/' + stringValue),
      headers: {
        'Application' : "application/json; charset=UTF-8"
      },
      body: {
        "profilePicture" : file
      },
      );
      
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      SharedPreferences user = await SharedPreferences.getInstance();
      dynamic stringValue = user.getString('userID');
      print(stringValue);
      Response response = await patch(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/records/' + stringValue),
      headers: {
        'Application' : "application/json; charset=UTF-8"
      },
      body: {
        "profilePicture" : file.path
      },
      );
      return file.path;
    } else {
      return '';
    }
  }
}