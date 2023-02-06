import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/login_screen.dart';
import 'package:hayah/shared/components/appbar.dart';
import 'package:hayah/shared/components/theme.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../shared/components/text_field.dart';
import '../shared/constants.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  //User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => BlocConsumer<MyCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ThemeSwitchingArea(
            child: Builder(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  leading: BackButton(
                      color: MyCubit.get(context).isLightCubit
                          ? Colors.black
                          : Colors.white),
                  title: Text("My Account",
                      style: TextStyle(
                          color: MyCubit.get(context).isLightCubit
                              ? Colors.black
                              : Colors.white)),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    ThemeSwitcher(
                      clipper: const ThemeSwitcherCircleClipper(),
                      builder: (context) {
                        return OutlinedButton(
                          child: Icon(
                            MyCubit.get(context).isLightCubit
                                ? FontAwesomeIcons.moon
                                : FontAwesomeIcons.sun,
                          ),
                          onPressed: () {
                            MyCubit.get(context).changeMode();
                            ThemeSwitcher.of(context).changeTheme(
                              theme: MyCubit.get(context).isLightCubit
                                  ? lightTheme
                                  : darkTheme,
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
                body: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  physics: BouncingScrollPhysics(),
                  children: [
                    // ProfileWidget(
                    //   imagePath: user.imagePath,
                    //   isEdit: true,
                    //   onClicked: () async {},
                    // ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Name',
                      text: CacheHelper.getData(key: "user") == null
                          ? 'Sohila Elsaid'
                          : jsonDecode(CacheHelper.getData(key: "user"))["name"]
                              .toString(),
                      onChanged: (name) {},
                      isEnapled: false,
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Email',
                      text: CacheHelper.getData(key: "user") == null
                          ? 'sohila@gmail.com'
                          : jsonDecode(
                                  CacheHelper.getData(key: "user"))["email"]
                              .toString(),
                      onChanged: (name) {},
                      isEnapled: false,
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Blood type',
                      text: CacheHelper.getData(key: "user") == null
                          ? 'O+'
                          : jsonDecode(CacheHelper.getData(key: "user"))[
                                  "blood_type"]
                              .toString(),
                      onChanged: (name) {},
                      isEnapled: false,
                    ),

                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'City',
                      text: CacheHelper.getData(key: "user") == null
                          ? 'Cairo'
                          : jsonDecode(CacheHelper.getData(key: "user"))["city"]
                              .toString(),
                      onChanged: (name) {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Phone',
                      text: CacheHelper.getData(key: "user") == null
                          ? '012121212'
                          : jsonDecode(
                                  CacheHelper.getData(key: "user"))["phone"]
                              .toString(),
                      onChanged: (name) {},
                      isEnapled: false,
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Address',
                      text: CacheHelper.getData(key: "user") == null
                          ? 'Egypt, Ain shams'
                          : jsonDecode(
                                  CacheHelper.getData(key: "user"))["address"]
                              .toString(),
                      onChanged: (email) {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Age',
                      text: CacheHelper.getData(key: "user") == null
                          ? '21'
                          : jsonDecode(CacheHelper.getData(key: "user"))["age"]
                              .toString(),
                      onChanged: (email) {},
                      isEnapled: false,
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Gender',
                      text: CacheHelper.getData(key: "user") == null
                          ? 'Female'
                          : jsonDecode(CacheHelper.getData(key: "user"))[
                                          "gender"]
                                      .toString()
                                      .toLowerCase() ==
                                  'true'
                              ? "Male"
                              : "Female",
                      onChanged: (name) {},
                      isEnapled: false,
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Password',
                      text: CacheHelper.getData(key: "user") == null
                          ? '1234'
                          : jsonDecode(
                                  CacheHelper.getData(key: "user"))["password"]
                              .toString(),
                      onChanged: (pass) {},
                    ),
                    const SizedBox(height: 24),
                    MaterialButton(
                      color: Colors.red,
                      height: 50,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Updated Successfuly")));
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
