import 'package:flutter/material.dart';

class LabelForm extends StatelessWidget {
  final String title;
  final Color color;
  final double? size;

  const LabelForm(
      {Key? key, required this.title, required this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: size ?? 24.0,
          color: color,
        ),
      ),
    );
  }
}
