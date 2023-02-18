import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/shared/constants.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'login_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Settings")),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              ClayContainer(
                borderRadius: 10,
                spread: 1,
                color: Colors.grey.shade400,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Row(
                      //       children: [
                      //         Text("Light mode"),
                      //         Spacer(),
                      //         FlutterSwitch(
                      //           width: 80.0,
                      //           height: 40.0,
                      //           valueFontSize: 20.0,
                      //           toggleSize: 30.0,
                      //           value: CacheHelper.getData(key: isLight) ??
                      //               !MyCubit.get(context).isLightCubit,
                      //           borderRadius: 30.0,
                      //           padding: 8.0,
                      //           onToggle: (val) {
                      //             CacheHelper.saveData(key: isLight, value: val);
                      //             MyCubit.get(context).changeMode();
                      //             print(val);
                      //             print(CacheHelper.saveData(
                      //                 key: isLight, value: val));
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Text("Push notifications"),
                              Spacer(),
                              FlutterSwitch(
                                width: 70.0,
                                height: 30.0,
                                valueFontSize: 20.0,
                                toggleSize: 15.0,
                                value: MyCubit.get(context).pushNoti,
                                borderRadius: 30.0,
                                padding: 8.0,
                                onToggle: (val) {
                                  MyCubit.get(context).changePush();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: 20),
              ClayContainer(
                borderRadius: 10,
                spread: 1,
                color: Colors.grey.shade400,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.trashCan,
                            size: 17, color: Colors.red),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Delete account?",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
