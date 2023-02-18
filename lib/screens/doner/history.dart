import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/doner/discount_details.dart';
import 'package:hayah/screens/doner/report.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("History")),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemBuilder: (context, i) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportScreen(isHist: true,)));
                    },
                    child: MyCubit.get(context).histories[i]),
                separatorBuilder: (context, i) => SizedBox(height: 15),
                itemCount: MyCubit.get(context).histories.length),
          ),
        );
      },
    );
  }
}
