import 'package:flutter/material.dart';

Padding labelFormItem(String title, {double? size, Color? color}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Text(
      title,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size ?? 24.0,
      ),
    ),
  );
}