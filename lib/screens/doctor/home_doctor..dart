import 'dart:convert';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hayah/screens/doctor/add_report.dart';

import '../../shared/constants.dart';
import '../../shared/network/local/sharedPrefHelper.dart';
import '../doner/about_us_screen.dart';
import '../doner/history.dart';
import '../login_screen.dart';
import '../my_account_screen.dart';
import '../settings.dart';

class HomeDoctor extends StatelessWidget {
  const HomeDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              CacheHelper.getData(key: "user") == null
                  ? 'Sohila Elsaid'
                  : jsonDecode(CacheHelper.getData(key: "user"))["name"]
                      .toString(),
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
                CacheHelper.getData(key: "user") == null
                    ? 'Sohila@gmail.com'
                    : jsonDecode(CacheHelper.getData(key: "user"))["email"]
                        .toString(),
                style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: CacheHelper.getData(key: "user") == null
                    ? Image.asset("assets/images/female.png",
                        package: 'gender_picker')
                    : jsonDecode(CacheHelper.getData(key: "user"))["gender"]
                                .toString()
                                .toLowerCase() ==
                            'true'
                        ? Image.asset("assets/images/male.png",
                            package: 'gender_picker')
                        : Image.asset("assets/images/female.png",
                            package: 'gender_picker'),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/images/5.jpg')),
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
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (Context) => SettingScreen()));
          //   },
          // ),
          // Divider(
          //     height: 1,
          //     color: Colors.black,
          //     endIndent: 20,
          //     indent: 20,
          //     thickness: 0.2),
          // ListTile(
          //   leading: Icon(Icons.description),
          //   title: Text('History'),
          //   onTap: () => Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => HistoryScreen())),
          // ),
          // Divider(
          //     height: 1,
          //     color: Colors.black,
          //     endIndent: 20,
          //     indent: 20,
          //     thickness: 0.2),
          // ListTile(
          //   leading: Icon(Icons.info),
          //   title: Text('Contact us'),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => AboutUsScreen()));
          //   },
          // ),
          Divider(
              height: 1,
              color: Colors.black,
              endIndent: 20,
              indent: 20,
              thickness: 0.2),
          ListTile(
            title: Text('Delete account'),
            leading:
                Icon(FontAwesomeIcons.trashCan, size: 17, color: Colors.red),
            onTap: () {
              CacheHelper.sharedPreferences!.clear();
              CacheHelper.saveData(key: isLogged, value: false);
              CacheHelper.saveData(key: isFirstTime, value: false);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClayContainer(
                    borderRadius: 10,
                    spread: 1,
                    color: Colors.grey.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text("Welcome sohila,",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Thanks for your effort with our organization",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 20)),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddReportscreen()));
          },
          child: Icon(FontAwesomeIcons.plus)),
    );
  }
}
