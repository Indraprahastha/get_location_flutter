import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_location/presentation/providers/get_coordinate_provider.dart';
import 'package:get_location/presentation/screens/collect_data_page.dart';
import 'package:get_location/presentation/widgets/card/card_location.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var countGetDataFirst = 0;
  @override
  void initState() {
    super.initState();
    GetCoordinateProvider().checkFirst();
  }

  @override
  Widget build(BuildContext context) {
    var getCoordinate = Provider.of<GetCoordinateProvider>(context);

    if (countGetDataFirst == 0) {
      Timer(const Duration(seconds: 3), () {
        getCoordinate.checkFirst();
        countGetDataFirst++;
      });
    }

    return ListView(
      children: [
        CardLocation(
          librarry: 'Geolocation Stp 1',
          description:
              'geolocator v12.0.0 | getCurrentPosition | no modification',
          dataCoordinate: getCoordinate.dataGeolocationV1,
          onTap: () => getCoordinate.getGeolocationStp1(),
          statusButton: getCoordinate.statusButton,
          onTapGoToNav: () async {
            bool getAllDataCollect =
                await getCoordinate.getDataList('Geolocation');
            if (getAllDataCollect) {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CollectDataPage(),
                ),
              );
            }
          },
        ),
        CardLocation(
          librarry: 'Native GPS Only',
          description: 'Briging Native Function for get coordinate GPS Only',
          dataCoordinate: getCoordinate.dataGPSOnly,
          onTap: () => getCoordinate.briggingToNative('getCoordinatesGPSOnly'),
          statusButton: getCoordinate.statusButton,
          onTapGoToNav: () async {
            bool getAllDataCollect = await getCoordinate.getDataList('GPS');
            if (getAllDataCollect) {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CollectDataPage(),
                ),
              );
            }
          },
        ),
        CardLocation(
          librarry: 'Native AGPS Only',
          description: 'Briging Native Function for get coordinate AGPS Only',
          dataCoordinate: getCoordinate.dataAGPSOnly,
          onTap: () => getCoordinate.briggingToNative('getCoordinatesAGPSOnly'),
          statusButton: getCoordinate.statusButton,
          onTapGoToNav: () async {
            bool getAllDataCollect = await getCoordinate.getDataList('AGPS');
            if (getAllDataCollect) {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CollectDataPage(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
