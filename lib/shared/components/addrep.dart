import 'package:flutter/material.dart';
import 'package:hayah/shared/components/text_field.dart';

class AddRep extends StatelessWidget {
  AddRep({super.key, required this.item, required this.sign});
  String item, sign;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.3, child: Text(item)),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: TextFieldWidget(
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
