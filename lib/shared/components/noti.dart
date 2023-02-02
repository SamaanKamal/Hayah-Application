import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  String body = "";
  String date = "";
  NotificationCard(this.body, this.date);
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      borderRadius: 10,
      height: 60,
      spread: 1,
      color: Colors.grey.shade400,
      width: MediaQuery.of(context).size.width * 0.95,
      curveType: CurveType.none,
      child: Row(children: [
        SizedBox(
          width: 5,
        ),
        Image.asset("assets/images/logo.png"),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text("Hayah", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(this.body)
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(this.date)],
          ),
        )
      ]),
    );
  }
}
