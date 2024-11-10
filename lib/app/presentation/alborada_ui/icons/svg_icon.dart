import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.svgName, {
    super.key,
  });
  final String svgName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/svg/$svgName',
        colorFilter: ColorFilter.mode(
          const Color(0xffffec574),
          BlendMode.srcIn,
        ),
        width: 20,
        height: 20,
      ),
    );
  }
}
