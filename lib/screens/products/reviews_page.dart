import 'dart:io';

import 'package:digi_store/controllers/reviews_controller.dart';
import 'package:digi_store/widgets/big_title.dart';
import 'package:digi_store/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReviewPage extends StatelessWidget {
  ReviewPage({Key? key}) : super(key: key);
  ReviewController reviewController = Get.find<ReviewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        titleSpacing: 0.0,
        centerTitle: true,
        title: Text(
          "Write a review",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(""))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bigTitle(title: "Pinaple", color: Colors.black),
                          SizedBox(
                            height: 10,
                          ),
                          smallTitle(
                              title:
                                  "dfghjkjdsjcbhsjgvchgnbhgsfhsvfghdvwythefvtydtghewvdtgh",
                              color: Colors.grey)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              bigTitle(title: "Add Photo", color: Colors.black),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                child: InkWell(
                  onTap: () {
                    showImageSelectionBottomSheet(context: context);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.cloud_upload,
                        size: 50,
                        color: Colors.green,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      smallTitle(
                          title: "Click here to upload", color: Colors.grey)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              bigTitle(title: "Write Your Review", color: Colors.black),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                minLines: 8,
                maxLines: null,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter review text here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey, width: 1))),
              ),
              SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          height: kBottomNavigationBarHeight,
          width: double.infinity,
          padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.green),
            child: Center(
              child: Text(
                "Submit Review",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showImageSelectionBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: kBottomNavigationBarHeight * 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3,
                ),
                Center(
                  child:
                      bigTitle(title: "Select image from", color: Colors.black),
                ),
                ListTile(
                  onTap: () {
                    Get.back();
                    selectImage(type: "camera");
                  },
                  leading: Icon(Icons.camera_alt),
                  title:
                      bigTitle(title: "Camera", color: Colors.black, size: 14),
                ),
                ListTile(
                  onTap: () {
                    Get.back();
                    selectImage(type: "gallery");
                  },
                  leading: Icon(Icons.camera),
                  title:
                      bigTitle(title: "Gallery", color: Colors.black, size: 14),
                )
              ],
            ),
          );
        });
  }

  selectImage({required String type}) async {
    print(type);
    XFile? pickedImage = await ImagePicker().pickImage(
        source: type == "gallery" ? ImageSource.gallery : ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800);
    if (pickedImage != null) {
      reviewController.selectedReviewImage = pickedImage;
    }
  }
}
