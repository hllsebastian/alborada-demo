import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/design/alborada_texts.dart';
import 'package:alborada_demo/app/presentation/views/home/cubit/home_cubit.dart';
import 'package:alborada_demo/app/presentation/views/home/widgets/event_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

part 'find_initiative.dart';
part 'find_initiative_by.dart';

class Homeview extends StatelessWidget {
  const Homeview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<HomeCubit>()..fetchEvents(),
      child: Padding(
        padding: edgeInsetsH25,
        child: const Column(
          children: [
            SizedBox(height: 10),
            Divider(thickness: 0.5),
            // TODO: add in next phase
            // _FindInitiative(),
            // Tabs(),
            // _FindInitiativeBy(),
            EventList(),
          ],
        ),
      ),
    );
  }
}
