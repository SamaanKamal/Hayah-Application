import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hayah/screens/doner/home.dart';
import 'package:hayah/shared/blocObserevr.dart';
import 'package:hayah/shared/components/theme.dart';
import 'package:hayah/shared/constants.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_states.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  BlocOverrides.runZoned(
    () {
      return runApp(MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => MyCubit(),
          )
        ],
        child: MyApp(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, AppStates>(
      builder: (context, state) => OverlaySupport(
        child: ThemeProvider(
          initTheme: lightTheme,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Hayah',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: MyCubit.get(context).isLightCubit
                ? ThemeMode.light
                : ThemeMode.dark,
            home: Builder(builder: (context) {
              return EasySplashScreen(
                  logo: Image.asset("assets/images/logo.png"),
                  logoWidth: MediaQuery.of(context).size.width * 0.18,
                  title: Text("Hayah",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  navigator: (CacheHelper.getData(key: isFirstTime) ?? true)
                      ? IntroductionScreen(
                          bodyPadding: EdgeInsets.only(top: 150),
                          globalBackgroundColor: Colors.white,
                          pages: MyCubit.get(context).introPages,
                          showNextButton: true,
                          next: const Icon(Icons.arrow_forward),
                          showSkipButton: true,
                          skip: const Text(
                            "Skip",
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                          dotsContainerDecorator: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                          dotsDecorator: const DotsDecorator(
                            size: Size(10.0, 10.0),
                            color: Color(0xFFBDBDBD),
                            activeSize: Size(22.0, 10.0),
                            activeColor: Colors.red,
                            activeShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                            ),
                          ),
                          done: const Text("Done"),
                          onDone: () {
                            CacheHelper.saveData(key: isFirstTime, value: false);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        )
                      : (CacheHelper.getData(key: isLogged) ?? false)
                          ? HomeScreen()
                          : LoginScreen());
            }),
          ),
        ),
      ),
      listener: (context, state) {},
    );
  }
}
