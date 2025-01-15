import 'package:flutter/material.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: const ColoredBox(
        color: Colors.blue,
        child: Center(
          child: Text('Community Communinty Page'),
        ),
      ),
    );
  }
}
