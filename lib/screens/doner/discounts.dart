import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/doner/discount_details.dart';

class DiscountsScreen extends StatelessWidget {
  const DiscountsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCubit, AppStates>(
      builder: (context, state) {
        return BlocListener<MyCubit, AppStates>(
          listener: (context, state) {},
          child: Scaffold(
            body: ListView(
                children: List.generate(
                    MyCubit.get(context).discountsImages.length,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DiscountDetailsScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                  MyCubit.get(context).discountsImages[index]),
                            ),
                          ),
                        ))),
          ),
        );
      },
    );
  }
}
