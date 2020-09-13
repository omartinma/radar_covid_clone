import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:radar_covid_clone/core/models/exposure.dart';
import 'package:radar_covid_clone/core/services/exposure_service.dart';

class ExposureController extends GetxController {
  final exposure = Exposure().obs;

  ExposureService exposureService = Get.put(ExposureService());

  @override
  onInit() async {
    exposure.value = await exposureService.getExposure();
  }
}
