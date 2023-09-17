import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/doctor/home_doctor..dart';
import 'package:hayah/screens/doner/home.dart';
import 'package:hayah/screens/signup_screen.dart';
import 'package:hayah/shared/constants.dart';
//import 'package:map_location_picker/map_location_picker.dart';

import '../shared/network/local/sharedPrefHelper.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
 //key for form
  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: BlocConsumer<MyCubit, AppStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
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
                    // SizedBox(height: 10.h),
                    // Text(
                    //   "Get Logged In From Here",
                    //   style: TextStyle(fontSize: 12.sp),
                    // ),
                    SizedBox(
                      height: 20.h,
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
                        controller: email,
                        validator: (v) {
                          if (v!.isEmpty) return "Email can not be empty";
                        },
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
                        controller: pass,
                        validator: (v) {
                          if (v!.isEmpty) return "Email can not be empty";
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Password',
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    Column(
                      children: [
                        RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Doctor'),
                          value: 'Doctor',
                          groupValue: MyCubit.get(context).selectedVal,
                          onChanged: MyCubit.get(context).radioVal,
                        ),
                        RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Donor'),
                          value: 'Donor',
                          groupValue: MyCubit.get(context).selectedVal,
                          onChanged: MyCubit.get(context).radioVal,
                        ),
                      ],
                    ),

                    MyCubit.get(context).isError
                        ? Text(
                            MyCubit.get(context).errorLogin,
                            style: TextStyle(color: Colors.red),
                          )
                        : SizedBox(),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ForgotPassword()));
                        },
                        child: Text(
                          "Forgot Password ? ",
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    MaterialButton(
                      color: Colors.red,
                      height: 20.h,
                      minWidth: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      child: state is loginLoadingState
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.sp),
                            ),
                      onPressed: () => MyCubit.get(context).login(
                          MyCubit.get(context).selectedVal,
                          email.text,
                          pass.text,
                          context),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an account ? ",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                              color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RegisterScreen()));
                          },
                          child: Text(
                            "Sign Up ",
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
            );
          },
        ),
      ),
    );
  }
}
