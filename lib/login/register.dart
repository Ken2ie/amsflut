
import 'dart:convert';

import 'package:centralamss/dashboard/dashboard.dart';
import 'package:centralamss/login/login.dart';
import 'package:centralamss/login/registerSecond.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';



class Register extends StatefulWidget {
  const Register({super.key});

List<Step> stepList() => [
  const Step(title: Text('Personal Information'), content: Center())
];

  @override
  State<Register> createState() => _RegisterState();
}

final studentEmailController = TextEditingController();
final contactConrtoller = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();



class Album {
  final int id;
  final String email;
  final String password;

  const Album({required this.id, required this.email, required this.password});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
}
class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/svg/login.svg',
                        width: 20,
                        height: 20,),
                        SizedBox(width: 10,),
                        Text('Login',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.red[900]
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.only(top: 50, right: 40),
                    child: Image.asset('assets/cu-logo.png',
                  width: 50,
                  height: 50,
                  ),
                  )
                ],
              ),
            ),
             Container(
              margin: EdgeInsets.all(30),
               child:  
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Register',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 10),
                  const Text('Join the early birds of punctual Central University Students.'),
                  const SizedBox(height: 40),
                  // const SizedBox(height: 20),

                  // Cu
                TextFormField(
                  controller: studentEmailController,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Student Email',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                SizedBox(height: 20,),
                IntlPhoneField(
                  controller: contactConrtoller,
                   decoration: InputDecoration(
                  //  labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                     borderSide: BorderSide(),
                     ),
                          ),
                   initialCountryCode: 'GH',
                    onChanged: (phone) {
                    // print(phone.completeNumber);
                  },
                    ),
                SizedBox(height: 10,),
                TextFormField(
                  maxLength: 10,
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),

                // Cu


                TextButton(onPressed: (){
                  // Route
                   Navigator.of(context).pushReplacementNamed('/login');

                  //  Reset Input
                  studentEmailController.text = '';
                  contactConrtoller.text = '';
                  passwordController.text = '';
                  confirmPasswordController.text = '';
                }, 
                child: Text('Already joined us? Please sign in',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  decoration: TextDecoration.underline
                ),
                )
                ),
                SizedBox(height: 10,),
                // SizedBox(height: 20,),
                // Center(
                //       child:
                //       Container( 
                //         margin: const EdgeInsets.only(top: 40),
                //         width: 130,
                //         height: 40,
                //         child: InkWell(
                //     child: ElevatedButton(
                //     onPressed: () {
                //       // login(emailcontoller.text.toString(), passwordcontoller.text.toString());
                //         // Navigator.of(context).pushReplacementNamed('/navigator');
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.red[900],
                //       disabledForegroundColor: Colors.black.withOpacity(0.38), disabledBackgroundColor: Colors.black.withOpacity(0.12),
                //       shape: const RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //       ),
                //     ),

                //     child: const Text('Register',
                //     style: TextStyle(
                //       fontFamily: 'Poppins',
                //       fontSize: 20
                //     )),
                //   ),
                // ),
                //       ),
                //     ),
                ],
               ),
             ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                    onTap: (){
                      registerr();
                      
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 14,
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                        borderRadius: BorderRadius.circular(10) 
                      ),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          ]
          ),
      )
    );
  }

  Future registerr() async {
      if(studentEmailController.text.isNotEmpty && contactConrtoller.text.isNotEmpty &&  passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty && passwordController.text == confirmPasswordController.text){
         Response response = await post(
         Uri.parse('https://centralattendance.fly.dev/api/collections/students/records'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email' : studentEmailController.text,
            'contact' : contactConrtoller.text,
            'password' : passwordController.text,
            'passwordConfirm' : confirmPasswordController.text,
            'emailVisibility' : 'true'
            })
        );

       var responseded = jsonDecode(response.body.toString());

        if(response.statusCode == 200){
      
            var data = jsonDecode(response.body.toString());
            var record = data['record'];
            print(data);
            // print(data['token']);
            print('Login successfully');

             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Login()),
                  );
        }else{
           var error = jsonDecode(response.body.toString());
           var errorData = error['message'];
         // var errorPasswordMessage = errorData['password'];
         // var passwordErrorMessage = errorPasswordMessage['message'];
            print(error);
            ScaffoldMessenger.of(context)
             .showSnackBar(SnackBar(content: Text(errorData.toString()), backgroundColor: Colors.red[900],));
        }

        print(responseded);
      }
      else if(studentEmailController.text.isEmpty){
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Email cannot be empty'), backgroundColor: Colors.red[900],));
      }
      else if(contactConrtoller.text.isEmpty){
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Contact cannot be empty'), backgroundColor: Colors.red[900],));
      }
      else if(passwordController.text.isEmpty){
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Password cannot be empty'), backgroundColor: Colors.red[900],));
      }
      else if(passwordController.text != confirmPasswordController.text){
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Confirmed password is wrong'), backgroundColor: Colors.red[900],));
      }
      else{
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('All fields Cannot be empty'), backgroundColor: Colors.red[900],));
      }

  }

}

final registeration = [
  studentEmailController.text,
  contactConrtoller.text,
  passwordController.text,
  confirmPasswordController.text
];
