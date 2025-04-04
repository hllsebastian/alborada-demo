import 'package:alborada_demo/app/domain/entities/alborada_user.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/widgets/alborada_scaffold_widget.dart';
import 'package:alborada_demo/app/presentation/views/alborada/widget/alborada_app_bar.dart';
import 'package:alborada_demo/app/presentation/views/cubit/user_cubit/user_cubit.dart';
import 'package:alborada_demo/app/presentation/views/home/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// This page display the home pages
class AlboradaPageView extends StatefulWidget {
  const AlboradaPageView({super.key});

  @override
  State<AlboradaPageView> createState() => _AlboradaPageViewState();
}

class _AlboradaPageViewState extends State<AlboradaPageView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, AlboradaUser?>(
      builder: (context, state) {
        return AlboradaScaffoldWidget(
          appBar: AlboradaAppbar(),
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  fontWeight: FontWeight.bold,
                );
              }
              return const TextStyle(
                fontWeight: FontWeight.normal,
              );
            })),
            child: NavigationBar(
              animationDuration: const Duration(milliseconds: 600),
              height: MediaQuery.sizeOf(context).height * 0.1,
              selectedIndex: _selectedIndex,
              indicatorColor: Colors.amber,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: navigationBarItems,
            ),
          ),
          body: bodyWidget[_selectedIndex],
        );
      },
    );
  }
}
