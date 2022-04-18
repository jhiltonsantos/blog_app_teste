import 'package:flutter/material.dart';

Padding inputTextField(TextEditingController _controller) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: TextField(
      autofocus: true,
      controller: _controller,
      style: const TextStyle(fontSize: 24.0),
      decoration: const InputDecoration(border: OutlineInputBorder()),
    ),
  );
}