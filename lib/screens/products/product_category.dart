import 'package:digi_store/controllers/product_controller.dart';
import 'package:digi_store/models/categories.dart';
import 'package:digi_store/models/product.dart';
import 'package:digi_store/screens/products/product_details.dart';
import 'package:digi_store/utils/loading_widgets.dart';
import 'package:digi_store/widgets/big_title.dart';
import 'package:digi_store/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategory extends StatelessWidget {
  final Categories category;
  ProductController productController = Get.find<ProductController>();
  ProductCategory({super.key, required this.category}) {
    productController.getProductsByCategory(id: category.id);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        productController.getProductsByCategory(id: category.id);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios)),
            title: Text(
              "${category.name}".capitalize!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Obx(() {
                return productController.loadingProductByCategory.value
                    ?  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return LoadingWidgets().loadingProductShimmer(context);
                                        }),
                      ],
                    )
                    : productController.productsByCategory.length == 0
                        ? Center(
                            child: Text(
                              "No products Found",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: kTextTabBarHeight,
                                ),
                                ListView.builder(
                                    itemCount: productController
                                        .productsByCategory.length,
                                    itemBuilder: (context, index) {
                                      Product product = productController
                                          .productsByCategory
                                          .elementAt(index);
                                      return InkWell(
                                        onTap: () {
                                          Get.to(() => ProductDetails(
                                                product: product,
                                              ));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      width: 150,
                                                      child: Image.network(
                                                          product.images![0]),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        bigTitle(
                                                            title: product.name,
                                                            color:
                                                                Colors.black),
                                                        const SizedBox(
                                                            height: 3),
                                                        bigTitle(
                                                            title:
                                                                "Price: ${product.price}",
                                                            color: Colors.black,
                                                            size: 14),
                                                        const SizedBox(
                                                            height: 3),
                                                        smallTitle(
                                                            title:
                                                                "Qty: ${product.quantity}",
                                                            color: Colors.grey),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Divider(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  thickness: 1,
                                                )
                                              ]),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          );
              }),
              Positioned(
                  child: Container(
                width: double.infinity,
                height: kTextTabBarHeight,
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                   contentPadding:EdgeInsets.symmetric(vertical: 5,horizontal: 8) ,
                    hintText: "Search..",
                    fillColor: Colors.grey.withOpacity(0.2),
                    prefixIcon: Icon(Icons.search,color:Colors.black),
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
