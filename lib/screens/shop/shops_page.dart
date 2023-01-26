import 'package:digi_store/screens/shop/componets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopsPage extends StatelessWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Colors.white,
          elevation: 0.2,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text("All Shops", style: TextStyle(color: Colors.black)),
        ),
        body: Stack(
          children: [
            GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, index) {
                  return shopCard();
                }),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                height: kToolbarHeight,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 2),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search)),
                      ),
                    )),
                    IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
