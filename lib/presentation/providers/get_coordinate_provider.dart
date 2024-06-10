import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_location/models/data_coordinate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetCoordinateProvider with ChangeNotifier {
  DataLonLatDate _dataGeolocationV1 = DataLonLatDate();
  String _dataTimeStart = '';
  String _dataTimeEnd = '';
  int _duration = 0;

  DataLonLatDate get dataGeolocationV1 {
    return _dataGeolocationV1;
  }

  void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 15.0,
    );
  }

  void checkFirst() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      var dataGeolocationStp1 =
          await prefs.getString('dataGeolocationStp1') ?? '';

      if (dataGeolocationStp1.isNotEmpty) {
        var decodeDataGeolocationStp1 = jsonDecode(dataGeolocationStp1);
        _dataGeolocationV1 = DataLonLatDate.fromJson(decodeDataGeolocationStp1);
      }

      notifyListeners();
    } catch (error) {
      EasyLoading.dismiss();
      toast(error.toString());
    }
  }

  void getGeolocationStp1() async {
    final prefs = await SharedPreferences.getInstance();
    EasyLoading.show(status: 'Loading...');
    _dataTimeStart = DateTime.now().toString();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      log(position.accuracy.toString());
      _dataTimeEnd = DateTime.now().toString();
      var start = DateTime.parse(_dataTimeStart);
      var end = DateTime.parse(_dataTimeEnd);
      _duration = end.difference(start).inSeconds;

      var dataToJson = DataLonLatDate(
        lat: position.latitude,
        lon: position.longitude,
        dateTime: 'start: $_dataTimeStart - end: $_dataTimeEnd',
        durationInSec: _duration,
        accuracy: position.accuracy,
      ).toJson();

      log(jsonEncode(position));

      prefs.setString(
        'dataGeolocationStp1',
        jsonEncode(dataToJson),
      );

      checkFirst();

      EasyLoading.dismiss();
      toast('$position | $_dataTimeStart | $_dataTimeEnd');
    } catch (error) {
      EasyLoading.dismiss();
      toast(error.toString());
    }
  }
}
