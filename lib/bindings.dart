import 'package:digi_store/controllers/connection_controller.dart';
import 'package:digi_store/controllers/category_controller.dart';
import 'package:digi_store/controllers/home_controller.dart';
import 'package:digi_store/controllers/product_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<ProductController>(ProductController(), permanent: true);
    Get.put<ConnectionController>(ConnectionController(), permanent: true);
  }
}
