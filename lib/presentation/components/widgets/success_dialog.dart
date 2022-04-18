import 'package:blog_teste_tecnico/presentation/components/theme/colors_components.dart';
import 'package:blog_teste_tecnico/presentation/components/widgets/response_dialog.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final IconData icon;

  const SuccessDialog(
      this.message, {Key? key,
        this.icon = Icons.done,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      message: message,
      icon: icon,
      colorIcon: floatActionButtonColor,
    );
  }
}