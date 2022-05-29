import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:convert';
import 'package:get/get.dart';

import '../utils/app_controller.dart';

class HttpService {
  static final controller = Get.put(AppController());
  static final _client = http.Client();

  // static var _testUrl = Uri.parse('http://192.168.1.140:5000/test');
  static final connectUrl = Uri.parse('http://10.11.104.16:5000/connect');
  static final disconnectUrl = Uri.parse('http://10.11.104.16:5000/disconnect');
  static final streamUrl = Uri.parse('http://10.11.104.16:5000/stream');
  static final checkUrl = Uri.parse('http://10.11.104.16:5000/check');
  static final loadVariablesUrl =
      Uri.parse('http://10.11.104.16:5000/loadVariables');

  //  static register(email, password, context) async {
  static connect(context) async {
    EasyLoading.show(status: 'Waiting for connection...');
    http.Response response = await _client.get(connectUrl);

    if (response.statusCode == 200) {
      loadVariables(context);
      await EasyLoading.showSuccess(response.body);
      // await EasyLoading.showSuccess('Connected!');
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static disconnect(context) async {
    EasyLoading.show(status: 'Disconnecting...');
    http.Response response = await _client.get(disconnectUrl);

    if (response.statusCode == 200) {
      loadVariables(context);
      await EasyLoading.showSuccess(response.body);
      // await EasyLoading.showSuccess('Connected!');
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static loadVariables(context) async {
    http.Response response = await _client.get(loadVariablesUrl);
    if (response.statusCode == 200) {
      var jvars = jsonDecode(response.body);
      controller.getVariablesTable(jvars);
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static check(context) async {
    http.Response response = await _client.get(checkUrl);
    if (response.statusCode == 200) {
      var isConnected = jsonDecode(response.body);
      controller.checkConnection(isConnected);

      http.Response data = await _client.get(streamUrl);
      if (data.statusCode == 200) {
        var jdata = jsonDecode(data.body);
        controller.updateValues(jdata);
      } else if (data.statusCode != 500) {
        await EasyLoading.showError(
            "Error Code : ${data.statusCode.toString()}");
      }
    } else {
      controller.checkConnection(false);

      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
