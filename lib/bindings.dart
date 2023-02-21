import 'package:digi_store/controllers/auth_controller.dart';
import 'package:digi_store/controllers/connection_controller.dart';
import 'package:digi_store/controllers/category_controller.dart';
import 'package:digi_store/controllers/home_controller.dart';
import 'package:digi_store/controllers/product_controller.dart';
import 'package:digi_store/controllers/reviews_controller.dart';
import 'package:digi_store/controllers/user_controller.dart';
import 'package:digi_store/models/reviews.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<ProductController>(ProductController(), permanent: true);
    Get.put<ConnectionController>(ConnectionController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<ReviewController>(ReviewController(), permanent: true);
  }
}
