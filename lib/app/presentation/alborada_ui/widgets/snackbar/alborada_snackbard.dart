import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';

class AlboradaSnackBar {
  AlboradaSnackBar._(this.context);

  factory AlboradaSnackBar.of(BuildContext context) {
    return AlboradaSnackBar._(context);
  }

  BuildContext context;

  void _showSnack(String message, IconData icon, Color color) {
    context.showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            space4,
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
  }

  void danger(String message) {
    _showSnack(message, Icons.dangerous, Colors.red);
  }

  void warning(String message) {
    _showSnack(message, Icons.warning, Colors.orange);
  }

  void success(String message) {
    _showSnack(message, Icons.check, Colors.green);
  }

  void custom(Widget content) => context.showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [content],
          ),
          padding: edgeInsetsZero,
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
        ),
      );
}
