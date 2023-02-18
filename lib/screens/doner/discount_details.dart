import 'dart:convert';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';

class DiscountDetailsScreen extends StatelessWidget {
  const DiscountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discount details"),
      ),
      body: Column(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Dear ${CacheHelper.getData(key: "user") == null ? 'Sohila Elsaid' : jsonDecode(CacheHelper.getData(key: "user"))["name"].toString()}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "- You have discount 35% off on x-ray and examination, This offer only for el-mahdy lab in cairo, ain shams 21 street"),
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
  }
}
