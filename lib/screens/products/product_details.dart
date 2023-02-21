import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:digi_store/controllers/auth_controller.dart';
import 'package:digi_store/controllers/product_controller.dart';
import 'package:digi_store/models/product.dart';
import 'package:digi_store/models/product_review.dart';
import 'package:digi_store/screens/auth/login.dart';
import 'package:digi_store/widgets/big_title.dart';
import 'package:digi_store/widgets/small_text.dart';
import 'package:digi_store/widgets/user_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:light_carousel/main/light_carousel.dart';
import 'package:readmore/readmore.dart';

import 'components/home_product_card.dart';

class ProductDetails extends StatelessWidget {
  Product product;
  ProductController productController = Get.find<ProductController>();
  AuthController authController = Get.find<AuthController>();

  ProductDetails({Key? key, required this.product}) : super(key: key) {
    productController.getProductReviews(product.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: LightCarousel(
                        boxFit: BoxFit.cover,
                        autoPlay: false,
                        animationCurve: Curves.fastOutSlowIn,
                        animationDuration: Duration(milliseconds: 1000),
                        dotSize: 6.0,
                        dotIncreasedColor: Colors.green,
                        dotBgColor: Colors.transparent,
                        dotPosition: DotPosition.bottomCenter,
                        dotVerticalPadding: 10.0,
                        showIndicator: true,
                        indicatorBgPadding: 7.0,
                        dotSpacing: 15.0,
                        dotColor: Colors.white,
                        images: product.images!
                            .map(
                              (e) => NetworkImage(e),
                            )
                            .toList(),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    productController.favouriteProduct(
                                        product: product);
                                  },
                                  icon: Icon(
                                    Icons.favorite_outlined,
                                    color: authController
                                                .currentUser.value?.wishlist
                                                ?.indexWhere((element) =>
                                                    element == product.id) !=
                                            -1
                                        ? Colors.white
                                        : Colors.pinkAccent,
                                  ))
                            ],
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bigTitle(
                            title: "${product.name}".capitalize,
                            color: Colors.black,
                            size: 18),
                        SizedBox(
                          height: 5,
                        ),
                        bigTitle(
                            title: " \$ ${product.price}",
                            color: Colors.red.shade400,
                            size: 20),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            bigTitle(
                                title: "Available Stock ",
                                color: Colors.black54),
                            smallTitle(
                                title: ": ${product.quantity}",
                                color: Colors.grey,
                                size: 18)
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            smallTitle(
                                title: "By ${product.shop!.name} shop",
                                color: Colors.grey,
                                size: 14),
                            InkWell(
                              onTap: () {},
                              child: smallTitle(
                                  title: "View more",
                                  color: Colors.green,
                                  size: 14),
                            ),
                          ],
                        ),
                        Container(),
                        Divider(
                          thickness: 0.2,
                          color: Colors.grey,
                        ),
                        bigTitle(title: "Description", color: Colors.black),
                        SizedBox(
                          height: 5,
                        ),
                        ReadMoreText(
                          "${product.description}".capitalize!,
                          trimLines: 2,
                          colorClickableText: Colors.blue,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                          trimExpandedText: 'Show less',
                          moreStyle:
                              TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bigTitle(
                            title: "Related Products",
                            color: Colors.black,
                            size: 18),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 180,
                          width: double.infinity,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: productController.products.length,
                              itemBuilder: (context, index) {
                                Product product =
                                    productController.products.elementAt(index);
                                return homeProductCard(product: product);
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bigTitle(
                            title: "Customer Reviews",
                            color: Colors.black,
                            size: 18),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: productController.avarageReviews.value,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            smallTitle(
                                title:
                                    "(${productController.productReviews.length})",
                                color: Colors.grey),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        productController.loadingProductReviews.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : productController.productReviews.length == 0
                                ? Center(
                                    child: Text(
                                        "This product doesnot have reviews yet"),
                                  )
                                : ListView.builder(
                                    itemCount:
                                        productController.productReviews.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      ProductReview productReview =
                                          productController.productReviews
                                              .elementAt(index);
                                      return userReviewCard(productReview);
                                    })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: BottomAppBar(
        child: Obx(() => Container(
              height: productController.loadingProductReviews.value
                  ? 0
                  : kBottomNavigationBarHeight,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          if (authController.currentUser.value == null) {
                            Get.to(() => LoginPage());
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.green, width: 1),
                              borderRadius: BorderRadius.circular(3)),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite, color: Colors.green),
                              Text(
                                "Save".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(3)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "add to cart".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
