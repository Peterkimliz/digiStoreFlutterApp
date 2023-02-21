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
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
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
          body: Obx(() {
            return productController.loadingProductByCategory.value
                ? Center(
                    child: CircularProgressIndicator(),
                    // child: Expanded(
                    //     child: ListView.builder(
                    //         itemCount: 5,
                    //         shrinkWrap: true,
                    //         itemBuilder: (context, index) {
                    //           return LoadingWidgets()
                    //               .loadingProductShimmer(context);
                    //         }),
                    //   ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: kTextTabBarHeight,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        child: Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              hintText: "Search..",
                              filled: true,
                              fillColor: Colors.pink.withOpacity(0.1),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Colors.pink.withOpacity(0.1))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Colors.pink.withOpacity(0.1))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Colors.pink.withOpacity(0.1))),
                              suffixIcon:
                                  Icon(Icons.search, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      productController.productsByCategory.length == 0
                          ? Center(
                              child: Text(
                                "No products Found",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  productController.productsByCategory.length,
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
                                    margin: EdgeInsets.only(bottom: 2),
                                    padding: EdgeInsets.only(left: 10, top: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Image.network(
                                            product.images![0],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            bigTitle(
                                                title: product.name,
                                                color: Colors.black),
                                            const SizedBox(height: 3),
                                            bigTitle(
                                                title:
                                                    "Price: ${product.price}",
                                                color: Colors.black,
                                                size: 14),
                                            const SizedBox(height: 3),
                                            smallTitle(
                                                title:
                                                    "Qty: ${product.quantity}",
                                                color: Colors.grey),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                    ],
                  );
          })),
    );
  }
}
