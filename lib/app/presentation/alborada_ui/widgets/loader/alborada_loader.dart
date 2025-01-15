import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';

class AlboradaLoader extends StatelessWidget {
  const AlboradaLoader({
    super.key,
    this.padding,
    this.height,
    this.width,
  });
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: ColoredBox(
        color: Colors.black.withOpacity(0.1),
        child: Padding(
          padding: padding ?? edgeInsetsZero,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Palette.yellow100,
              color: Palette.lightGrey,
            ),
          ),
        ),
      ),
    );
  }
}
