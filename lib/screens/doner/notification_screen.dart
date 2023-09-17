import 'dart:convert';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/doner/discount_details.dart';
import 'package:hayah/screens/doner/notification_details.dart';
import 'package:hayah/screens/doner/report.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../shared/components/noti.dart';
import '../../shared/constants.dart';
import '../../shared/network/local/sharedPrefHelper.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyCubit.get(context).notificationData!.clear();
    MyCubit.get(context).getNotificationsId();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(title: Text("Notification")),
          body: MyCubit.get(context).notificationData == []
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemBuilder: (context, i) => InkWell(
                          onTap: () {
                            // if (MyCubit.get(context)
                            //         .notis[i]
                            //         .title
                            //         .toLowerCase() ==
                            //     "discount") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationDetailsScreen(
                                            notificationDetailsData:
                                                MyCubit.get(context)
                                                    .notificationData![i])));
                            // } else if (MyCubit.get(context)
                            //         .notis[i]
                            //         .title
                            //         .toLowerCase() ==
                            //     "new report") {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => ReportScreen(1)));
                            // } else {
                            //   Alert(
                            //     context: context,
                            //     type: AlertType.warning,
                            //     title: "Donation",
                            //     desc:
                            //         "The risk rate in the blood bank increase due to storage of type O+",
                            //     buttons: [
                            //       DialogButton(
                            //         child: Text(
                            //           "Cancel",
                            //           style: TextStyle(
                            //               color: Colors.white, fontSize: 20),
                            //         ),
                            //         onPressed: () => Navigator.pop(context),
                            //         gradient: LinearGradient(colors: [
                            //           Color.fromRGBO(116, 116, 191, 1.0),
                            //           Color.fromRGBO(52, 138, 199, 1.0)
                            //         ]),
                            //       )
                            //     ],
                            //   ).show();
                            // }
                          },
                          child: NotificationCard(
                              "Dear ${jsonDecode(CacheHelper.getData(key: donorData))["fname"]}, you got discount to ....",
                              "07:30 PM",
                              "Discount".toUpperCase())),
                      separatorBuilder: (context, i) => SizedBox(height: 15),
                      itemCount: MyCubit.get(context).notificationData!.length),
                ),
        );
      },
    );
  }
}
