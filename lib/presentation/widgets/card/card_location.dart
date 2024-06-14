import 'package:flutter/material.dart';
import 'package:get_location/models/data_coordinate.dart';
import 'package:get_location/presentation/widgets/text/text_b_12_black.dart';
import 'package:get_location/presentation/widgets/text/text_b_16_black.dart';
import 'package:get_location/presentation/widgets/text/text_n_12_grey.dart';

class CardLocation extends StatefulWidget {
  final String librarry;
  final String description;
  final DataLonLatDate dataCoordinate;
  final Function onTap;
  final bool statusButton;

  const CardLocation({
    super.key,
    required this.librarry,
    required this.description,
    required this.dataCoordinate,
    required this.onTap,
    required this.statusButton,
  });

  @override
  State<CardLocation> createState() => _CardLocationState();
}

class _CardLocationState extends State<CardLocation> {
  static wrapUi(String title, String content) {
    return Wrap(
      children: [
        TextB12Black(
          text: title,
          color: Colors.white,
        ),
        TextN12grey(
          text: content,
          color: Colors.white,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
        bottom: 5,
      ),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          width: 1.0,
          color: Colors.white,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextB16Black(
            text: widget.librarry,
            color: Colors.grey.shade400,
          ),
          TextN12grey(
            text: widget.description,
            paddingTop: 5,
            paddingBottom: 5,
          ),
          wrapUi('Latitude: ', widget.dataCoordinate.lat.toString()),
          wrapUi('Longitude: ', widget.dataCoordinate.lon.toString()),
          wrapUi('Date Time: ', widget.dataCoordinate.dateTime),
          wrapUi('Duration: ', widget.dataCoordinate.durationInSec.toString()),
          wrapUi('Akurasi: ', widget.dataCoordinate.accuracy.toString()),
          InkWell(
            onTap: () => widget.statusButton ? widget.onTap() : () {},
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: widget.statusButton ? Colors.white : Colors.grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: TextB12Black(
                  text: 'Get Coordinate ${widget.statusButton}',
                  color: Colors.blue,
                  align: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
