import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/edit_screen.dart';
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: ClipOval(
                            child: CacheHelper.getData(key: "user") == null
                                ? Image.asset(
                                    "assets/images/female.png",
                                    package: 'gender_picker',
                                  )
                                : jsonDecode(CacheHelper.getData(key: "user"))[
                                                "gender"]
                                            .toString()
                                            .toLowerCase() ==
                                        'true'
                                    ? Image.asset("assets/images/male.png",
                                        package: 'gender_picker')
                                    : Image.asset("assets/images/female.png",
                                        package: 'gender_picker'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                        CacheHelper.getData(key: "user") == null
                            ? 'Sohila Elsaid'
                            : jsonDecode(
                                    CacheHelper.getData(key: "user"))["name"]
                                .toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                        CacheHelper.getData(key: "user") == null
                            ? 'sohila@gmail.com'
                            : jsonDecode(
                                    CacheHelper.getData(key: "user"))["email"]
                                .toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Blood type : '),
                            Text(
                              CacheHelper.getData(key: "user") == null
                                  ? 'O positive'
                                  : jsonDecode(CacheHelper.getData(
                                          key: "user"))["blood_type"]
                                      .toString(),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("City",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Text(CacheHelper.getData(key: "user") == null
                                  ? 'Cairo'
                                  : jsonDecode(CacheHelper.getData(
                                          key: "user"))["city"]
                                      .toString())
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Text(CacheHelper.getData(key: "user") == null
                                  ? '012121212'
                                  : jsonDecode(CacheHelper.getData(
                                          key: "user"))["phone"]
                                      .toString())
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Age",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Text(CacheHelper.getData(key: "user") == null
                                  ? '21'
                                  : jsonDecode(CacheHelper.getData(
                                          key: "user"))["age"]
                                      .toString())
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gender",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Text(
                                CacheHelper.getData(key: "user") == null
                                    ? 'Female'
                                    : jsonDecode(CacheHelper.getData(
                                                    key: "user"))["gender"]
                                                .toString()
                                                .toLowerCase() ==
                                            'true'
                                        ? "Male"
                                        : "Female",
                              )
                            ],
                          ),
                        ]),
                    const SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text(
                              CacheHelper.getData(key: "user") == null
                                  ? 'Egypt, Ain shams'
                                  : jsonDecode(CacheHelper.getData(
                                          key: "user"))["address"]
                                      .toString(),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    MaterialButton(
                      color: Colors.red,
                      height: 50,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.edit),
                          SizedBox(width: 3),
                          Text(
                            "Edit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
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
