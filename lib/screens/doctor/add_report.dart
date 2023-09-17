import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/shared/constants.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../shared/components/addrep.dart';

class AddReportscreen extends StatelessWidget {
  AddReportscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Add new report")),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 5),
                Row(children: [
                  Text(
                    "Doctor code: ${jsonDecode(CacheHelper.getData(key: doctorData))["id"]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => AddRep(
                          controller: MyCubit.get(context).controllers[index],
                          item: MyCubit.get(context).repos[index].item ?? "",
                          sign: MyCubit.get(context).repos[index].sign ?? ""),
                      separatorBuilder: (context, index) => Divider(
                            height: 10,
                            endIndent: 10,
                            indent: 10,
                            thickness: 1,
                            color: Colors.red.shade200,
                          ),
                      itemCount: MyCubit.get(context).repos.length),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            int i = 0;
                            MyCubit.get(context).controllers.forEach((E) {
                              if (E.text.isNotEmpty) {
                                i++;
                              } else {}
                            });
                            if (i == 19) {
                              MyCubit.get(context).createReport(
                                  MyCubit.get(context).controllers[0].text,
                                  MyCubit.get(context).controllers[1].text,
                                  MyCubit.get(context).controllers[2].text,
                                  MyCubit.get(context).controllers[7].text,
                                  MyCubit.get(context).controllers[9].text,
                                  MyCubit.get(context).controllers[10].text,
                                  MyCubit.get(context).controllers[11].text,
                                  MyCubit.get(context).controllers[12].text,
                                  MyCubit.get(context).controllers[13].text,
                                  MyCubit.get(context).controllers[14].text,
                                  MyCubit.get(context).controllers[3].text,
                                  MyCubit.get(context).controllers[4].text,
                                  MyCubit.get(context).controllers[5].text,
                                  MyCubit.get(context).controllers[6].text,
                                  MyCubit.get(context).controllers[8].text,
                                  MyCubit.get(context).controllers[15].text,
                                  MyCubit.get(context).controllers[16].text,
                                  MyCubit.get(context).controllers[17].text,
                                  MyCubit.get(context).controllers[18].text,
                                  context);
                            } else {
                              Alert(
                                context: context,
                                type: AlertType.warning,
                                title: "Please fill all fields !",
                                desc: "",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Ok",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(116, 116, 191, 1.0),
                                      Color.fromRGBO(52, 138, 199, 1.0)
                                    ]),
                                  )
                                ],
                              ).show();
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Text("Submit"),
                              )),
                        )
                      ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
