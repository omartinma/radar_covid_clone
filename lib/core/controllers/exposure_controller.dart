import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:radar_covid_clone/core/models/exposure.dart';
import 'package:radar_covid_clone/core/services/exposure_service.dart';

class ExposureController extends GetxController {
  final exposure = Exposure().obs;
  final isRadarActive = true.obs;
  ExposureService exposureService = Get.put(ExposureService());

  @override
  onInit() async {
    isRadarActive.value = await exposureService.isRadarActive();
    exposure.value = await exposureService.getExposure();
  }

  changeRadarActive() async {
    isRadarActive.value = !isRadarActive.value;
    await exposureService.saveRadarActive(isRadarActive.value);
  }
}
