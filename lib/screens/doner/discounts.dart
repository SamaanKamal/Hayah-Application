import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';
import 'package:hayah/screens/doner/discount_details.dart';

class DiscountsScreen extends StatefulWidget {
  const DiscountsScreen({super.key});

  @override
  State<DiscountsScreen> createState() => _DiscountsScreenState();
}

class _DiscountsScreenState extends State<DiscountsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyCubit.get(context).getDiscountsImage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCubit, AppStates>(
      builder: (context, state) {
        return BlocListener<MyCubit, AppStates>(
          listener: (context, state) {},
          child: Scaffold(
            body: state is getDiscImageLoadingState
                ? Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  )
                : ListView(
                    children: List.generate(
                        1,
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
                                  child: Image.network(MyCubit.get(context)
                                      .discountImageModel!
                                      .Image_Link
                                      .toString()),
                                ),
                              ),
                            ))),
          ),
        );
      },
    );
  }
}
