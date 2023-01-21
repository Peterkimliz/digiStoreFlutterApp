import 'package:digi_store/controllers/auth_controller.dart';
import 'package:digi_store/screens/auth/register.dart';
import 'package:digi_store/widgets/auth_button.dart';
import 'package:digi_store/widgets/input_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset("assets/images/digishop.png"),
              ),
              SizedBox(height: 10),
              Form(
                  child: Column(
                children: [
                  inputWidget(
                      controller: authController.textEditingControllerEmail,
                      hint: "Email",
                      icon: Icons.email),
                  SizedBox(
                    height: 20,
                  ),
                  inputWidget(
                      controller: authController.textEditingControllerPassword,
                      hint: "Password",
                      icon: Icons.lock),
                ],
              )),
              SizedBox(height: 30),
              authButton(title: "Login", onPressed: () {}),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Center(
                    child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Dont have an account?',
                          style: TextStyle(color: Colors.grey)),
                      TextSpan(
                          text: 'Create',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => RegisterPage());
                            },
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold))
                    ],
                  ),
                )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
