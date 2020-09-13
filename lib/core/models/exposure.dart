import 'package:flutter/foundation.dart';

enum ExposureLevel { LOW, MEDIUM, HIGH }

extension ExposureLevelExtension on ExposureLevel {
  String get value => describeEnum(this);
  String get valueExposition {
    switch (this) {
      case ExposureLevel.LOW:
        return "baja";
        break;
      case ExposureLevel.MEDIUM:
        return "media";
        break;
      case ExposureLevel.HIGH:
        return "alta";
        break;
      default:
    }
  }
}

class Exposure {
  ExposureLevel exposureLevel;

  Exposure({
    this.exposureLevel,
  });
}
