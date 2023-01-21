import 'dart:convert';

import 'package:digi_store/services/client.dart';

import 'endpoints.dart';

class Users{
  static loginUser({required Map<String, dynamic> body})async{
    var response=await DbBase().databaseRequest(signin, DbBase().postRequestType,body: body);
    return jsonDecode(response);

  }

  getUserById({required String uid})async {
    var response=await DbBase().databaseRequest("$user/$uid", DbBase().getRequestType);
    return jsonDecode(response);

  }

}