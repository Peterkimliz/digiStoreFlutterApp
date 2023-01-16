import 'dart:convert';

import 'package:digi_store/services/client.dart';

import 'endpoints.dart';

class Products{

  getPaginatedProducts(String pageNumber)async{
    var response=await DbBase().databaseRequest("$allProducts?pageNumber=$pageNumber",DbBase().getRequestType);
    return jsonDecode(response);
  }

  getProductReviews(String productId)async{
    var response=await DbBase().databaseRequest("$productReviews"+productId,DbBase().getRequestType);
    return jsonDecode(response);
  }


}