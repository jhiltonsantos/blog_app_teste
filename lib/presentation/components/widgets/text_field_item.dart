import 'package:blog_teste_tecnico/presentation/components/theme/colors_components.dart';
import 'package:flutter/material.dart';

class TextFieldItem extends StatelessWidget {
  final TextEditingController controller;
  const TextFieldItem({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        maxLines: 10,
        minLines: 1,
        expands: false,
        controller: controller,
        style: const TextStyle(fontSize: 20.0),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: floatActionButtonColor,
                width: 3.0,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}


