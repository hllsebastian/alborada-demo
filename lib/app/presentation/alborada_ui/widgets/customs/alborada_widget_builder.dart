import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

typedef AlboradaWidgetBuilder = Widget Function(BuildContext);

class TMResponsiveBuilder extends StatelessWidget {
  const TMResponsiveBuilder({
    required this.mobile,
    required this.tablet,
    super.key,
  });
  final AlboradaWidgetBuilder mobile;
  final AlboradaWidgetBuilder tablet;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: mobile,
      tablet: tablet,
      desktop: tablet,
    );
  }
}
