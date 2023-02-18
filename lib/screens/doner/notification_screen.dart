import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/doner/discount_details.dart';
import 'package:hayah/screens/doner/report.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(title: Text("Notification")),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemBuilder: (context, i) => InkWell(
                    onTap: () {
                      if (MyCubit.get(context).notis[i].title.toLowerCase() ==
                          "discount") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DiscountDetailsScreen()));
                      } else if (MyCubit.get(context)
                              .notis[i]
                              .title
                              .toLowerCase() ==
                          "new report") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportScreen()));
                      } else {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Donation",
                          desc:
                              "The risk rate in the blood bank increase due to storage of type O+",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ],
                        ).show();
                      }
                    },
                    child: MyCubit.get(context).notis[i]),
                separatorBuilder: (context, i) => SizedBox(height: 15),
                itemCount: MyCubit.get(context).notis.length),
          ),
        );
      },
    );
  }
}
