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
          onTap: (value) {
            homeController.currentPage.value = value;
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "pro")
          ],
        ),
      ),
    );
  }
}
