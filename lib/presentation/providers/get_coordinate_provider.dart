import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_location/models/data_coordinate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetCoordinateProvider with ChangeNotifier {
  DataLonLatDate _dataGeolocationV1 = DataLonLatDate();
  DataLonLatDate _dataGPSOnly = DataLonLatDate();
  bool _statusButton = true;
  String _dataTimeStart = '';
  String _dataTimeEnd = '';
  int _duration = 0;

  DataLonLatDate get dataGeolocationV1 {
    return _dataGeolocationV1;
  }

  bool get statusButton {
    return _statusButton;
  }

  DataLonLatDate get dataGPSOnly {
    return _dataGPSOnly;
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
      var dataGeolocationStp1 = prefs.getString('dataGeolocationStp1') ?? '';
      var dataGPSOnly = prefs.getString('dataGPSOnly') ?? '';

      if (dataGeolocationStp1.isNotEmpty) {
        var decodeDataGeolocationStp1 = jsonDecode(dataGeolocationStp1);
        _dataGeolocationV1 = DataLonLatDate.fromJson(decodeDataGeolocationStp1);
        // notifyListeners();
      }

      if (dataGPSOnly.isNotEmpty) {
        var decodeDataGPSOnly = jsonDecode(dataGPSOnly);
        _dataGPSOnly = DataLonLatDate.fromJson(decodeDataGPSOnly);
        // notifyListeners();
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
    _statusButton = false;
    notifyListeners();
    try {
      // ! Get location
      log('Get location');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // ! Mapping Date Time & Duration
      log('Mapping Date Time & Duration');
      _dataTimeEnd = DateTime.now().toString();
      var start = DateTime.parse(_dataTimeStart);
      var end = DateTime.parse(_dataTimeEnd);
      _duration = end.difference(start).inSeconds;
      // ! Mapping Date Time & Duration
      log('Mapping data to Model');
      var dataToJson = DataLonLatDate(
        lat: position.latitude,
        lon: position.longitude,
        dateTime: 'start: $_dataTimeStart - end: $_dataTimeEnd',
        durationInSec: _duration,
        accuracy: position.accuracy,
      ).toJson();
      // ! Set to local storage
      log('Set to local storage');
      prefs.setString(
        'dataGeolocationStp1',
        jsonEncode(dataToJson),
      );
      // ! Get Data
      log('Get Data');
      checkFirst();
      _statusButton = true;
      EasyLoading.dismiss();
      toast('$position | $_dataTimeStart | $_dataTimeEnd');
    } catch (error) {
      _statusButton = true;
      EasyLoading.dismiss();
      toast(error.toString());
      notifyListeners();
    }
  }

  void briggingToNative(String ind) async {
    // const platform = MethodChannel('com.prahastha.get_location/native');
    const MethodChannel channel = MethodChannel('location_service');

    final prefs = await SharedPreferences.getInstance();
    EasyLoading.show(status: 'Loading...');
    _dataTimeStart = DateTime.now().toString();
    _statusButton = false;
    notifyListeners();

    try {
      // final String result = await platform.invokeMethod(ind);
      final coordinates = await channel.invokeMethod(ind);

      _dataTimeEnd = DateTime.now().toString();
      var start = DateTime.parse(_dataTimeStart);
      var end = DateTime.parse(_dataTimeEnd);
      _duration = end.difference(start).inSeconds;

      var dataToJson = DataLonLatDate(
        lat: coordinates["latitude"],
        lon: coordinates["longitude"],
        dateTime: 'start: $_dataTimeStart - end: $_dataTimeEnd',
        durationInSec: _duration,
        accuracy: coordinates["accuracy"],
      ).toJson();

      prefs.setString(
        'dataGPSOnly',
        jsonEncode(dataToJson),
      );

      checkFirst();
      _statusButton = true;
      EasyLoading.dismiss();
      toast('$coordinates | $_dataTimeStart | $_dataTimeEnd');
    } catch (error) {
      log(error.toString());
      EasyLoading.dismiss();
      toast(error.toString());
      _statusButton = true;
      notifyListeners();
    }
  }
}
