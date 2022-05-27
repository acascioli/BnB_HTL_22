import 'package:get/get.dart';

class AppController extends GetxController {
  Map<String, dynamic> varsMap = {};
  bool isConnected = false;

  void updateValues(jdata) {
    varsMap = jdata;
    update();
  }

  void checkConnection(cnctn) {
    isConnected = cnctn;
    update();
  }
}
