import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:digi_store/controllers/category_controller.dart';
import 'package:digi_store/controllers/product_controller.dart';
import 'package:digi_store/models/categories.dart';
import 'package:digi_store/models/product.dart';
import 'package:digi_store/screens/products/components/home_product_card.dart';
import 'package:digi_store/screens/products/product_category.dart';
import 'package:digi_store/utils/loading_widgets.dart';
import 'package:digi_store/widgets/big_title.dart';
import 'package:digi_store/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:light_carousel/main/light_carousel.dart';

class Home extends StatelessWidget {
  CategoryController categoryController = Get.put(CategoryController());
  ProductController productController = Get.put(ProductController());

  Home({Key? key}) : super(key: key);
  List<String> images = [
    "https://images.pexels.com/photos/4045568/pexels-photo-4045568.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/162712/egg-white-food-protein-162712.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/4045568/pexels-photo-4045568.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/162712/egg-white-food-protein-162712.jpeg?auto=compress&cs=tinysrgb&w=600"
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              await categoryController.fetchCategories();
              await productController.getPaginatedProducts();
            },
            child: SafeArea(
              child: categoryController.loadingCategory.isTrue ||
                      productController.loadingProducts.isTrue
                  ? Center(
                      child: BlurryModalProgressHUD(
                        inAsyncCall:
                            categoryController.loadingCategory.isTrue ||
                                productController.loadingProducts.isTrue,
                        blurEffectIntensity: 4,
                        progressIndicator: SpinKitFadingCircle(
                          color: Colors.green,
                          size: 60.0,
                        ),
                        dismissible: false,
                        opacity: 0.4,
                        color: Colors.transparent,
                        child: Scaffold(),
                      ),
                    )
                  : SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5, top: 3),
                            child: bigTitle(
                                title: "Digi Store",
                                color: Colors.orangeAccent,
                                size: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 180,
                            width: double.infinity,
                            child: LightCarousel(
                              boxFit: BoxFit.cover,
                              autoPlay: true,
                              animationCurve: Curves.fastOutSlowIn,
                              // animationDuration: Duration(milliseconds: 5000),
                              dotSize: 6.0,
                              dotIncreasedColor: Colors.green,
                              dotBgColor: Colors.transparent,
                              dotPosition: DotPosition.bottomCenter,
                              dotVerticalPadding: 10.0,
                              showIndicator: true,
                              indicatorBgPadding: 7.0,
                              dotSpacing: 15.0,
                              dotColor: Colors.white,
                              images: images
                                  .map(
                                    (e) => NetworkImage(e),
                                  )
                                  .toList(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: bigTitle(
                                title: "Categories", color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 100,
                            width: double.infinity,
                            child: categoryController.loadingCategory.value
                                ? ListView.builder(
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return LoadingWidgets()
                                          .categoryShimmer(context);
                                    })
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount:
                                        categoryController.categories.length,
                                    itemBuilder: (context, index) {
                                      Categories category = categoryController
                                          .categories
                                          .elementAt(index);
                                      return Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(() => ProductCategory(
                                                  category: category,
                                                ));
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            category.image!))),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(category.name!)
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    bigTitle(
                                        title: "Recent Products",
                                        color: Colors.black),
                                    smallTitle(
                                        title: "View All", color: Colors.green),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 180,
                                width: double.infinity,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount:
                                        productController.products.length,
                                    itemBuilder: (context, index) {
                                      Product product = productController
                                          .products
                                          .elementAt(index);
                                      return homeProductCard(product: product);
                                    }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ));
  }
}
