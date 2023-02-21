import 'package:flutter/material.dart';

Widget smallTitle({required title, double? size = 14.0, required Color color}) {
  return Text(title,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
        color: color,

      ));
}