import 'package:alborada_demo/app/presentation/alborada_ui/icons/svg_icon.dart';
import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {
  const ButtonIconWidget({
    super.key,
    required this.text,
    required this.imagePath,
    this.buttonColor,
  });
  final String text;
  final String imagePath;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: buttonColor ?? Colors.black26.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgIcon(imagePath),
          const SizedBox(width: 1),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
