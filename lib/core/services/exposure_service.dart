import 'dart:math';

import 'package:radar_covid_clone/core/models/exposure.dart';

class ExposureService {
  Future<Exposure> getExposure() async {
    await Future.delayed(Duration(seconds: 2));
    var value = Random().nextInt(2);
    return Exposure(exposureLevel: ExposureLevel.values[value]);
  }
}
