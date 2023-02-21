import 'dart:convert';

import 'package:digi_store/services/client.dart';

import 'endpoints.dart';

class Category {
  createCategoriy({required Map<String, dynamic> body}) async {
    var response = await DbBase()
        .databaseRequest(createCategory, DbBase().postRequestType, body: body);
    return jsonDecode(response);
  }

  getPaginatedCategories(String pageNumber) async {
    var response = await DbBase().databaseRequest(
        "$allCategory?pageNumber=$pageNumber", DbBase().getRequestType);
    return jsonDecode(response);
  }
}
