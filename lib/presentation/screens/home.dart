import 'package:flutter/material.dart';
import 'package:get_location/models/data_coordinate.dart';
import 'package:get_location/presentation/providers/get_coordinate_provider.dart';
import 'package:get_location/presentation/widgets/card/card_location.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final GetCoordinate = Provider.of<GetCoordinateProvider>(context);

    return ListView(
      children: [
        CardLocation(
          librarry: 'Geolocation Stp 1',
          description:
              'geolocator v12.0.0 | getCurrentPosition | no modification',
          dataCoordinate: GetCoordinate.dataGeolocationV1,
          onTap: () => GetCoordinate.getGeolocationStp1(),
        ),
      ],
    );
  }
}
