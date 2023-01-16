import 'package:digi_store/screens/home/home.dart';
import 'package:digi_store/screens/home/profile-page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentPage = RxInt(0);


  List pages = [
    Home(),
   ProfilePage()


  ];
}
