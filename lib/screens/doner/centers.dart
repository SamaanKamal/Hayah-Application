import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hayah/cubit/app_cubit.dart';
import 'package:hayah/cubit/app_states.dart';

class CentersScreen extends StatefulWidget {
  CentersScreen({super.key});

  @override
  State<CentersScreen> createState() => _CentersScreenState();
}

class _CentersScreenState extends State<CentersScreen> {
  late GoogleMapController mapController;
  BitmapDescriptor? myIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBytesFromAsset('assets/images/icon.png', 64).then((onValue) {
      setState(() {
        myIcon = BitmapDescriptor.fromBytes(onValue);
      });
    });

    // BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration(size: Size(48, 48)), 'assets/images/icon.png')
    //     .then((onValue) {
    //   myIcon = onValue;
    // });
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    var codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<MyCubit>(context)..getCurrent(),
        child: BlocConsumer<MyCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: (state is initiaGetLocationState || myIcon == null)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target:
                            MyCubit.get(context).currentLatLng ?? LatLng(0, 0),
                        zoom: 15.0,
                      ),
                      markers: {
                          Marker(
                            markerId: MarkerId("hello"),
                            infoWindow: InfoWindow(
                              title: "Your location",
                            ),
                            position: MyCubit.get(context).currentLatLng ??
                                LatLng(0, 0),
                            icon: myIcon ?? BitmapDescriptor.defaultMarker,
                          )
                        }),
            );
          },
        ));
  }
}
