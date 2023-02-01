import 'package:digi_store/widgets/big_title.dart';
import 'package:digi_store/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
   FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          "Favourite List",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kToolbarHeight * 1.3,
                ),
                ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/chair.jpeg"))),
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
                                          "title error is type Nulljhbdsjhbdhjkbewdyhfdbhgvfdghjvfegjhdvcgjhbmvdgsxghjcvdshjejdvsfhgjvedhsgvfjghedsvfghjvdsugewdyfivetywufcyghb is not a subtype of type 'String",
                                      color: Colors.grey),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: kToolbarHeight * 1.2,
                color: Colors.white,
                child: Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Search in favourite list",
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
