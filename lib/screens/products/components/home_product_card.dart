import 'package:cached_network_image/cached_network_image.dart';
import 'package:digi_store/controllers/auth_controller.dart';
import 'package:digi_store/controllers/product_controller.dart';
import 'package:digi_store/models/product.dart';
import 'package:digi_store/screens/auth/login.dart';
import 'package:digi_store/screens/products/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgets/big_title.dart';
import '../../../widgets/small_text.dart';

Widget homeProductCard({required Product product}) {
  AuthController authController = Get.find<AuthController>();
  ProductController productController = Get.find<ProductController>();
  return Padding(
    padding: EdgeInsets.only(left: 5),
    child: InkWell(
      onTap: () {
        Get.to(() => ProductDetails(product: product));
      },
      child: Card(
        child: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      child: CachedNetworkImage(
                        imageUrl: product.images![0],
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          return downloadProgress.progress == true
                              ? Shimmer.fromColors(
                                  child: Container(
                                      height: 100,
                                      width: 120,
                                      color: Colors.grey),
                                  baseColor: Colors.grey.shade200,
                                  highlightColor: Colors.grey.shade100)
                              : Container();
                        },
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    color: Colors.white,
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bigTitle(
                            title: product.name!,
                            color: Colors.black,
                            size: 13),
                        SizedBox(
                          height: 3,
                        ),
                        smallTitle(
                            title: "${product.shop!.name} shop",
                            color: Colors.grey),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            bigTitle(
                                title: "200", color: Colors.black, size: 13),
                            InkWell(
                              onTap: () {
                                if (authController.currentUser.value == null) {
                                  Get.to(() => LoginPage());
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Icon(
                                    Icons.shopping_basket_outlined,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 3,
                  right: 3,
                  child: InkWell(
                    onTap: () {
                      if (authController.currentUser.value == null) {
                        Get.to(() => LoginPage());
                      } else {
                        productController.favouriteProduct(product: product);
                      }
                    },
                    child: Icon(
                      authController.currentUser.value?.wishlist?.indexWhere(
                                  (element) => element == product.id) !=
                              -1
                          ? Icons.favorite_outlined
                          : Icons.favorite_border_outlined,
                      color: authController.currentUser.value?.wishlist
                                  ?.indexWhere(
                                      (element) => element == product.id) !=
                              -1
                          ? Colors.white
                          : Colors.pinkAccent,
                    ),
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}
