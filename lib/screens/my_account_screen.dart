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
                            ThemeSwitcher.of(context).changeTheme(
                              theme: MyCubit.get(context).isLightCubit
                                  ? darkTheme
                                  : lightTheme,
                            );
                            MyCubit.get(context).changeMode();
                            CacheHelper.saveData(
                                key: isLight,
                                value: !MyCubit.get(context).isLightCubit);
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
                      label: 'Full Name',
                      text: "Sohila",
                      onChanged: (name) {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Email',
                      text: "Sohila@gmail.com",
                      onChanged: (email) {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'About',
                      text: "Talented donor",
                      maxLines: 5,
                      onChanged: (about) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      child: Text(
                        "Delete account?",
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Delete account",
                          desc: "Are you sure you want to delete your account?",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen())),
                              color: Colors.red,
                            ),
                            DialogButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ],
                        ).show();
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
}
