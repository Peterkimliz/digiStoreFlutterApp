import 'package:digi_store/bindings.dart';
import 'package:digi_store/controllers/category_controller.dart';
import 'package:digi_store/controllers/home_controller.dart';
import 'package:digi_store/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
 HomeController homeController=Get.put<HomeController>(HomeController());
 CategoryController categoryController=Get.put<CategoryController>(CategoryController());


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DigiStrore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent
      ),
      initialBinding: AppBindings(),
      home: HomePage(),
    );
  }
}
