import 'package:alborada_demo/app/presentation/design/alborada_texts.dart';
import 'package:alborada_demo/app/presentation/pages/home/widgets/Initiative_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// part 'alborada_navigation_bar.dart';
part 'find_initiative_by.dart';
part 'find_initiative.dart';
part 'app_bar.dart';

class Homeview extends StatelessWidget {
  const Homeview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 45),
        _Appbar(),
        _FindInitiative(),
        _FindInitiativeBy(),
        InitiativeList(),
      ],
    );
  }
}
