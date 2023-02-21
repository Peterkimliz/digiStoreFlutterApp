import 'package:digi_store/screens/cart/cart.dart';
import 'package:digi_store/screens/home/home.dart';
import 'package:digi_store/screens/profile/profile-page.dart';
import 'package:get/get.dart';

import '../screens/shop/shops_page.dart';

class HomeController extends GetxController {
  RxInt currentPage = RxInt(0);

  List pages = [Home(), ShopsPage(), CartPage(), ProfilePage()];
}
