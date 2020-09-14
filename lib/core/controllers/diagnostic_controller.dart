import 'package:get/state_manager.dart';

class DiagnosticController extends GetxController {
  List<String> inputList;

  @override
  void onInit() {
    super.onInit();
    inputList = List<String>(12);
    for (int i = 0; i < inputList.length; i++) {
      inputList[i] = "";
    }
  }
}
