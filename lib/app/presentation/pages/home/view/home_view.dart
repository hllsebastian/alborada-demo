import 'package:alborada_demo/app/presentation/alborada_ui/icons/alborada_icons.dart';
import 'package:alborada_demo/app/presentation/design/alborada_texts.dart';
import 'package:alborada_demo/app/presentation/pages/home/widgets/Initiative_list.dart';
import 'package:alborada_demo/app/presentation/pages/home/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'app_bar.dart';
part 'find_initiative.dart';
part 'find_initiative_by.dart';

class Homeview extends StatelessWidget {
  const Homeview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        _Appbar(),
        _FindInitiative(),
        Tabs(),
        // _FindInitiativeBy(),
        InitiativeList(),
      ],
    );
  }
}
