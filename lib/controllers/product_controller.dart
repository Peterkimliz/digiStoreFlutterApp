import 'package:digi_store/models/product.dart';
import 'package:digi_store/models/product_review.dart';
import 'package:digi_store/services/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool loadingProducts = RxBool(false);
  RxBool loadingProductReviews = RxBool(false);
  RxList<Product> products = RxList([]);
  RxList<ProductReview> productReviews = RxList([]);
  RxDouble avarageReviews = RxDouble(0.0);

  getPaginatedProducts() async {
    try {
      loadingProducts.value = true;
      var response = await Products().getPaginatedProducts("0");
      print(response);
      if (response != null) {
        List dataResponse = response;
        List<Product> rawProduct =
            dataResponse.map((e) => Product.fromJson(e)).toList();
        products.assignAll(rawProduct);
      } else {
        products.value = RxList([]);
      }
      loadingProducts.value = false;
    } catch (e) {
      loadingProducts.value = false;
      print("error is $e");
    }
  }

  getProductReviews(String productId) async {
    try {
      loadingProductReviews.value = true;
      var response = await Products().getProductReviews(productId);
      if (response != null) {
        List dataResponse = response;
        List<ProductReview> rawProduct =
            dataResponse.map((e) => ProductReview.fromJson(e)).toList();
        productReviews.assignAll(rawProduct);
        avarageReviews.value = getReviewsAverage();
      } else {
        productReviews.value = RxList([]);
      }
      loadingProductReviews.value = false;
    } catch (e) {
      loadingProductReviews.value = false;
      print("error is $e");
    }
  }

  getReviewsAverage() {
    return productReviews.isEmpty
        ? 0.toDouble()
        : productReviews
                .map((e) => e.rating)
                .toList()
                .reduce((value, element) => value! + element!)! /
            productReviews.length;
  }
}
