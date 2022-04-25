import 'package:flutter/material.dart';

class LabelFormItem extends StatelessWidget {
  final String title;
  final double? size;
  final Color? color;

  const LabelFormItem({Key? key, required this.title, this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
