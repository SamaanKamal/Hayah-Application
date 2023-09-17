import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/doner/discount_details.dart';
import 'package:hayah/screens/doner/report.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../shared/components/hist.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyCubit.get(context).reportsData!.clear();
    MyCubit.get(context).getReportsId();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("History")),
          body: MyCubit.get(context).reportsData == []
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemBuilder: (context, i) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReportScreen(
                                          reportModel: MyCubit.get(context)
                                              .reportsData![i],

                                      repId: MyCubit.get(context).repoIds[i],
                                        )));
                          },
                          child: HistoryCard(
                              "For more details click here",
                              "11:00 AM",
                              MyCubit.get(context)
                                  .reportsData![i]
                                  .status!
                                  .toUpperCase())),
                      separatorBuilder: (context, i) => SizedBox(height: 15),
                      itemCount: MyCubit.get(context).reportsData!.length),
                ),
        );
      },
    );
  }
}
