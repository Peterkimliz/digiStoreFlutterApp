import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidgets {
  Widget categoryShimmer(context) {
    return Shimmer.fromColors(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.0,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 0,
                height: 15,
                color: Theme.of(context).scaffoldBackgroundColor,
              )
            ],
          ),
        ),
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade100);
  }

  Widget loadingProductShimmer(context) {
    return Shimmer.fromColors(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8)),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: double.infinity,
                height: 15,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 10,
                color: Theme.of(context).scaffoldBackgroundColor,
              )
            ],
          ),
        ),
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade100);
  }
}
