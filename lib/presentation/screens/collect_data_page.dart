import 'package:flutter/material.dart';
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

    return SafeArea(
      child: Scaffold(
        body: ListView(
            children: getCoordinate.dataList.map((data) {
          return CardLocation(
            librarry: 'Data Location',
            description: "Powered by Prahastha",
            dataCoordinate: data,
            onTap: () {},
            statusButton: getCoordinate.statusButton,
            onTapGoToNav: () {},
            hideAllButton: true,
          );
        }).toList()),
      ),
    );
  }
}
