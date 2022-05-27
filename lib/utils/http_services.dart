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
  static final readUrl = Uri.parse('http://10.11.104.16:5000/read');
  static final streamUrl = Uri.parse('http://10.11.104.16:5000/stream');
  static final checkUrl = Uri.parse('http://10.11.104.16:5000/check');

  //  static register(email, password, context) async {
  static connect(context) async {
    http.Response response = await _client.get(connectUrl);

    if (response.statusCode == 200) {
      // await EasyLoading.showSuccess(response.body);
      await EasyLoading.showSuccess('Connected!');
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static stream(context) async {
    http.Response response = await _client.get(streamUrl);
    // http.Response response = await _client.post(_testUrl, body: {
    //   // "email": email,
    //   // "password": password,
    // });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // print(json);
      //   if (json[0] == 'username already exist') {
      //     await EasyLoading.showError(json[0]);
      //   } else {
      //     await EasyLoading.showSuccess(json[0]);
      //     // Navigator.pushReplacement(
      //     //     context, MaterialPageRoute(builder: (context) => Dashboard()));
      //   }
      // } else {
      if (response.body != '') {
        await EasyLoading.showSuccess(response.body);
      } else {
        await EasyLoading.showError(response.body);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static check(context) async {
    http.Response response = await _client.get(checkUrl);
    // http.Response response = await _client.post(_testUrl, body: {
    //   // "email": email,
    //   // "password": password,
    // });
    if (response.statusCode == 200) {
      var isConnected = jsonDecode(response.body);
      controller.checkConnection(isConnected);
      //   if (json[0] == 'username already exist') {
      //     await EasyLoading.showError(json[0]);
      //   } else {
      //     await EasyLoading.showSuccess(json[0]);
      //     // Navigator.pushReplacement(
      //     //     context, MaterialPageRoute(builder: (context) => Dashboard()));
      //   }
      // } else {
      http.Response data = await _client.get(streamUrl);
      var jdata = jsonDecode(data.body);
      // print(jdata.runtimeType);
      // print(jdata);
      controller.updateValues(jdata);
      if (data.body != '') {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          // print(data);
        } else {
          await EasyLoading.showError(response.body);
        }
        // await EasyLoading.showSuccess('is_connected');
        // await EasyLoading.showSuccess(response.body);
      } else {
        await EasyLoading.showError(response.body);
      }
    } else {
      controller.checkConnection(false);
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
