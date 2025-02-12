import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/views/cubit/user_cubit/user_cubit.dart';
import 'package:alborada_demo/app/presentation/views/profile/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:alborada_demo/app/presentation/views/profile/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = context.read<UserCubit>().state;
    return BlocListener<EditProfileCubit, EditProfiletState>(
      listener: (context, state) {
        state.maybeWhen(
          updated: (user, isUpdated, selectedImage) {
            if (isUpdated) {
              context.read<UserCubit>().emitUser(user);
              context.showSnackBar(SnackBar(content: Text('Profile updated')));
              Navigator.pop(context);
            }
          },
          error: (message) {
            context.showSnackBar(SnackBar(content: Text(message)));
          },
          orElse: () {},
        );
      },
      child: Column(
        children: [
          SizedBox(height: 40),
          _AppBar(),
          SizedBox(
            width: double.infinity,
            height: 10,
            child: ColoredBox(color: Palette.white),
          ),
          Padding(
            padding: edgeInsetsH26,
            child: Column(
              children: [
                _ImageAndName(),
                CustomTextField(
                  maxLines: 4,
                  hintText: 'Espacio para hablar de ti',
                  textStyle: AlboradaTextStyle.tagText.copyWith(fontSize: 12),
                  initialValue: userState?.biography ?? '',
                  // 'Apasionada por el cambio social y el trabajo comunitario. Creyente de que cada pequq;a acción puede transformar vidas. 🌎✨',
                  onChanged: (a) {
                    if (userState != null) {
                      context
                          .read<EditProfileCubit>()
                          .updateFields(biography: a);
                    }
                  },
                ),
                CustomTextField(
                  hintText: 'Ciudad de residencia',
                  textStyle: AlboradaTextStyle.bodyText,
                  initialValue: 'Medellín',
                  onChanged: (a) {},
                ),
                CustomTextField(
                  hintText: 'Pais de residencia',
                  textStyle: AlboradaTextStyle.bodyText,
                  initialValue: 'Colombia',
                  onChanged: (a) {},
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ImageAndName extends StatelessWidget {
  const _ImageAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userState = context.read<UserCubit>().state;
    return Row(
      children: [
        // Image profile
        Column(
          children: [
            // ElevatedButton(
            //   onPressed: () async {
            //     final image = await context
            //         .read<EditProfileCubit>()
            //         .pickImage(ImageSource.gallery);
            //     if (image != null) {
            //       print('IMAGGEENNNN');
            //       // context.read<EditProfileCubit>().updateUserImage(image);
            //     }
            //   },
            //   child: Text("Seleccionar Imagen"),
            // ),
            // Container(
            //   width: 80,
            //   height: 80,
            //   margin: EdgeInsets.only(right: 20),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: const DecorationImage(
            //       image: AssetImage('assets/images/png/saitama_poker_face.png'),
            //       fit: BoxFit.cover,
            //     ),
            //     border: Border.all(
            //       color: Colors.black12,
            //       width: 1.0,
            //     ),
            //   ),
            // ),
            ProfileImageWidget(
              imageUrl: userState?.profileImage,
            )
          ],
        ),
        Flexible(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Igresa acá tu nombre',
                initialValue: userState?.name ?? '',
                textStyle: AlboradaTextStyle.bodyText.copyWith(
                  color: Palette.black,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (a) {
                  if (userState != null) {
                    context.read<EditProfileCubit>().updateFields(name: a);
                  }
                },
              ),
              CustomTextField(
                hintText: 'Ingresa aca tu apellido',
                initialValue: userState?.lastName ?? '',
                textStyle: AlboradaTextStyle.bodyText.copyWith(
                  color: Palette.black,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (a) {
                  if (userState != null) {
                    context.read<EditProfileCubit>().updateFields(lastName: a);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.yellow5,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancelar',
              style: AlboradaTextStyle.bodyText
                  .copyWith(fontSize: 16, color: Palette.black),
            ),
          ),
          Spacer(),
          Text(
            'Perfil',
            style: AlboradaTextStyle.heading3,
          ),
          Spacer(),
          BlocBuilder<EditProfileCubit, EditProfiletState>(
            builder: (context, state) {
              return TextButton(
                child: Text(
                  'Guardar',
                  style: AlboradaTextStyle.bodyText
                      .copyWith(fontSize: 16, color: Palette.black),
                ),
                onPressed: () {
                  final user = state.mapOrNull(updated: (a) => a.user);
                  if (user == null) {
                    print('RENULLLLLL');
                    return;
                  }
                  print(user);
                  context.read<EditProfileCubit>().updateUserProfile(user);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
