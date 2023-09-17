import 'dart:convert';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/doner/about_us_screen.dart';
import 'package:hayah/screens/doner/history.dart';
import 'package:hayah/screens/login_screen.dart';
import 'package:hayah/screens/my_account_screen.dart';
import 'package:hayah/screens/doner/notification_screen.dart';
import 'package:hayah/screens/settings.dart';
import 'package:hayah/shared/constants.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';
import 'package:gender_picker/gender_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, AppStates>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset("assets/images/logo.png", width: 20),
              SizedBox(width: 5),
              Text("Hayah"),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                CacheHelper.getData(key: isDonner)
                    ? jsonDecode(CacheHelper.getData(key: donorData))["fname"]??"" +
                        " " +
                        jsonDecode(CacheHelper.getData(key: donorData))["lname"]??""
                    : jsonDecode(
                            CacheHelper.getData(key: doctorData))["fname"] +
                        " " +
                        jsonDecode(
                            CacheHelper.getData(key: doctorData))["lname"],
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                  CacheHelper.getData(key: isDonner)
                      ? jsonDecode(CacheHelper.getData(key: donorData))["email"]
                      : jsonDecode(
                          CacheHelper.getData(key: doctorData))["email"],
                  style: TextStyle(color: Colors.black)),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                    child: CacheHelper.getData(key: isDonner)
                        ? jsonDecode(CacheHelper.getData(key: donorData))[
                                    "gender"] ==
                                'M'
                            ? Image.asset("assets/images/male.png",
                                package: 'gender_picker')
                            : Image.asset("assets/images/female.png",
                                package: 'gender_picker')
                        : Image.asset("assets/images/male.png",
                            package: 'gender_picker')),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/5.jpg')),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My account'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()));
              },
            ),
            Divider(
                height: 1,
                color: Colors.black,
                endIndent: 20,
                indent: 20,
                thickness: 0.2),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => SettingScreen()));
              },
            ),
            Divider(
                height: 1,
                color: Colors.black,
                endIndent: 20,
                indent: 20,
                thickness: 0.2),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('History'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryScreen())),
            ),
            Divider(
                height: 1,
                color: Colors.black,
                endIndent: 20,
                indent: 20,
                thickness: 0.2),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Contact us'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactUs(
                              companyName: 'Hayah',
                              cardColor: Colors.red,
                              textColor: Colors.white,
                              email: 'hayahadmin@gmail.com',
                              phoneNumber: "01270969538",
                              image: Image.asset("assets/images/logo.png",
                                  width: 300, height: 300),
                              githubUserName: "nermeen_elbably",
                              // linkedinURL: "",
                              // facebookHandle: "",
                              // instagram: "",
                              emailText: "Email",
                              companyColor: Colors.red,
                              taglineColor: Colors.black,
                              dividerColor: Colors.black,
                              dividerThickness: 2,
                            )));
              },
            ),
            Divider(
                height: 1,
                color: Colors.black,
                endIndent: 20,
                indent: 20,
                thickness: 0.2),
            ListTile(
              title: Text('Log out'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                CacheHelper.sharedPreferences!.clear();
                CacheHelper.saveData(key: isLogged, value: false);
                CacheHelper.saveData(key: isFirstTime, value: false);

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ]),
        ),
        body: MyCubit.get(context).notActiveIndex == 0
            ? MyCubit.get(context).screens[MyCubit.get(context).activeIndex]
            : MyCubit.get(context).screens[4],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MyCubit.get(context).changeIndex(4);
          },
          child: Icon(FontAwesomeIcons.home,
              color: MyCubit.get(context).notActiveIndex == 1
                  ? Colors.red
                  : Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: MyCubit.get(context).iconList,
          activeIndex: MyCubit.get(context).activeIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: MyCubit.get(context).changeIndex,
          inactiveColor: Colors.black,
          activeColor: MyCubit.get(context).notActiveIndex == 0
              ? Colors.red
              : Colors.black,
          //other params
        ),
      ),
      listener: (context, state) {},
    );
  }
}
