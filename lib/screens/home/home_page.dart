import 'package:digi_store/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: homeController.pages[homeController.currentPage.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeController.currentPage.value,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            homeController.currentPage.value = value;
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopify), label: "Gloccery"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "pro")
          ],
        ),
      ),
    );
  }
}
