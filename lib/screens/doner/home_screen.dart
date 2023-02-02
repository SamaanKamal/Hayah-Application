import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_faq/flutter_faq.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSecondScreen extends StatelessWidget {
  HomeSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCubit, AppStates>(
      builder: (context, state) {
        return BlocListener<MyCubit, AppStates>(
          listener: (context, state) {},
          child: Scaffold(
            body: ListView(children: [
              Column(children: <Widget>[
                SizedBox(height: 10),
                CarouselSlider(
                
                  items: MyCubit.get(context).items,
                  carouselController:
                      MyCubit.get(context).buttonCarouselController,
                  options: CarouselOptions(
                    autoPlay: true,
                    onPageChanged: MyCubit.get(context).changedIndex,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 0,
                  ),
                ),
                SizedBox(height: 5),
                AnimatedSmoothIndicator(
                  activeIndex: MyCubit.get(context).index,
                  count: MyCubit.get(context).items.length,
                  effect: WormEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 20.0,
                      dotHeight: 10.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.red),
                ),
                SizedBox(height: 10),

              ]),
            ]),
          ),
        );
      },
    );
  }
}
