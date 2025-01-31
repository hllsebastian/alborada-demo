import 'package:alborada_demo/app/domain/entities/alborada_user.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:alborada_demo/app/presentation/views/cubit/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlboradaAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AlboradaAppbar({super.key});

  @override
  Size get preferredSize {
    return const Size.fromHeight(56);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, AlboradaUser?>(
      builder: (context, state) {
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Palette.white,
          elevation: 0,
          bottomOpacity: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ButtonIconWidget(
                  height: 32,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  buttonColor: Palette.black,
                  text: state?.totalPoints.toString() ?? '0',
                  imagePath: 'deseos.svg'),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.profile),
              child: Container(
                width: 46,
                height: 46,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image:
                        AssetImage('assets/images/png/saitama_poker_face.png'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black12,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
