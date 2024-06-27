import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:get_location/presentation/providers/get_coordinate_provider.dart';
import 'package:get_location/presentation/widgets/card/card_location.dart';
import 'package:provider/provider.dart';

import '../providers/get_coordinate_provider.dart';

class CollectDataPage extends StatefulWidget {
  const CollectDataPage({super.key});

  @override
  State<CollectDataPage> createState() => _CollectDataPageState();
}

class _CollectDataPageState extends State<CollectDataPage> {
  var countGetDataFirst = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getCoordinate = Provider.of<GetCoordinateProvider>(context);

    // if (countGetDataFirst == 0) {
    //   Timer(const Duration(seconds: 3), () {
    //     getCoordinate.getDataList();
    //     countGetDataFirst++;
    //   });
    // }

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            // CardLocation(
            //   librarry: 'Geolocation Stp 1',
            //   description:
            //       'geolocator v12.0.0 | getCurrentPosition | no modification',
            //   dataCoordinate: getCoordinate.dataGeolocationV1,
            //   onTap: () => getCoordinate.getGeolocationStp1(),
            //   statusButton: getCoordinate.statusButton,
            // ),
            // CardLocation(
            //   librarry: 'Native GPS Only',
            //   description: 'Briging Native Function for get coordinate GPS Only',
            //   dataCoordinate: getCoordinate.dataGPSOnly,
            //   onTap: () => getCoordinate.briggingToNative('getCoordinatesGPSOnly'),
            //   statusButton: getCoordinate.statusButton,
            // ),
            // CardLocation(
            //   librarry: 'Native AGPS Only',
            //   description: 'Briging Native Function for get coordinate AGPS Only',
            //   dataCoordinate: getCoordinate.dataAGPSOnly,
            //   onTap: () => getCoordinate.briggingToNative('getCoordinatesAGPSOnly'),
            //   statusButton: getCoordinate.statusButton,
            // ),
          ],
        ),
      ),
    );
  }
}
