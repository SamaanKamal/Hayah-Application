import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_faq/flutter_faq.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSecondScreen extends StatelessWidget {
  HomeSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: ListView(children: [
          // Column(children: <Widget>[
          //   SizedBox(height: 10),
          //   CarouselSlider(
          //     items: MyCubit.get(context).items,
          //     carouselController: MyCubit.get(context).buttonCarouselController,
          //     options: CarouselOptions(
          //       autoPlay: true,
          //       onPageChanged: MyCubit.get(context).changedIndex,
          //       enlargeCenterPage: true,
          //       viewportFraction: 0.9,
          //       aspectRatio: 2.0,
          //       initialPage: 0,
          //     ),
          //   ),
          //   SizedBox(height: 5),
          //   AnimatedSmoothIndicator(
          //     activeIndex: MyCubit.get(context).index,
          //     count: MyCubit.get(context).items.length,
          //     effect: WormEffect(
          //         spacing: 8.0,
          //         radius: 4.0,
          //         dotWidth: 20.0,
          //         dotHeight: 10.0,
          //         paintStyle: PaintingStyle.stroke,
          //         strokeWidth: 1.5,
          //         dotColor: Colors.grey,
          //         activeDotColor: Colors.red),
          //   ),
          //   SizedBox(height: 10),
          // ]),
          Container(
            height: 200,
            decoration: BoxDecoration(color: Colors.red.shade400),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("كيف التبرع بالدم يساعد المرضي ؟",
                  style: TextStyle(fontFamily: "Quicksand", fontSize: 25)),
              SizedBox(
                height: 5,
              ),
              Text("لديك القدرة على إنقاذ الأرواح")
            ]),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("من تستطيع المساعدة عبر التبرع بالدم؟",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "كل يوم، يحتاج المرضى من جميع الأعمار إلى عمليات نقل دم. من الرُضّع إلى الكبار. ضحايا الحروق والحوادث، مرضى الثلاسيميا، مرضى الخلايا المنجلية، مرضى جراحة القلب، مرضى زرع الأعضاء، ومرضى السرطان. في الواقع، يحتاج بعض مرضى الثلاسيميا والسرطان إلى دم يومياً"),
              )
            ],
          ),
          Divider(height: 20, endIndent: 20, indent: 20, color: Colors.red),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("كم مرة يمكنك التبرع بالدم؟",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "الدم الكامل : يمكن التبرع به بعد كل 56 يوما أو 08 أسبوعا. الصفائح الدموية : يمكن التبرع بالصفائح الدموية كل 7 أيام وحتى 24 مرة في السنة. البلازما : كل 28 يوما وحتى 13 مرة في السنة. الخلايا الحمراء المزدوجة : يمكن التبرع بها كل 112 يوما أو ما يصل إلى 3 مرات كل عام."))
            ],
          ),
          Divider(height: 20, endIndent: 20, indent: 20, color: Colors.red),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "نسال هذه الأسئلة حفاظا على حياتكم قبل إجراء أى شئ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Text(MyCubit.get(context)
                      .asks[MyCubit.get(context).counter]
                      .question),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "Danger",
                              desc: MyCubit.get(context)
                                  .asks[MyCubit.get(context).counter]
                                  .alert,
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    MyCubit.get(context).plusCounter(0);
                                    Navigator.pop(context);
                                  },
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(116, 116, 191, 1.0),
                                    Color.fromRGBO(52, 138, 199, 1.0)
                                  ]),
                                )
                              ],
                            ).show();
                          },
                          child: Text("Yes"),
                          color: Colors.red,
                        ),
                        Spacer(),
                        MaterialButton(
                          onPressed: () {
                            if (MyCubit.get(context).counter ==
                                (MyCubit.get(context).asks.length - 1)) {
                              MyCubit.get(context).plusCounter(0);
          
                              Alert(
                                context: context,
                                type: AlertType.success,
                                title: "All is done",
                                desc: MyCubit.get(context).everyThingIsGood,
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      MyCubit.get(context).plusCounter(0);
                                      Navigator.pop(context);
                                    },
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(116, 116, 191, 1.0),
                                      Color.fromRGBO(52, 138, 199, 1.0)
                                    ]),
                                  )
                                ],
                              ).show();
                            } else
                              MyCubit.get(context).plusCounter(1);
                          },
                          color: Colors.red,
                          child: Text("No"),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          SizedBox(height: 10),
        ]),
      ),
    );
  }
}
