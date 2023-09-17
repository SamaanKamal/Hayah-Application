import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/shared/components/text_field.dart';

import '../shared/constants.dart';
import '../shared/network/local/sharedPrefHelper.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  // String _password = "";
  // String _address = jsonDecode(CacheHelper.getData(key: donorData))["address"];
  // String _phone = jsonDecode(CacheHelper.getData(key: donorData))["phone"];
  final TextEditingController controllerAddress = TextEditingController(
      text: jsonDecode(CacheHelper.getData(key: donorData))["address"]);
  final TextEditingController controllerphone = TextEditingController(
      text: jsonDecode(CacheHelper.getData(key: donorData))["phone"]);
  final TextEditingController controllerpassword =
      TextEditingController(text: "");

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit profile")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          const SizedBox(height: 24),
          Text("Address",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          TextFormField(
            controller: controllerAddress,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red,
                  )),
            ),
            // validator: (Phone) {
            //   if (Phone!.isEmpty) {
            //     return 'Please Enter Phone number';
            //   } else
            //     return null;
            // },
            textInputAction: TextInputAction.done,
          ),
          Text("phone",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          TextFormField(
            controller: controllerphone,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red,
                  )),
            ),
            // validator: (Phone) {
            //   if (Phone!.isEmpty) {
            //     return 'Please Enter Phone number';
            //   } else
            //     return null;
            // },
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 24),
          Text("Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          TextFormField(
            controller: controllerpassword,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red,
                  )),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _toggle,
              ),
            ),
            //validator: (password) {
            //   if (password!.isEmpty) {
            //     return 'Please Enter Password';
            //   } else
            //     return null;
            // },
            textInputAction: TextInputAction.done,
            obscureText: _obscureText,
          ),
          const SizedBox(height: 24),
          MaterialButton(
            color: Colors.red,
            height: 50,
            onPressed: () {
              MyCubit.get(context).sendOtp(controllerAddress.text,
                  controllerphone.text, controllerpassword.text, context);
            },
            child: Text(
              "Update",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ]),
      ),
    );
  }
}
