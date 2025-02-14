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
        final userState = context.watch<UserCubit>().state;
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
            // ProfileImageWidget(
            //   imageUrl: context.watch<UserCubit>().state?.profileImage,
            // ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.profile),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: userState != null &&
                        userState.profileImage != null &&
                        userState.profileImage!.isNotEmpty
                    ? NetworkImage(userState.profileImage!) as ImageProvider
// TODO: change default profile image from backend
                    : AssetImage('assets/images/png/profile3.png'),
              ),
            ),
          ],
        );
      },
    );
  }
}
