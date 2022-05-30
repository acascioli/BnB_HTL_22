import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    List<String> defaultSelected = [
      'PID_Regulator_1_PFR.sActTemperature',
      'MY_PID_PUMP_REGULATOR_V31.sActValue',
      '_ReadInputRegister1.SFlowTotal',
    ];
    List<Color> defaultColors = [
      Colors.red,
      Colors.amber,
      Colors.blue,
    ];
    varsTable = json.decode(jvars);
    Map filteredMap = Map.from(varsTable['Nodes'])
      ..removeWhere((k, v) => !defaultSelected.contains(v));
    Map<String, bool> tempMap = {};
    Map<String, List<double>> tempMap_1 = {};
    Map<String, Color> tempMap_2 = {};
    Map<String, String> tempMap_3 = {};
    int i = 0;
    for (var k in varsTable['Nodes'].keys) {
      if (filteredMap.keys.contains(k)) {
        tempMap[k.toString()] = true;
        tempMap_2[k.toString()] = defaultColors[i];
        i += 1;
        tempMap_1[k.toString()] = [];
        tempMap_3[k.toString()] = '0.0';
      } else {
        tempMap[k.toString()] = false;
        tempMap_1[k.toString()] = [];
        tempMap_2[k.toString()] = Colors.black;
        tempMap_3[k.toString()] = '0.0';
        // varsTable['Selected'] = tempMap[k.toString()] = false;
        // varsTable['Log'] = tempMap[k.toString()] = [];
      }
    }
    varsTable['Selected'] = tempMap;
    varsTable['Log'] = tempMap_1;
    varsTable['Color'] = tempMap_2;
    varsTable['Average'] = tempMap_3;
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
          varsMap[varsTable['Nodes'][i.toString()]] =
              realVal.toStringAsFixed(1);
          var sum = 0.0;
          varsTable['Log'][i.toString()].add(realVal);
          if (varsTable['Log'][i.toString()] != null) {
            varsTable['Log'][i.toString()].forEach((e) => sum += e);
            varsTable['Average'][i.toString()] =
                (sum / varsTable['Log'][i.toString()].length)
                    .toStringAsFixed(1);
          } else {}
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
