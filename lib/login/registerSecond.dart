import 'dart:convert';

import 'package:centralamss/login/components/droopDown.dart';
import 'package:centralamss/login/congrats.dart';
import 'package:centralamss/login/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';

import 'login.dart';

class RegisterSecond extends StatefulWidget {
  const RegisterSecond({super.key});

  @override
  State<RegisterSecond> createState() => _RegisterSecondState();
}


int _currentStep = 0;

bool one  = false;
bool two  = false;
bool three  = false;

final studentEmailController = TextEditingController();
final usernameController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();
final personalEmailController = TextEditingController();
final yearController = TextEditingController();
final indexNumberController = TextEditingController();
final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final semesterController= TextEditingController();

var _step = 0;

 

 var _steps = [
    Step(
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: one,
      title: Text('Account', 
      style: TextStyle(
        fontSize: 10
      ),),
      content: Column(
        children: [
            Text("Let's Setup your new account."),
                SizedBox(height: 30),
            TextField(
                  controller: usernameController,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                SizedBox(height: 20),
            TextField(
                  controller: studentEmailController,
                  // obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Student Email',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                SizedBox(height: 20),
            TextField(
              maxLength: 12,
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
                Text('Not less than 10 characters'),
                SizedBox(height: 20),
            TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Passowrd',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
        ],
      ),
    ),
    Step(
      state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive:  two,
      title: Text('Personal Details', 
      style: TextStyle(
        fontSize: 10
      ),),
      content: Column(
        children: [
          Text("Let us know who you are."),
                SizedBox(height: 20),
            TextField(
                  controller: firstNameController,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                SizedBox(height: 20),
            TextField(
                  controller: lastNameController,
                  // obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                SizedBox(height: 20),
            TextField(
                  controller: personalEmailController,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Personal Email',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
        ],
      ),
    ),
    Step(
      state: _currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: three,
      title: Text('Last Step', 
      style: TextStyle(
        fontSize: 10
      ),),
      content: Column(
        children: [
          Text("One more Step and we will be done."),
                SizedBox(height: 20),
            TextField(
                  controller: indexNumberController,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Index Number, eg. CSC/19/01/1234',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                SizedBox(height: 20),
            TextField(
                  controller: yearController,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Level, eg. 400',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
            TextField(
                  controller: semesterController,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Current Semester, eg. "Semester 1"',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                SizedBox(height: 20),
                const DropDown(),
                SizedBox(height: 20),
            
        ],
      ),
    )
  ];

bool isCompleted = false;

  // List<Step> getSteps() => [
  //       const Step(title: Text('Student'), content: Center(child: 
  //       Column(
  //         children: [
  //         ],
  //       )
  //       )),
  //        const Step(title: Text('Academic '), content: Center(child: Text('Address'),)),
  //         const Step(title: Text('Final2'), content: Center(child: Text('Confirm'),))
  //  ];
class _RegisterSecondState extends State<RegisterSecond> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isCompleted ? Congrats() : SafeArea(
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(primary:  const Color.fromARGB(255, 135, 23, 14))
            ),
            child: Stepper(
               onStepTapped: (step) => setState(() => _currentStep = step),
                onStepContinue: () {
                  final lastStep = _currentStep == _steps.length - 1;
            setState(() {
              if (_currentStep < _steps.length - 1) {
                _currentStep += 1;
                one = true;
              } 
              else if(lastStep){
                three = true;
                registerr();
              }
              else {
                _currentStep = 0;
                one = false;
              }
            });
                },
                onStepCancel: _currentStep == 0 ? null : () =>
            setState(() => _currentStep -= 1),
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                                  final lastStep = _currentStep == _steps.length - 1;

                if(_currentStep >= 1){

                }
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text(lastStep ? 'Confirm' : "Next", 
                        ),
                        onPressed: details.onStepContinue,
                        )
                    ),
                    if(_currentStep != 0)
                    SizedBox(width: 20,),
                    if(_currentStep != 0)
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Back'),
                        onPressed: details.onStepCancel,
                        )
                    ),
                  ],),
                );
              },
                currentStep: _currentStep,
                  
              type: StepperType.horizontal,
              steps: _steps,
              ),
          ),
        )
    );
  }

  Future registerr() async {
      if(studentEmailController.text.isNotEmpty && usernameController.text.isNotEmpty &&  passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty && passwordController.text == confirmPasswordController.text){
         Response response = await post(
         Uri.parse('https://centralattendance.fly.dev/api/collections/students/records'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email' : studentEmailController.text,
            'username' : usernameController.text,
            'password' : passwordController.text,
            'passwordConfirm' : confirmPasswordController.text,
            'program' : programsDropdownValue,
            'department' : departmentsDropdownValue,
            'indexNumber' : indexNumberController.text,
            'studentPersonalEmail' : personalEmailController.text,
            'year' : yearController.text,
            'firstName' : firstNameController.text,
            'lastName' : lastNameController.text,
            'contact' : contactConrtoller.text,
            'scemester' : semesterController.text,
            'emailVisibility' : 'true'
            })
        );

       var responseded = jsonDecode(response.body.toString());

        if(response.statusCode == 200){

          Response veri = await post(
         Uri.parse('https://centralattendance.fly.dev/api/collections/students/request-verification'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email' : studentEmailController.text,
          }));
      
            var data = jsonDecode(response.body.toString());
            var record = data['record'];
            print(data);
            // print(data['token']);
            print('Login successfully');
            isCompleted = true;
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Congrats()),
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
      else if(usernameController.text.isEmpty){
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

  List departmentsCategoryList= [];
  List programsCategoryList= [];
  var departmentsDropdownValue;
  var programsDropdownValue;
  class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  Future getAllCategory() async {
    var deptbaseUrl = "https://centralattendance.fly.dev/api/collections/departments/records";
    var prgbaseUrl = "https://centralattendance.fly.dev/api/collections/programs/records";

    Response deptResponse = await get(Uri.parse(deptbaseUrl));
    Response prgResponse = await get(Uri.parse(prgbaseUrl));

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





class Congrats extends StatefulWidget {
  const Congrats({super.key});

  @override
  State<Congrats> createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children:  [
                LottieBuilder.asset('assets/congrats.json', width: 200,), 
                LottieBuilder.asset('assets/congratsTwo.json', width: 200,)
              ]),
            ),
            
            Text('Congratulations.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600
            ),),
            Text('Please check the link sent to the email you registered with to verify your account.',
            textAlign: TextAlign.center,),
            SizedBox(height: 40,),
            InkWell(
              onTap: (){
                isCompleted = false;
                 studentEmailController.text = '';
                 usernameController.text = '';
                passwordController.text = '';
                confirmPasswordController.text = '';
                programsDropdownValue = '';
                departmentsDropdownValue = '';
                indexNumberController.text = '';
                 personalEmailController.text = '';
                 yearController.text = '';
                  firstNameController.text = '';
                  lastNameController.text = '';
                   contactConrtoller.text = '';
                   semesterController.text = '';
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Login()),
                  );
              }, child: Text('Login'))
          ],
        )
        ),
    );
  }
}