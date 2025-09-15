import 'package:flutter/material.dart';

import '../extensions/extensions.dart';

SnackBar _snackBarCustomizado({
  required BuildContext context,
  required String message,
  required Color backgroundColor,
  required IconData icon,
  int duration = 5,
}) {
  return SnackBar(
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: duration),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            message,
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

void mostrarSnackBarErro(
  BuildContext context,
  String mensagem, {
  int duracao = 5,
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    _snackBarCustomizado(
      context: context,
      message: mensagem,
      backgroundColor: context.esquemaCores.error,
      icon: Icons.error_outline,
      duration: duracao,
    ),
  );
}

void mostrarSnackBarSucesso(
  BuildContext context,
  String message, {
  int duration = 5,
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    _snackBarCustomizado(
      context: context,
      message: message,
      backgroundColor: context.esquemaCores.tertiary,
      icon: Icons.check_circle_outline,
      duration: duration,
    ),
  );
}

void mostarSnackBarAviso(
  BuildContext context,
  String message, {
  int duration = 5,
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    _snackBarCustomizado(
      context: context,
      message: message,
      backgroundColor: context.esquemaCores.secondary,
      icon: Icons.warning_amber_rounded,
      duration: duration,
    ),
  );
}
