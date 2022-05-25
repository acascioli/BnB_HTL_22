import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:convert';
import 'dart:io';

class HttpService {
  static final _client = http.Client();

  // static var _testUrl = Uri.parse('http://192.168.1.140:5000/test');
  static final testUrl = Uri.parse('http://10.11.104.16:5000/test');
  static final readUrl = Uri.parse('http://10.11.104.16:5000/read');

  //  static register(email, password, context) async {
  static test(context) async {
    http.Response response = await _client.get(testUrl);
    // http.Response response = await _client.post(_testUrl, body: {
    //   // "email": email,
    //   // "password": password,
    // });

    if (response.statusCode == 200) {
      //   var json = jsonDecode(response.body);
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
}
