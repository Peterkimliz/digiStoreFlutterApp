import 'package:digi_store/controllers/auth_controller.dart';
import 'package:digi_store/models/product.dart';
import 'package:digi_store/models/product_review.dart';
import 'package:digi_store/services/product.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  RxBool loadingProducts = RxBool(false);
  RxBool loadingProductReviews = RxBool(false);
  RxBool loadingProductByCategory = RxBool(false);
  RxBool loadingMoreProductsByCategory = RxBool(false);
  RxBool hasNextPage = RxBool(true);
  RxInt productsCategorycategoryPageNumber = RxInt(0);
  late ScrollController controller;

  RxList<Product> products = RxList([]);
  RxList<Product> productsByCategory = RxList([]);
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

  favouriteProduct({required Product product}) async {
    try {
      AuthController authController = Get.find<AuthController>();
      int? index = authController.currentUser.value?.wishlist
          ?.indexWhere((element) => element == product.id);
      if (index == -1) {
        authController.currentUser.value?.wishlist?.add(product.id!);
        products.refresh();
      } else {
        authController.currentUser.value?.wishlist
            ?.removeWhere((element) => element == product.id);
        products.refresh();
      }

      var response = await Products().favouriteProduct(
          productId: product.id, userId: authController.currentUser.value?.id);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  getProductsByCategory({String? id}) async {
    try {
      loadingProductByCategory.value = true;
      print("called${id}");
      var response = await Products().getProductsByCategory(
          categoryId: id, page: productsCategorycategoryPageNumber.value);
      print("called${response}");
      if (response != null) {
        List dataResponse = response;
        List<Product> rawProduct =
            dataResponse.map((e) => Product.fromJson(e)).toList();
        productsByCategory.assignAll(rawProduct);
      } else {
        productsByCategory.value = RxList([]);
      }

      loadingProductByCategory.value = false;
    } catch (e) {
      loadingProductByCategory.value = false;
      print(e);
    }
  }

  loadMoreProductsByCategoryId({String? id}) async {
    if (loadingMoreProductsByCategory.value == false &&
        loadingMoreProductsByCategory.value == false &&
        hasNextPage.value == true &&
        controller.position.extentAfter < 200) {
      productsCategorycategoryPageNumber.value +=
          productsCategorycategoryPageNumber.value;
      try {
        loadingMoreProductsByCategory.value = true;
        var response = await Products().getProductsByCategory(
            categoryId: id, page: productsCategorycategoryPageNumber.value);
        if (response != null) {
          List dataResponse = response;
          List<Product> rawProduct =
              dataResponse.map((e) => Product.fromJson(e)).toList();
          productsByCategory.addAll(rawProduct);
        } else {
          hasNextPage.value = false;
        }

        loadingMoreProductsByCategory.value = false;
      } catch (e) {
        loadingMoreProductsByCategory.value = false;
        print(e);
      }
    }
  }

  @override
  void onInit() {
    controller = ScrollController()
      ..addListener(() => loadMoreProductsByCategoryId());
    getPaginatedProducts();
    super.onInit();
  }
}
