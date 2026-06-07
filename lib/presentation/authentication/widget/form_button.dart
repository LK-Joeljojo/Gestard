import 'package:flutter/material.dart';
import 'package:gestard/core/color.dart';

class FormButton extends StatelessWidget {
  final Color? bgColor;
  final Widget? child;
  final BorderSide? border;
  final VoidCallback? onPressed;

  const FormButton({
    super.key,
    this.bgColor = JColor.primayColor,
    this.child,
    this.border,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    // 👉 Si border est défini → bouton outline
    if (border != null) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          side: border,
        ),
        child: child,
      );
    }

    // 👉 Sinon bouton normal
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: child,
    );
  }
}