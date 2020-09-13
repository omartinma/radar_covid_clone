import 'dart:math';

import 'package:radar_covid_clone/core/models/exposure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExposureService {
  static const RADAR_ACTIVE_KEY = "RADAR_ACTIVE_KEY";
  Future<Exposure> getExposure() async {
    await Future.delayed(Duration(seconds: 2));
    var value = Random().nextInt(2);
    return Exposure(exposureLevel: ExposureLevel.values[value]);
  }

  isRadarActive() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isActive = prefs.getBool(RADAR_ACTIVE_KEY);
    if (isActive == null) {
      saveRadarActive(false);
      return false;
    }
    return isActive;
  }

  saveRadarActive(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(RADAR_ACTIVE_KEY, value);
  }
}
