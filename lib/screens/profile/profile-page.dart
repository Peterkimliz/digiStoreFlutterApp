import 'package:digi_store/screens/products/favourite_page.dart';
import 'package:digi_store/screens/user/adress/address_page.dart';
import 'package:digi_store/widgets/big_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        title: bigTitle(
          title: "Account",
          color: Colors.black,
        ),
        actions: [
          InkWell(
            onTap: () => Get.to(() => FavouritePage()),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              margin: EdgeInsets.only(left: 15, right: 15, top: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 1, color: Colors.pink.withOpacity(0.2))),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.pexels.com/photos/162712/egg-white-food-protein-162712.jpeg?auto=compress&cs=tinysrgb&w=600",
                            ))),
                  ),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                "John Doe",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Text("johndoe@gmail.com",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            ),
                            SizedBox(height: 10),
                            Divider(),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Spacer(),
                                InkWell(
                                  onTap: () => Get.to(() => AddressPage()),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.black,
                                      ),
                                      Text("Address")
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.book,
                                      color: Colors.black,
                                    ),
                                    Text("My Order")
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
