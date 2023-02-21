import 'package:digi_store/controllers/auth_controller.dart';
import 'package:digi_store/services/users.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController {
  RxBool loadingUser = RxBool(false);

  getUserById(String uid) async {
    try {
      var response = await Users().getUserById(uid:uid);
      print(response);
      if (response["message"] != null) {
      } else {
        User user = User.fromJson(response);
        Get.find<AuthController>().currentUser.value = user;
        Get.find<AuthController>().currentUser.refresh();
      }
    } catch (e) {
      print(e);
    }
  }
}
