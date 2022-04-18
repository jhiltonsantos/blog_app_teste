import 'package:flutter/material.dart';

SizedBox buildButtonOptions(
    {required String text,
      required Color colorButton,
      required Function()? onTap}) {
  return SizedBox(
    width: 100,
    height: 50,
    child: ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(fontSize: 20.0),
      ),
      style: ElevatedButton.styleFrom(primary: colorButton),
      onPressed: onTap,
    ),
  );
}