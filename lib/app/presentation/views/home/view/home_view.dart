import 'package:alborada_demo/app/presentation/alborada_ui/icons/alborada_icons.dart';
import 'package:alborada_demo/app/presentation/design/alborada_texts.dart';
import 'package:alborada_demo/app/presentation/views/home/widgets/Initiative_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'find_initiative.dart';
part 'find_initiative_by.dart';

class Homeview extends StatelessWidget {
  const Homeview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: const Column(
        children: [
          SizedBox(height: 10),
          Divider(
            thickness: 0.5,
          ),
          // TODO: add in next phase
          // _FindInitiative(),
          // Tabs(),
          // _FindInitiativeBy(),
          InitiativeList(),
        ],
      ),
    );
  }
}
