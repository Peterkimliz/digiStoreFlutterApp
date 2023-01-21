import 'package:digi_store/controllers/auth_controller.dart';
import 'package:digi_store/screens/auth/login.dart';
import 'package:digi_store/widgets/auth_button.dart';
import 'package:digi_store/widgets/input_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
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
                height: 10,
              ),
              Center(
                child: Container(
                    height: 200,
                    child: Image.asset("assets/images/digishop.png")),
              ),
              Form(
                  child: Column(
                children: [
                  inputWidget(
                      controller: authController.textEditingControllerName,
                      hint: "Name",
                      icon: Icons.person),
                  SizedBox(
                    height: 20,
                  ),
                  inputWidget(
                      controller: authController.textEditingControllerEmail,
                      hint: "Email",
                      icon: Icons.email),
                  SizedBox(
                    height: 20,
                  ),
                  inputWidget(
                      controller: authController.textEditingControllerPhone,
                      hint: "Phone",
                      icon: Icons.phone),
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
              authButton(
                  widget: Center(
                    child: Text(
                      "Register".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {}),
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
                          text: 'Already have an account?',
                          style: TextStyle(color: Colors.grey)),
                      TextSpan(
                          text: 'Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.off(() => LoginPage());
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
