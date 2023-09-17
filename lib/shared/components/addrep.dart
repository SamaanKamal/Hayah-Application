import 'package:flutter/material.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/shared/components/text_field.dart';

class AddRep extends StatelessWidget {
  AddRep(
      {super.key,
      required this.item,
      required this.sign,
      required this.controller});

  String item, sign;
  late final TextEditingController controller;

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.3, child: Text(item)),
        if (item.toLowerCase() == "Status: ".toLowerCase())
          Center(
            child: DropdownButton<String>(
              value: MyCubit.get(context).dropdownValue,
              onChanged: (String? s) {
                controller.text = s!;
                MyCubit.get(context).changeValDrop(s);
              },
              items: <String>['Accepted', 'Rejected']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          )
        else
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: TextFieldWidget(
              controller: controller,
              label: "value",
              onChanged: (String value) {},
              text: '',
            ),
          ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.015),
        Text(sign),
      ],
    );
  }
}
