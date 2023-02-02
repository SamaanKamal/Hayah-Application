import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hayah/screens/doner/home.dart';
import 'package:hayah/shared/blocObserevr.dart';
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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hayah',
          theme: ThemeData(
            fontFamily: "Quicksand",
            primarySwatch: Colors.red,
            primaryColor: Colors.white,
            brightness: Brightness.light,
            backgroundColor: const Color(0xFFE5E5E5),
            accentColor: Colors.black,
            accentIconTheme: const IconThemeData(color: Colors.white),
            dividerColor: Colors.white54,
          ),
          darkTheme: ThemeData(
            fontFamily: "Quicksand",
            primarySwatch: Colors.red,
            primaryColor: Colors.black,
            brightness: Brightness.dark,
            backgroundColor: const Color(0xFF212121),
            accentColor: Colors.white,
            accentIconTheme: const IconThemeData(color: Colors.black),
            dividerColor: Colors.black12,
          ),
          themeMode:
              MyCubit.get(context).isLight ? ThemeMode.light : ThemeMode.dark,
          home: Builder(builder: (context) {
            return EasySplashScreen(
                logo: Image.asset("assets/images/logo.png"),
                logoWidth: MediaQuery.of(context).size.width * 0.18,
                title: Text("Hayah",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
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
      listener: (context, state) {},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
