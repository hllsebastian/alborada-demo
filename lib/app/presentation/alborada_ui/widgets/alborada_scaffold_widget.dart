import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';

class AlboradaScaffoldWidget extends StatelessWidget {
  const AlboradaScaffoldWidget({
    required this.body,
    super.key,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.scrollPhysics,
  });
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final ScrollPhysics? scrollPhysics;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: scrollPhysics,
          child: body,
        ),
      ),
    );
  }
}
