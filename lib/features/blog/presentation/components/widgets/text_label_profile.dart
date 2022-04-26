import 'package:flutter/material.dart';

import 'label_form.dart';
import 'label_form_item.dart';

class TextLabelProfile extends StatelessWidget {
  final String text;
  final String data;

  const TextLabelProfile({Key? key, required this.text, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelFormItem(title: text, size: 20, color: Colors.grey[700]!),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: LabelForm(title: data, color: Colors.black, size: 20.0),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Divider(
            height: 2,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}