import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  var indexSelected = 0.obs;

  void setIndex(int newIndex) {
    indexSelected.value = newIndex;
  }
}
