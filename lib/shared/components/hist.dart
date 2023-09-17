import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  String body = "";
  String title = "";
  String date = "";

  HistoryCard(this.body, this.date, this.title);

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
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: title.toLowerCase() == "rejected"
                        ? Colors.red
                        : Colors.green)),
            SizedBox(
              height: 10,
            ),
            Text(
              this.body,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.027),
            )
          ],
        ),
        // Spacer(),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [Text(this.date)],
        //   ),
        // )
      ]),
    );
  }
}
