import 'package:flutter/material.dart';

class ButtonOptionsWidget extends StatelessWidget {
  final String text;
  final Color colorButton;
  final Function()? onTap;

  const ButtonOptionsWidget(
      {Key? key, required this.text, required this.colorButton, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
