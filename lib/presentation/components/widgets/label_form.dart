import 'package:flutter/material.dart';

Padding labelForm(String title, Color color) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 24.0,
        color: color,
      ),
    ),
  );
}