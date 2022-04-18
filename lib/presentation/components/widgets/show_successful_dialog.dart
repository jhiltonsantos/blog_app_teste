import 'package:blog_teste_tecnico/presentation/components/widgets/success_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showSuccessfulDialog(BuildContext context, String message) async {
  await showDialog(
      context: context,
      builder: (contextDialog) {
        return SuccessDialog(message);
      });
  Navigator.pop(context);
}