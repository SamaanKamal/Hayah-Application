import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/shared/constants.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';

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
                child: Column(children: [
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
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Push notification"),
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
            ]),
          ),
        );
      },
    );
  }
}
