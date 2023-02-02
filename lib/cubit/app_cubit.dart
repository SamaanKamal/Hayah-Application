import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hayah/screens/doner/about_us_screen.dart';
import 'package:hayah/screens/doner/centers.dart';
import 'package:hayah/screens/doner/discounts.dart';
import 'package:hayah/screens/doner/faq_screen.dart';
import 'package:hayah/screens/doner/home.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../screens/doner/home_screen.dart';
import 'app_states.dart';

class MyCubit extends Cubit<AppStates> {
  MyCubit() : super(initialAppStates());
  static MyCubit get(context) => BlocProvider.of(context);
  bool isLight = true;
  changeMode() {
    this.isLight = CacheHelper.getData(key: isLight) ?? true;
    emit(SaveModeState());
  }

  List<PageViewModel> introPages = [
    PageViewModel(
      title: "Easy donation",
      body: "Find where to donate close to your current location.",
      image: Image.asset("assets/images/3.jpg"),
    ),
    PageViewModel(
      title: "Safe donation",
      body: "Check guidelines about medicines, health conditions and travel.",
      image: Image.asset("assets/images/7.jpg"),
    ),
    PageViewModel(
      title: "Best app to donate with",
      body: "Receive messages when we need your help.",
      image: Image.asset("assets/images/4.jpg"),
    ),
  ];
  List<Widget> screens = [
    AboutUsScreen(),
    CentersScreen(),
    DiscountsScreen(),
    FAQScreen(),
    HomeSecondScreen()
  ];
  List<IconData> iconList = [
    FontAwesomeIcons.info,
    FontAwesomeIcons.fileMedical,
    FontAwesomeIcons.moneyBill1,
    FontAwesomeIcons.circleQuestion,
  ];
  int activeIndex = 0;
  int notActiveIndex = 0;
  changeIndex(int x) {
    if (x == 4)
      notActiveIndex = 1;
    else {
      activeIndex = x;
      notActiveIndex = 0;
    }
    ;
    emit(changeIndexState());
  }
}
