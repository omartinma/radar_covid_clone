import 'package:get/state_manager.dart';

class DiagnosticController extends GetxController {
  List<String> inputList;
  final sendEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    inputList = List<String>(12);
    for (int i = 0; i < inputList.length; i++) {
      inputList[i] = "";
    }
  }

  void updateValue(String value, int index) {
    inputList[index] = value;

    final indexFirstNull = inputList.indexOf("");
    sendEnabled.value = indexFirstNull == -1;
  }
}
