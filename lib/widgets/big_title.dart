import 'package:flutter/material.dart';

Widget bigTitle({required title, double? size = 18.0, required Color color}) {
  return Text(title,
      maxLines: 2,
      style: TextStyle(
        fontSize: size,

        color: color,
        fontWeight: FontWeight.w600,
      ));
}
