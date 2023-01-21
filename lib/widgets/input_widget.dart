import 'package:flutter/material.dart';

Widget inputWidget(
    {required controller, required hint, required IconData icon}) {
  return Container(
    padding: EdgeInsets.all(10),
    child: TextFormField(
      controller: controller,
      keyboardType:
          hint == "Email" ? TextInputType.emailAddress : TextInputType.text,
      obscureText: hint == "Password" ? true : false,
      decoration: InputDecoration(

        filled: true,
        hintText: hint,
        fillColor: Colors.white,
        prefixIcon: Icon(icon, color: Colors.green),
        border: InputBorder.none,
      ),
      minLines: 1,
      maxLines: 1,
    ),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 3,
        color: Colors.grey,
      ),
    ], borderRadius: BorderRadius.circular(10), color: Colors.white),
  );
}
