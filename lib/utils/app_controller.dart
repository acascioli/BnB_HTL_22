import 'package:get/get.dart';
import 'dart:convert';

class AppController extends GetxController {
  Map<String, dynamic> varsTable = {};
  Map<String, dynamic> varsMap = {};
  bool isConnected = false;
  String searchText = '';

  void searchInTable(value) {
    searchText = value;
    update();
  }

  void getVariablesTable(jvars) {
    varsTable = json.decode(jvars);
    update();
  }

  void updateValues(jdata) {
    varsMap = jdata;
    for (int i = 0; i < varsTable['Nodes'].length; ++i) {
      if (varsTable['SCALE'][i.toString()] != null &&
          varsTable['SCALE'][i.toString()] != 'null' &&
          varsTable['SCALE'][i.toString()] != Null &&
          varsTable['SCALE'][i.toString()] != 'Null') {
        if (varsMap[varsTable['Nodes'][i.toString()]] != null &&
            varsMap[varsTable['Nodes'][i.toString()]] != 'null' &&
            varsMap[varsTable['Nodes'][i.toString()]] != Null &&
            varsMap[varsTable['Nodes'][i.toString()]] != 'Null') {
          // print(int.parse(varsMap[varsTable['Nodes'][i.toString()]]));
          double realVal = varsMap[varsTable['Nodes'][i.toString()]] *
              varsTable['SCALE'][i.toString()];
          // double.parse(varsTable['SCALE'][i.toString()]);
          varsMap[varsTable['Nodes'][i.toString()]] =
              realVal.toStringAsFixed(1);
        }
      }
      varsTable['Values'][i.toString()] =
          varsMap[varsTable['Nodes'][i.toString()]];
    }

    update();
  }

  void checkConnection(cnctn) {
    isConnected = cnctn;
    update();
  }
}
