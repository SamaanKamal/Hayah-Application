import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/login_screen.dart';
import 'package:hayah/screens/my_account_screen.dart';
import 'package:hayah/screens/notification_screen.dart';
import 'package:hayah/screens/settings.dart';
import 'package:hayah/shared/constants.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';

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
                'Sohila Elsaid',
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text('Sohila@gmail.com',
                  style: TextStyle(color: Colors.black)),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                    imageUrl:
                        'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  ),
                ),
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
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
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
              onTap: () => null,
            ),
            Divider(
                height: 1,
                color: Colors.black,
                endIndent: 20,
                indent: 20,
                thickness: 0.2),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                CacheHelper.saveData(key: isLogged, value: false);
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
