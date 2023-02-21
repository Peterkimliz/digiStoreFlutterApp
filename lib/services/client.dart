import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/connection_controller.dart';

class DbBase {
  final postRequestType = "POST";
  final getRequestType = "GET";
  final putRequestType = "PUT";
  final patchRequestType = "PATCH";
  final deleteRequestType = "DELETE";

  databaseRequest(String link, String type,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    await Get.put(ConnectionController()).checkConnecton();
    try {
      if (Get.put(ConnectionController()).connectionstate.isTrue) {
        if (headers == null) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          String? token = preferences.getString("token");

          headers = {
            "Content-Type": "application/json",
            if (token != null) "Authorization": "Bearer ${token ?? ""}"
          };
        }
        var request = http.Request(type, Uri.parse(link));
        if (body != null) {
          request.body = json.encode(body);
        }
        request.headers.addAll(headers);
        print("$type $link");
        http.StreamedResponse response = await request.send();
        return response.stream.bytesToString();
      }
    } catch (e, s) {
      print("Error in the following $link is $e and $s");
    }
  }
}
