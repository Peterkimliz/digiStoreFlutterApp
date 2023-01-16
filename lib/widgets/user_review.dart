import 'package:cached_network_image/cached_network_image.dart';
import 'package:digi_store/models/product_review.dart';
import 'package:digi_store/widgets/big_title.dart';
import 'package:digi_store/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

Widget userReviewCard(ProductReview productReview) {
  return Container(
    padding: EdgeInsets.all(10),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: productReview.user!.profileImage == ""
                      ? Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/profile.jpeg")),
                              borderRadius: BorderRadius.circular(20)))
                      : CachedNetworkImage(
                          imageUrl: "http://via.placeholder.com/350x150",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                ),
                SizedBox(width: 5),
                bigTitle(
                    title: "${productReview.user!.username}",
                    color: Colors.black,
                    size: 15),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBarIndicator(
                  rating: productReview.rating!.toDouble(),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(height: 3,),
                smallTitle(
                    title: DateFormat("MMM dd yyyy")
                        .format(DateTime.parse(productReview.createdAt!)),
                    color: Colors.black),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        smallTitle(
            title: "${productReview.review}", color: Colors.black, size: 14)
      ],
    ),
  );
}
