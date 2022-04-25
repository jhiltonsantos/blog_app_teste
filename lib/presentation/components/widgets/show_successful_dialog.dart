import 'package:blog_teste_tecnico/presentation/components/theme/colors_components.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/response_dialog.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/success_dialog.dart';
import 'package:flutter/material.dart';

// TODO: tornar um stateless widget
Future<void> showSuccessfulDialog(BuildContext context, String message) async {
  await showDialog(
      context: context,
      builder: (contextDialog) {
        return SuccessDialog(message);
      });
  Navigator.pop(context);
}

class ShowSuccessfulDialog extends StatelessWidget {
  final String text;

  const ShowSuccessfulDialog({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      message: text,
      icon: Icons.done,
      colorIcon: floatActionButtonColor,
    );
  }
}
