import 'package:flutter/material.dart';

Padding labelFormItem(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 24.0,
      ),
    ),
  );
}