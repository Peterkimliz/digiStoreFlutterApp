import 'package:digi_store/controllers/user_controller.dart';
import 'package:digi_store/screens/home/home_page.dart';
import 'package:digi_store/services/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthController extends GetxController {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();
  Rxn<User> currentUser = Rxn(null);
  RxBool loginUserLoad = RxBool(false);

  validateInputs() {
    if (textEditingControllerEmail.text.isEmpty ||
        textEditingControllerPassword.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void loginUser({required context}) async {
    try {
      loginUserLoad.value = true;
      Map<String, dynamic> body = {
        "email": textEditingControllerEmail.text.trim(),
        "password": textEditingControllerPassword.text.trim()
      };
      var response = await Users.loginUser(body: body);
      print("response is ${ response["user"]["id"]}");
      if (response["message"] != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response["message"])));
      } else {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("token", response["token"]);
        preferences.setString("userId", response["user"]["id"]);
        User user = User.fromJson(response["user"]);
        currentUser.value = user;
        currentUser.refresh();
        Get.off(() => HomePage());
      }

      loginUserLoad.value = false;
    } catch (e) {
      loginUserLoad.value = false;
      print(e);
    }
  }

  getUid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? uid = sharedPreferences.getString("userId");
    if (uid != null) {
      Get.find<UserController>().getUserById(uid);
    }
  }
}
