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
                              child: CacheHelper.getData(key: isDonner)
                                  ? jsonDecode(CacheHelper.getData(
                                              key: donorData))["gender"] ==
                                          'M'
                                      ? Image.asset("assets/images/male.png",
                                          package: 'gender_picker')
                                      : Image.asset("assets/images/female.png",
                                          package: 'gender_picker')
                                  : Image.asset("assets/images/male.png",
                                      package: 'gender_picker')),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                        CacheHelper.getData(key: isDonner)
                            ? jsonDecode(CacheHelper.getData(key: donorData))[
                                    "fname"] +
                                " " +
                                jsonDecode(CacheHelper.getData(key: donorData))[
                                    "lname"]
                            : jsonDecode(CacheHelper.getData(key: doctorData))[
                                    "fname"] +
                                " " +
                                jsonDecode(CacheHelper.getData(
                                    key: doctorData))["lname"],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                        CacheHelper.getData(key: isDonner)
                            ? jsonDecode(
                                CacheHelper.getData(key: donorData))["email"]
                            : jsonDecode(
                                CacheHelper.getData(key: doctorData))["email"],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    CacheHelper.getData(key: doctorConstant) == null
                        ? const SizedBox(height: 24)
                        : SizedBox(),
                    CacheHelper.getData(key: doctorConstant) == null
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.red.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('Blood type : '),
                                  Text(
                                    jsonDecode(CacheHelper.getData(
                                        key: donorData))["blood_type"],
                                  )
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                    const SizedBox(height: 25),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text("City",
                          //         style:
                          //             TextStyle(fontWeight: FontWeight.bold)),
                          //     const SizedBox(height: 10),
                          //     Text(CacheHelper.getData(key: "user") == null
                          //         ? 'Cairo'
                          //         : jsonDecode(CacheHelper.getData(
                          //                 key: "user"))["city"]
                          //             .toString())
                          //   ],
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Text(CacheHelper.getData(key: isDonner)
                                  ? jsonDecode(CacheHelper.getData(
                                      key: donorData))["phone"]
                                  : jsonDecode(CacheHelper.getData(
                                      key: doctorData))["phone"])
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  CacheHelper.getData(key: isDonner)
                                      ? "Age"
                                      : "CenterId",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Text(CacheHelper.getData(key: isDonner)
                                  ? jsonDecode(CacheHelper.getData(
                                              key: donorData))["age"]
                                          .toString() ??
                                      ""
                                  : jsonDecode(CacheHelper.getData(
                                              key: doctorData))["center_id"]
                                          .toString() ??
                                      "")
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  CacheHelper.getData(key: isDonner)
                                      ? "Gender"
                                      : "Doctor code",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Text(
                                CacheHelper.getData(key: isDonner)
                                    ? jsonDecode(CacheHelper.getData(
                                            key: donorData))["gender"] ??
                                        ""
                                    : jsonDecode(CacheHelper.getData(
                                            key: doctorData))["id"]
                                        .toString(),
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
                              CacheHelper.getData(key: isDonner)
                                  ? jsonDecode(CacheHelper.getData(
                                          key: donorData))["address"] ??
                                      ""
                                  : jsonDecode(CacheHelper.getData(
                                          key: doctorData))["address"]
                                      .toString(),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (CacheHelper.getData(key: isDonner))
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
