import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hayah/shared/components/text_field.dart';

import '../shared/network/local/sharedPrefHelper.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String _password = CacheHelper.getData(key: "user") == null
      ? '1234'
      : jsonDecode(CacheHelper.getData(key: "user"))["password"].toString();
  String _phone = CacheHelper.getData(key: "user") == null
      ? '1234'
      : jsonDecode(CacheHelper.getData(key: "user"))["phone"].toString();

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
          TextFieldWidget(
            label: 'Address',
            text: CacheHelper.getData(key: "user") == null
                ? 'Egypt, Ain shams'
                : jsonDecode(CacheHelper.getData(key: "user"))["address"]
                    .toString(),
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'City',
            text: CacheHelper.getData(key: "user") == null
                ? 'Cairo'
                : jsonDecode(CacheHelper.getData(key: "user"))["city"]
                    .toString(),
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFormField(
            initialValue: _phone,
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
            validator: (Phone) {
              if (Phone!.isEmpty) {
                return 'Please Enter Phone number';
              } else
                return null;
            },
            onSaved: (password) => _password = password!,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 24),
          Text("Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          TextFormField(
            initialValue: _password,
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
            validator: (password) {
              if (password!.isEmpty) {
                return 'Please Enter Password';
              } else
                return null;
            },
            onSaved: (password) => _password = password!,
            textInputAction: TextInputAction.done,
            obscureText: _obscureText,
          ),
          const SizedBox(height: 24),
          MaterialButton(
            color: Colors.red,
            height: 50,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: false,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text("Enter code sent to your email"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        OtpTextField(
                          numberOfFields: 4,
                          borderColor: Colors.red,
                          showFieldAsBox: false,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationCode) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Updated Successfuly")));
                          }, // end onSubmit
                        ),
                      ],
                    );
                  });
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
