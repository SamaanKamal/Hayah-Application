import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hayah/screens/doner/about_us_screen.dart';
import 'package:hayah/screens/doner/centers.dart';
import 'package:hayah/screens/doner/discounts.dart';
import 'package:hayah/screens/doner/faq_screen.dart';
import 'package:hayah/screens/doner/home.dart';
import 'package:hayah/screens/doner/notification_screen.dart';
import 'package:hayah/shared/components/hist.dart';
import 'package:hayah/shared/components/noti.dart';
import 'package:hayah/shared/network/local/sharedPrefHelper.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:place_picker/place_picker.dart';
import '../screens/doctor/add_report.dart';
import '../screens/doctor/home_doctor..dart';
import '../screens/doner/home_screen.dart';
import '../shared/constants.dart';
import 'app_states.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    NotificationCard(
        "Dear ${CacheHelper.getData(key: "user") == null ? 'Sohila Elsaid' : jsonDecode(CacheHelper.getData(key: "user"))["name"].toString()}, you got discount to ....",
        "07:30 PM",
        "Discount".toUpperCase()),
    NotificationCard(
        "Dear ${CacheHelper.getData(key: "user") == null ? 'Sohila Elsaid' : jsonDecode(CacheHelper.getData(key: "user"))["name"].toString()}, you got new report",
        "02:00 PM",
        "New Report".toUpperCase()),
    NotificationCard(
        "Dear ${CacheHelper.getData(key: "user") == null ? 'Sohila Elsaid' : jsonDecode(CacheHelper.getData(key: "user"))["name"].toString()}, you got discount to ....",
        "01:30 PM",
        "Discount".toUpperCase()),
    NotificationCard(
        "Dear ${CacheHelper.getData(key: "user") == null ? 'Sohila Elsaid' : jsonDecode(CacheHelper.getData(key: "user"))["name"].toString()}, we need your donation.",
        "11:00 AM",
        "Critical situation".toUpperCase()),
  ];
  List<HistoryCard> histories = [
    HistoryCard(
        "For more details click here", "11:00 AM", "Rejected".toUpperCase()),
    HistoryCard(
        "For more details click here", "9:00 AM", "accepted".toUpperCase()),
  ];
  String blood_type = "A positive";
  changeBlood(val) {
    blood_type = val;
    emit(changedBloodState());
  }

  List<Quizs> asks = [
    Quizs("Do you have, or have you had, any heart disease?",
        "This may make it dangerous for you to contact your doctor to see if you can donate."),
    Quizs(
        "Are you pregnant, have a baby, had a miscarriage or had an abortion in the past six months?",
        "If you are pregnant and your pregnancy lasts more than 12 weeks, please wait until 6 months have passed from the end of your pregnancy before donating blood."),
    Quizs("Have you been vaccinated against coronavirus in the past 48 hours?",
        "Convergence of coronavirus vaccination in the past 48 hours will affect blood donation."),
    Quizs(
        "In the past 4 weeks, have you been in contact with anyone with an infectious disease?",
        "You have to wait a little while to make sure that the infection is not transmitted to you, and then you can donate."),
    Quizs(
        "Have you had any infections in the last two weeks or taken any antibiotics in the last seven days?",
        "Sorry, you should recover well, and at least 14 days will pass for recovery."),
    Quizs(
        "In the past 4 months, have you had tattoos, semi-permanent makeup, or any cosmetic treatments that have involved skin piercings?",
        "We regret that you must wait at least six months before donating blood."),
  ];
  String everyThingIsGood =
      "amazing! You have passed our basic eligibility test and it appears you can donate blood. We look forward to seeing you soon. Please remember that this checker only covered the most common reasons people stop donating blood and that other eligibility criteria apply. Our staff makes the final decision about whether you can donate blood when you attend your donation appointment.";

  int counter = 0;
  plusCounter(x) {
    if (x == 0)
      counter = 0;
    else
      counter++;
    emit(changedCounterState());
  }

  String errorLogin = "Wrong email or password!";
  bool isError = false;
  void errorLoginChecker() {
    isError = true;
    emit(errorLoginState());
  }

  List<RepoAddModel> repos = [
    RepoAddModel("Donor email: ", ""),
    RepoAddModel("Donor ID: ", ""),
    RepoAddModel("Hemoglobin", "g%"),
    RepoAddModel("Red blood cell count", "million/cmm"),
    RepoAddModel("MCH", "pg"),
    RepoAddModel("MCV", "fl"),
    RepoAddModel("MCHC", "g/dl"),
    RepoAddModel("Platelet count", "Thousand/cmm"),
    RepoAddModel("HBA1c", "%"),
    RepoAddModel("SGOT-AST", ""),
    RepoAddModel("SGPT-ALT", ""),
    RepoAddModel("Blood urea", "u/l"),
    RepoAddModel("Serum creatinine", ""),
    RepoAddModel("Serum uric acid", ""),
  ];
  // GeocodingResult? result;
  // getLocation(GeocodingResult x) {
  //   result = x;
  //   emit(getLocationState());
  // }

  // loc.Location currentLocation = loc.Location();
  // loc.LocationData? location;
  // void getCurrentLocation() async {
  //   location = await currentLocation.getLocation();
  //   currentLocation.onLocationChanged.listen((loc.LocationData loc) {
  //     // _controller
  //     //     ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
  //     //   target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
  //     //   zoom: 12.0,
  //     // )));
  //     print("JJ");
  //     print(loc.latitude);
  //     print(loc.longitude);
  //     print("JJ");
  //     emit(getLocationState());
  //   });
  // }
  LatLng? currentLatLng = LatLng(0, 0);
  getCurrent() {
    emit(initiaGetLocationState());
    Geolocator.getCurrentPosition().then((currLocation) {
      currentLatLng = new LatLng(currLocation.latitude, currLocation.longitude);
      addMarker();
      emit(getLocationState());
    });
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    var codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  addMarker() async {
    Uint8List img = await getBytesFromAsset("assets/images/icon.png", 60);
    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(currentLatLng!.latitude, currentLatLng!.latitude),
      icon: BitmapDescriptor.fromBytes(img),
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    markers[MarkerId('place_name')] = marker;
    emit(addMarkerState());
  }

  void showPlacePicker(context) async {
    // getCurrentLocation();
    LocationResult? result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyAgBU810fLDtsyrd1Q9glWGhYyOdPLHnSc")));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomeDoctor()));
    // Handle the result in your way
    print(result);
  }
}

class Quizs {
  String question, alert;
  Quizs(this.question, this.alert);
}

class RepoAddModel {
  String? item, sign;
  RepoAddModel(this.item, this.sign);
}
