import 'dart:convert';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/shared/constants.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';

import '../../model/discount_image_data_model.dart';

class NotificationDetailsScreen extends StatefulWidget {
  NotificationDetailsScreen({super.key, required this.notificationDetailsData});

  DiscountImageDataModel? notificationDetailsData;

  @override
  State<NotificationDetailsScreen> createState() =>
      _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Discount details"),
            ),
            body: state is getDiscImageDataLoadingState
                ? Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250,
                          child: ClayContainer(
                            borderRadius: 10,
                            spread: 1,
                            color: Colors.grey.shade400,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dear ${jsonDecode(CacheHelper.getData(key: donorData))["fname"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        "- You have discount ${widget.notificationDetailsData!.percentage}% off on x-ray and examination, This offer only for ${widget.notificationDetailsData!.LabName} lab"),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text("Thank you for your effort"),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
