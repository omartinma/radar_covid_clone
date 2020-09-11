import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  //Option 1 (similar to setState/changeNotifier)
  var indexSelected = 0;
  void setIndex(int newIndex) {
    indexSelected = newIndex;
    update();
  }

  //Option 2(similar to Streams)
  /*var indexSelectedObs = 0.obs;
  void setIndexObs(int newIndex) {
    indexSelectedObs.value = newIndex;
  }*/
}
