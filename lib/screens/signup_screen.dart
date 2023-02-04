import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:hayah/shared/constants.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';

import 'doner/home.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController email = new TextEditingController();
  TextEditingController fName = new TextEditingController();
  TextEditingController lName = new TextEditingController();
  TextEditingController blood_type = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController passTwo = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController addres = new TextEditingController();
  TextEditingController contactNum = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController bloodType = new TextEditingController();
  bool isMale = true;
  final _formKey = GlobalKey<FormState>(); //key for form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: 100.h,
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hayah",
                      style: TextStyle(
                          fontSize: 25.h,
                          color: Colors.red,
                          fontFamily: "Quicksand"),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  "Get Registered From Here",
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "First name",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) return "First name can not be empty";
                    },
                    controller: fName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your First name',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Last name",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) return "Last name can not be empty";
                    },
                    controller: lName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Last name',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) return "Email can not be empty";
                    },
                    controller: email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Email',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Blood type",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) return "Blood type can not be empty";
                    },
                    controller: blood_type,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Blood type',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "City",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) return "City can not be empty";
                    },
                    controller: city,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Address',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Address",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) return "Address can not be empty";
                    },
                    controller: addres,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Address',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Age",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) return "Age can not be empty";
                    },
                    controller: age,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Age',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Phone number",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) return "Phone number can not be empty";
                    },
                    controller: contactNum,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Phone number',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Gender",
                  style: TextStyle(fontSize: 12.sp),
                ),
                GenderPickerWithImage(
                  showOtherGender: false,
                  verticalAlignedText: false,
                  selectedGender: Gender.Male,
                  selectedGenderTextStyle: TextStyle(
                      color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
                  unSelectedGenderTextStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                  onChanged: (Gender? gender) {
                    isMale = gender == Gender.Male ? true : false;
                  },
                  equallyAligned: true,
                  animationDuration: Duration(milliseconds: 300),
                  isCircular: true,

                  // default : true,
                  opacityOfGradient: 0.4,
                  padding: const EdgeInsets.all(3),
                  size: 50, //default : 40
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    obscureText: true,
                    validator: (v) {
                      if (v!.isEmpty) return "Password can not be empty";
                    },
                    controller: pass,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    controller: passTwo,
                    obscureText: true,
                    validator: (v) {
                      if (v != pass.text) return "password is not the same!";
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Confirm Password',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                MaterialButton(
                  color: Colors.red,
                  height: 20.h,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      CacheHelper.saveData(key: isLogged, value: true);
                      CacheHelper.saveDataString(
                          key: "user",
                          value: jsonEncode({
                            "name": "${fName.text} ${lName.text}",
                            "blood_type": "${blood_type.text}",
                            "email": "${email.text}",
                            "address": "${addres.text}",
                            "city": "${addres.text}",
                            "age": "${age.text}",
                            "phone": "${contactNum.text}",
                            "password": "${pass.text}",
                            "gender": "${this.isMale}",
                          }));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    }
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account ? ",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      child: Text(
                        "Sign In ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.red),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
