import 'package:digi_store/models/product.dart';
import 'package:digi_store/screens/products/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/big_title.dart';
import '../../../widgets/small_text.dart';

Widget homeProductCard({required Product product}) {
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(product.images![0]))),
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
                            Container(
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
                    onTap: () {},
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}
