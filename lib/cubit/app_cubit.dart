import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hayah/screens/doner/about_us_screen.dart';
import 'package:hayah/screens/doner/centers.dart';
import 'package:hayah/screens/doner/discounts.dart';
import 'package:hayah/screens/doner/faq_screen.dart';
import 'package:hayah/screens/doner/home.dart';
import 'package:hayah/screens/notification_screen.dart';
import 'package:hayah/shared/components/noti.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../screens/doner/home_screen.dart';
import '../shared/constants.dart';
import 'app_states.dart';

class MyCubit extends Cubit<AppStates> {
  MyCubit() : super(initialAppStates());
  static MyCubit get(context) => BlocProvider.of(context);
  bool isLightCubit = true;
  bool pushNoti = true;
  changePush() {
    pushNoti = !pushNoti;
    emit(SaveModeState());
  }

  changeMode() {
    this.isLightCubit = !this.isLightCubit;
    CacheHelper.saveData(key: isLight, value: isLightCubit);
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
    NotificationScreen(),
    CentersScreen(),
    DiscountsScreen(),
    FAQScreen(),
    HomeSecondScreen()
  ];
  List<IconData> iconList = [
    Icons.notifications,
    FontAwesomeIcons.suitcaseMedical,
    FontAwesomeIcons.moneyBill1,
    FontAwesomeIcons.circleQuestion,
  ];
  int activeIndex = 0;
  int notActiveIndex = 1;
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

  CarouselController buttonCarouselController = CarouselController();
  List<Widget> items = [
    ClipRRect(
        child: Image.asset("assets/images/22.jpg", fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(25)),
    ClipRRect(
        child: Image.asset("assets/images/11.png", fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(25)),
    ClipRRect(
        child: Image.asset("assets/images/7.jpg", fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(25)),
  ];
  int index = 0;
  changedIndex(int x, CarouselPageChangedReason d) {
    index = x;
    emit(changedIndexCarouselState());
  }

  List<String> discountsImages = [
    "assets/images/d1.jpg",
    "assets/images/d2.jpg"
  ];

  List<NotificationCard> notis = [
    NotificationCard("Welcome to our app!", "12:00 AM"),
    NotificationCard("You are in top 10 donors this week!", "02:00 PM"),
  ];
  String blood_type = "A positive";
  changeBlood(val) {
    blood_type = val;
    emit(changedBloodState());
  }

  List<Quizs> asks = [
    Quizs("هل أصبت ، أو أصبت بأي من أمراض القلب ؟",
        "قد يتسبب ذلك في خطوره عليك التواصل مع طبيبك لمعرفه ما اذا كان بامكانك التبرع."),
    Quizs(
        "هل أنت حامل ، أو أنجبت طفلاً ، أو أجهضت أو تم إجهاضك في الأشهر الستة الماضية؟",
        "إذا كنت حاملا و استمر حملك لأكثر من 12 أسبوعًا ، فيرجى الانتظار حتى انقضاء 6 أشهر من نهاية الحمل قبل التبرع بالدم."),
    Quizs("هل تلقيت تطعيم ضد فيروس كورونا خلال الـ 48 ساعة الماضية؟",
        "سيؤثر تلاقي التطعيم ضد فيروس كورونا خلال ال 48 ساعه الماضيه ع التبرع بالدم."),
    Quizs(
        "في الأسابيع الأربعة الماضية ، هل كنت على اتصال بأي شخص مصاب بمرض معدي؟",
        "عليك الانتظار قليلا حتى تتاكد من عدم نقل العدوى اليك وبعدها يمكنك التبرع."),
    Quizs(
        "هل اصبت بأي عدوى في آخر اسبوعين او تناولت اي مضادات حيويه خلال اخر سبع ايام؟",
        "اسف يجب ان تتعافى جيدا و يمضى ع الاقل 14 يوما ع التعافي."),
    Quizs(
        "في الأشهر الأربعة الماضية ، هل حصلت على وشم أو مكياج شبه دائم أو أي علاجات تجميلية تضمنت ثقب الجلد؟",
        "ناسف يجب عليك الانتظار لسته اشهر على الاقل قبل التبرع بالدم."),
  ];
  String everyThingIsGood =
      "رائعة! لقد اجتزت اختبار الأهلية الأساسي الخاص بنا ويبدو أنه يمكنك التبرع بالدم. نحن نتطلع إلى رؤيتكم قريبا. يرجى تذكر أن هذا المدقق غطى فقط الأسباب الأكثر شيوعًا التي تمنع الأشخاص من التبرع بالدم وأن معايير الأهلية الأخرى تنطبق. يتخذ موظفونا القرار النهائي بشأن ما إذا كان يمكنك التبرع بالدم عند حضور موعد التبرع الخاص بك.";

  int counter = 0;
  plusCounter(x) {
    if (x == 0)
      counter = 0;
    else
      counter++;
    emit(changedCounterState());
  }
}

class Quizs {
  String question, alert;
  Quizs(this.question, this.alert);
}
