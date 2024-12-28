import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';

class AlboradaLoader extends StatelessWidget {
  const AlboradaLoader({super.key, this.padding});
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Opacity(
        opacity: 0.5,
        child: ColoredBox(
          color: Palette.black,
          child: Padding(
            padding: padding ?? edgeInsetZero,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Palette.yellow100,
                color: Palette.lightGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
