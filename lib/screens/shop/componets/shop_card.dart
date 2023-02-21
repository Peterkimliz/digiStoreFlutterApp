import 'package:digi_store/screens/products/favourite_page.dart';
import 'package:digi_store/screens/products/reviews_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../widgets/big_title.dart';
import '../../../widgets/small_text.dart';

Widget shopCard() {
  return InkWell(
    onTap: () {
      Get.to(() => FavouritePage());
    },
    child: Container(
      padding: EdgeInsets.all(5),
      child: Stack(
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.pexels.com/photos/264636/pexels-photo-264636.jpeg?auto=compress&cs=tinysrgb&w=800")),
            ),
          ),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.orange),
                    child: Text(
                      "Open",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(6)),
                SizedBox(height: 5),
                bigTitle(title: "Peter shop", color: Colors.white),
                SizedBox(height: 5),
                smallTitle(title: "Nakuru", color: Colors.white),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 5,
                        child: RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 15.0,
                          unratedColor: Colors.white,
                          direction: Axis.horizontal,
                        )),
                    Expanded(
                      flex: 3,
                      child: smallTitle(title: "10 km", color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            left: 20,
            right: 0,
            bottom: 20,
          )
        ],
      ),
    ),
  );
}
