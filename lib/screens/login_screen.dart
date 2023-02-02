import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hayah/screens/doner/home.dart';
import 'package:hayah/shared/constants.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );
    return Scaffold(
      body: Container(
        child: FlutterLogin(
          title: 'Hayah',
          logo: AssetImage('assets/images/logo.png'),
          onLogin: (_) {},
          onSignup: (_) {},
          onSubmitAnimationCompleted: () {
            CacheHelper.saveData(key: isLogged, value: true);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
          },
          onRecoverPassword: (_) {},
          theme: LoginTheme(
            primaryColor: Colors.red,
            accentColor: Colors.yellow,
            errorColor: Colors.deepOrange,
            titleStyle: TextStyle(
              color: Colors.greenAccent,
              fontFamily: 'Quicksand',
              letterSpacing: 4,
            ),
            bodyStyle: TextStyle(
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
            ),
            textFieldStyle: TextStyle(
              color: Colors.black,
              shadows: [Shadow(color: Colors.red, blurRadius: 2)],
            ),
            buttonStyle: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            cardTheme: CardTheme(
              color: Colors.white,
              elevation: 15,
              margin: EdgeInsets.only(top: 15),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
            ),
            inputTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.purple.withOpacity(.1),
              contentPadding: EdgeInsets.zero,
              errorStyle: TextStyle(
                color: Colors.red,
              ),
              labelStyle: TextStyle(fontSize: 12),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
                borderRadius: inputBorder,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
                borderRadius: inputBorder,
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade700, width: 7),
                borderRadius: inputBorder,
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade400, width: 8),
                borderRadius: inputBorder,
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 5),
                borderRadius: inputBorder,
              ),
            ),
            buttonTheme: LoginButtonTheme(
              splashColor: Colors.purple,
              backgroundColor: Colors.pinkAccent,
              highlightColor: Colors.lightGreen,
              elevation: 9.0,
              highlightElevation: 6.0,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              // shape: CircleBorder(side: BorderSide(color: Colors.green)),
              // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
            ),
          ),
        ),
      ),
    );
  }
}
