import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hayah/model/report_model.dart';
import 'package:hayah/shared/services.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart' as geo;
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
import 'package:rflutter_alert/rflutter_alert.dart';
import '../model/dicount_image_model.dart';
import '../model/discount_image_data_model.dart';
import '../model/doctor_model.dart';
import '../model/donor_model.dart';
import '../screens/doctor/add_report.dart';
import '../screens/doctor/home_doctor..dart';
import '../screens/doner/home_screen.dart';
import '../screens/login_screen.dart';
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

  List<TextEditingController> controllers =
      List.generate(19, (index) => TextEditingController());

  List<RepoAddModel> repos = [
    // RepoAddModel("Donor email: ", "", TextEditingController()),
    RepoAddModel("Donor ID: ", "", TextEditingController()),
    RepoAddModel("Status: ", "", TextEditingController()),
    RepoAddModel("Reason: ", "", TextEditingController()),
    RepoAddModel("Hemoglobin", "g%", TextEditingController()),
    RepoAddModel(
        "Red blood cell count", "million/cmm", TextEditingController()),
    RepoAddModel("MCH", "pg", TextEditingController()),
    RepoAddModel("MCV", "fl", TextEditingController()),
    RepoAddModel("MCHC", "g/dl", TextEditingController()),
    RepoAddModel("Platelet count", "Thousand/cmm", TextEditingController()),
    RepoAddModel("HBA1c", "%", TextEditingController()),
    RepoAddModel("SGOT-AST", "", TextEditingController()),
    RepoAddModel("SGPT-ALT", "", TextEditingController()),
    RepoAddModel("Blood urea", "u/l", TextEditingController()),
    RepoAddModel("Serum creatinine", "", TextEditingController()),
    RepoAddModel("Serum uric acid", "", TextEditingController()),

    RepoAddModel("HIV_Antibody", "", TextEditingController()),
    RepoAddModel("HBs_Antigen", "", TextEditingController()),
    RepoAddModel("HCV_Ab_lgG", "", TextEditingController()),
    RepoAddModel("VDRL", "", TextEditingController()),
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
      print("PP " + currentLatLng.toString());
      getCenters();

      _addMarker(currentLatLng!, "Your Current Location");
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

  // addMarker() async {
  //   Uint8List img = await getBytesFromAsset("assets/images/icon.png", 60);
  //   final marker = Marker(
  //     markerId: MarkerId('place_name'),
  //     position: LatLng(currentLatLng!.latitude, currentLatLng!.latitude),
  //     icon: BitmapDescriptor.fromBytes(img),
  //     infoWindow: InfoWindow(
  //       title: 'title',
  //       snippet: 'address',
  //     ),
  //   );
  //   markers[MarkerId('place_name')] = marker;
  //   emit(addMarkerState());
  // }

  void _addMarker(LatLng latLng, name) {
    markersNew.add(
      Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        infoWindow: InfoWindow(title: name),
      ),
    );
    emit(addMarkerState());
  }

  GoogleMapController? _controller;

  final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(0, 0),
    zoom: 14.0,
  );
  Set<Marker> markersNew = {};

  showPlacePicker(BuildContext context) async {
    final currentPosition = await Geolocator.getCurrentPosition();
    print("Hello + " + currentPosition.latitude.toString());
    final LatLng initialPosition = LatLng(
      currentPosition.latitude,
      currentPosition.longitude,
    );
    markersNew.add(
      Marker(
        markerId: MarkerId(initialPosition.toString()),
        position: initialPosition,
        infoWindow: InfoWindow(title: "Your Current Location"),
      ),
    );
    emit(addMarkerState());
    _controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: initialPosition, zoom: 14.0),
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: markersNew,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              onTap: (LatLng latLng) {
                //_addMarker(latLng);
                print("Hello");
              },
            ),
          ),
          // RaisedButton(
          //   child: Text('Save'),
          //   onPressed: () {
          //     Navigator.pop(context);
          //     // Handle saving the selected location
          //   },
          // ),
        ],
      ),
    );
  }

  void showPlacePickerTwo(context) async {
    // getCurrentLocation();
    //getLocation();
    LocationResult? result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyAgBU810fLDtsyrd1Q9glWGhYyOdPLHnSc")));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomeDoctor()));

    // Handle the result in your way
    print("LatLng ${result!.latLng}");
  }

//Bye Bye
  void signUp(ufname, ulname, email, age, blood, pass, gender, address, phone,
      context) async {
    String result = "";
    emit(signupLoadingState());
    print(baseUrl);
    await http.post(Uri.parse(baseUrl + "/register"),
        body: jsonEncode({
          "ufname": ufname,
          "ulname": ulname,
          "uemail": email,
          "upassword": pass,
          "uphone": phone,
          "Gender": gender,
          "blood_types": blood,
          "uAddress": address,
          "uage": age
        }),
        headers: {"content-type": "application/json"}).then((value) {
      print(value.body);
      result = jsonDecode(value.body)["message"];
      emit(signupSuccessState());

      ///
      ///
      ///
      ///

      Alert(
        context: context,
        type: AlertType.success,
        title: "Registered Successfully",
        desc: result,
        buttons: [
          DialogButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          )
        ],
      ).show();
    }).catchError((e) {
      result = e.toString();

      print(e.toString());
      emit(signupFailState());
      Alert(
        context: context,
        type: AlertType.error,
        title: "Register Failed",
        desc: result,
        buttons: [
          DialogButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          )
        ],
      ).show();
    });
  }

  var selectedVal = "Donor";

  void radioVal(x) {
    print(x);
    selectedVal = x;
    emit(radioValChanged());
  }

  login(type, email, password, context) async {
    emit(loginLoadingState());

    await http.post(Uri.parse(baseUrl + "/login_validation"),
        body: jsonEncode({"User": type, "email": email, "password": password}),
        headers: {"content-type": "application/json"}).then((value) {
      emit(loginSuccessState());
      CacheHelper.saveData(key: isLogged, value: true);
      if (value.body.contains("!doctype html")) {
        errorLoginChecker();
      } else {
        if (type == "Donor") {
          CacheHelper.saveData(key: isDonner, value: true);
          donorModel = DonorModel.fromJson(jsonDecode(value.body));
          CacheHelper.saveDataString(
              key: donorData, value: jsonEncode(donorModel));
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        } else {
          CacheHelper.saveData(key: isDonner, value: false);
          CacheHelper.saveDataString(key: doctorConstant, value: "doctor_cart");
          doctorModel = DoctorModel.fromJson(jsonDecode(value.body));
          CacheHelper.saveDataString(
              key: doctorData, value: jsonEncode(doctorModel));
          MyCubit.get(context).showPlacePickerTwo(context);
        }
      }
    }).catchError((e) {
      print(e.toString());
      emit(loginFailState());
      errorLoginChecker();
    });
  }

  DonorModel? donorModel;
  DoctorModel? doctorModel;

  createReport(
      String donorId,
      String status,
      String reason,
      String mchc,
      String hba1c,
      String sgotAst,
      String sgotAlt,
      String bloodUrea,
      String serumCreatine,
      String serumUricAcid,
      String hemo,
      String redCellsCount,
      String mch,
      String mcv,
      String plateletCount,
      String hivAntibody,
      String hbsAntigen,
      String hcvAbIgg,
      String vdrl,
      context) async {
    print('Donor ID: $donorId');
    print('Status: $status');
    print('Reason: $reason');
    print('MCHC: $mchc');
    print('HbA1c: $hba1c');
    print('SGOT-AST: $sgotAst');
    print('SGPT-ALT: $sgotAlt');
    print('Blood Urea: $bloodUrea');
    print('Serum Creatinine: $serumCreatine');
    print('Serum Uric Acid: $serumUricAcid');
    print('Hemoglobin: $hemo');
    print('Red Blood Cell Count: $redCellsCount');
    print('MCH: $mch');
    print('MCV: $mcv');
    print('Platelet Count: $plateletCount');
    print('HIV Antibody: $hivAntibody');
    print('HBs Antigen: $hbsAntigen');
    print('HCV Ab IgG: $hcvAbIgg');
    print('VDRL: $vdrl');
    emit(createReportLoadingState());

    await http.post(Uri.parse(baseUrl + "/create_report"),
        body: jsonEncode({
          "donor_id": donorId,
          "doctor_id":
              "${jsonDecode(CacheHelper.getData(key: doctorData))["id"]}",
          "status": status,
          "reason": reason,
          "mchc": mchc,
          "hba1c": hba1c,
          "sgot_ast": sgotAst,
          "sgot_alt": sgotAlt,
          "blood_urea": bloodUrea,
          "serum_creatine": serumCreatine,
          "serum_uric_acid": serumUricAcid,
          "hemo": hemo,
          "red_cells_count": redCellsCount,
          "mch": mch,
          "mcv": mcv,
          "platelet_count": plateletCount,
          "HIV_Antibody": hivAntibody,
          "HBs_Antigen": hbsAntigen,
          "HCV_Ab_lgG": hcvAbIgg,
          "VDRL": vdrl,
        }),
        headers: {"content-type": "application/json"}).then((value) {
      print(value.body);
      emit(createReportSuccessState());
      Alert(
        context: context,
        type: AlertType.success,
        title: "Created Successfully",
        desc: jsonDecode(value.body)["message"],
        buttons: [
          DialogButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              controllers.forEach((element) {
                element.clear();
              });
            },
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          )
        ],
      ).show();
    }).catchError((e) {
      print(e.toString());
      emit(createReportFailState());
      Alert(
        context: context,
        type: AlertType.error,
        title: "Failed to create a new report",
        desc: "",
        buttons: [
          DialogButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          )
        ],
      ).show();
    });
  }

  void deleteAccount(context) async {
    emit(deleteAccountLoadingState());
    await http.post(Uri.parse(baseUrl + "/DeletAccount"),
        body: jsonEncode({
          "id": CacheHelper.getData(key: isDonner)
              ? jsonDecode(CacheHelper.getData(key: donorData))["id"]
              : jsonDecode(CacheHelper.getData(key: doctorData))["id"],
          "type": CacheHelper.getData(key: isDonner) ? "Donor" : "Doctor"
        }),
        headers: {"content-type": "application/json"}).then((value) {
      CacheHelper.sharedPreferences!.clear();
      CacheHelper.saveData(key: isLogged, value: false);
      CacheHelper.saveData(key: isFirstTime, value: false);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      emit(deleteAccountSuccessState());
      print(value.body);
    }).catchError((e) {
      print(e.toString());
      emit(deleteAccountFailState());
    });
  }

  updateData(address, phone, password, code, context) async {
    print(address);
    DonorModel d =
        DonorModel.fromJson(jsonDecode(CacheHelper.getData(key: donorData)));
    print(d.address);
    d.address = address;
    d.phone = phone;
    print(jsonEncode(d));
    CacheHelper.saveDataString(key: donorData, value: jsonEncode(d).toString())
        .whenComplete(() {});
    emit(updateDataLoadingState());
    await http.post(Uri.parse(baseUrl + "/updateDonorInfo"),
        body: jsonEncode({
          "id": jsonDecode(CacheHelper.getData(key: donorData))["id"],
          "address": address,
          "phone": phone,
          if (password != "") "password": password,
          "code": code
        }),
        headers: {"content-type": "application/json"}).then((value) {
      emit(updateDataSuccessState());
      print(value.body);
    }).catchError((e) {
      print(e.toString());
      emit(updateDataFailState());
    });
  }

  sendOtp(address, phone, passwrod, context) async {
    emit(sendOtptLoadingState());
    await http.post(Uri.parse(baseUrl + "/send-sms"),
        body: jsonEncode({
          "phone_number":
              jsonDecode(CacheHelper.getData(key: donorData))["phone"],
        }),
        headers: {"content-type": "application/json"}).then((value) {
      emit(sendOtptSuccessState());
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
                  textStyle: TextStyle(color: Colors.white),
                  showFieldAsBox: false,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    print(verificationCode);
                    updateData(
                        address, phone, passwrod, verificationCode, context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Updated Successfuly")));
                    Future.delayed(Duration(seconds: 3), () {
                      Navigator.pop(context);
                    });
                  }, // end onSubmit
                ),
              ],
            );
          });
      print(value.body);
    }).catchError((e) {
      print(e.toString());
      emit(sendOtptFailState());
    });
  }

  DiscountImageModel? discountImageModel;

  void getDiscountsImage() async {
    emit(getDiscImageLoadingState());
    await http.post(Uri.parse(baseUrl + "/getDiscountImage"),
        body: jsonEncode({
          "id": "2"
          //"id": jsonDecode(CacheHelper.getData(key: doctorData))["id"]
        }),
        headers: {"content-type": "application/json"}).then((value) {
      print(value.body);
      emit(getDiscImageSuccessState());
      discountImageModel = DiscountImageModel.fromJson(jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
      emit(getDiscImageFailState());
    });
  }

  DiscountImageDataModel? discountImageDataModel;

  void getDiscountsImageData() async {
    emit(getDiscImageDataLoadingState());
    await http.get(
        Uri.parse(baseUrl +
            "/getDiscountDataFromImage/${discountImageModel!.key.toString()}"),
        headers: {"content-type": "application/json"}).then((value) {
      discountImageDataModel =
          DiscountImageDataModel.fromJson(jsonDecode(value.body));
      emit(getDiscImageDataSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(getDiscImageDataFailState());
    });
  }

  //List<int> notificationsIds = [];

  void getNotificationsId() async {
    emit(getNotificationIdsLoadingState());
    await http.post(Uri.parse(baseUrl + "/getDiscountNotificationID"),
        body: jsonEncode({
          "id": "2"
          //"id": jsonDecode(CacheHelper.getData(key: donorData))["id"]
        }),
        headers: {"content-type": "application/json"}).then((value) {
      print(value.body);
      //notificationsIds.addAll(jsonDecode(value.body));
      jsonDecode(value.body).forEach((e) {
        getNotificationneData(e);
      });
      emit(getNotificationIdsSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(getNotificationIdsFailState());
    });
  }

  List<DiscountImageDataModel>? notificationData = [];

  void getNotificationneData(int id) async {
    emit(getDiscImageDataLoadingState());
    await http.get(Uri.parse(baseUrl + "/getDiscountDataFromImage/${id}"),
        headers: {"content-type": "application/json"}).then((value) {
      notificationData!
          .add(DiscountImageDataModel.fromJson(jsonDecode(value.body)));
      emit(getDiscImageDataSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(getDiscImageDataFailState());
    });
  }

  void getReportsId() async {
    emit(getNotificationIdsLoadingState());
    await http.post(Uri.parse(baseUrl + "/GetReportID"),
        body: jsonEncode({
          //"id": "11"
          "id": jsonDecode(CacheHelper.getData(key: donorData))["id"]
        }),
        headers: {"content-type": "application/json"}).then((value) {
      print(value.body);
      //notificationsIds.addAll(jsonDecode(value.body));
      jsonDecode(value.body).forEach((e) {
        getReportData(e);
      });
      emit(getNotificationIdsSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(getNotificationIdsFailState());
    });
  }

  List<ReportModel>? reportsData = [];
  List<int> repoIds = [];

  void getReportData(int id) async {
    repoIds.add(id);
    emit(getDiscImageDataLoadingState());
    await http.get(Uri.parse(baseUrl + "/GetReportInfo/${id}"),
        headers: {"content-type": "application/json"}).then((value) {
      print(value.body);
      reportsData!.add(ReportModel.fromJson(jsonDecode(value.body)));
      emit(getDiscImageDataSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(getDiscImageDataFailState());
    });
  }

  Future<void> getLocation() async {
    try {
      geo.Position geolocator = await Geolocator.getCurrentPosition();
      print("Geoo ${geolocator}");
    } catch (e) {
      print(e);
    }
  }

  Set<Polyline> polylines = {};

  void drawPolyline(LatLng destination) async {
    print("PolyLines + " + destination.toString());
    List<LatLng> polylineCoordinates = [];

    polylineCoordinates.add(currentLatLng!);
    polylineCoordinates.add(destination);

    Polyline polyline = Polyline(
      polylineId: PolylineId("polyline"),
      color: Colors.red,
      points: polylineCoordinates,
    );

    polylines.add(polyline);
    emit(addMarkerState());
  }

  void getCenters() async {
    print("getCenteress");
    emit(getNotificationIdsLoadingState());
    await http.post(Uri.parse(baseUrl + "/getCenters"),
        body: jsonEncode({
          "latitude": currentLatLng!.latitude,
          "longitude": currentLatLng!.longitude
        }),
        headers: {"content-type": "application/json"}).then((value) {
      drawPolyline(LatLng(jsonDecode(value.body)[0]["latitude"],
          jsonDecode(value.body)[0]["longitude"]));
      print("hhhhhhh ${value.body}");
      jsonDecode(value.body).forEach((e) {
        _addMarker(LatLng(e["latitude"], e["longitude"]), e["center"]);
      });
      //notificationsIds.addAll(jsonDecode(value.body));

      emit(getNotificationIdsSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(getNotificationIdsFailState());
    }).whenComplete(() {});
  }

// void getDonorData() async {
//   emit(getDonorDataLoadingState());
//   await http.get(Uri.parse(baseUrl + "/GetDonorAccountInfo"),
//       headers: {"content-type": "application/json"}).then((value) {
//     print(value.body);
//     donorModel = DonorModel.fromJson(jsonDecode(value.body));
//     emit(getDonorDataSuccessState());
//   }).catchError((e) {
//     print(e.toString());
//     emit(getDonorDataFailState());
//   });
// }

// void getDoctorData() async {
//   emit(getDonorDataLoadingState());
//   await http.get(Uri.parse(baseUrl + "/GetDoctorAccountInfo"),
//       headers: {"content-type": "application/json"}).then((value) {
//     print(value.body);
//     doctorModel = DoctorModel.fromJson(jsonDecode(value.body));
//     emit(getDonorDataSuccessState());
//   }).catchError((e) {
//     print(e.toString());
//     emit(getDonorDataFailState());
//   });
// }
  String dropdownValue = "Accepted";

  changeValDrop(s) {
    dropdownValue = s;
    emit(changedValDropState());
  }
}

class Quizs {
  String question, alert;

  Quizs(this.question, this.alert);
}

class RepoAddModel {
  String? item, sign;
  TextEditingController? controller;

  RepoAddModel(this.item, this.sign, this.controller);
}
