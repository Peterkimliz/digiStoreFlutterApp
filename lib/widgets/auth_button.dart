import 'package:flutter/material.dart';

Widget authButton({required Widget widget, required onPressed}) {
  return Center(
    child: InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: 150,
        padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        decoration: BoxDecoration(
            color: Colors.lightGreen.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30)),
        child:widget,
      ),
    ),
  );
}
