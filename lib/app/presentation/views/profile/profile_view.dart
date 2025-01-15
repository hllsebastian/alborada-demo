import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:alborada_demo/app/presentation/views/profile/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        backgroundColor: Palette.yellow5,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          HomeBackButton(),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.29),
          Text(
            'Perfil',
            style: AlboradaTextStyle.heading3,
          ),
          Spacer(),
          Padding(
            padding: edgeInsetsR10,
            child: TextButton(
              child: Text(
                'Logout',
                style: AlboradaTextStyle.bodyText,
              ),
              onPressed: () {
                Supabase.instance.client.auth.signOut();
                print('Sesión cerrada correctamente');
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.signIn, (a) => false);
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: SizedBox(
            width: double.infinity,
            height: 10,
            child: ColoredBox(color: Palette.white),
          ),
        ),
      ),
      body: SizedBox(
        child: ColoredBox(
          color: Palette.yellow5,
          child: Padding(
            padding: edgeInsetsH26V30,
            child: Column(
              children: [
                Row(
                  children: [
                    _ProfileImage(),
                    // Name lastname and city
                    _NameAndCity(),
                    SizedBox(width: 20),
                    _EditeButton(),
                  ],
                ),
                SizedBox(height: 18),
                // Byo
                Text(
                    'Apasionada por el cambio social y el trabajo comunitario. Creyente de que cada pequq;a acción puede transformar vidas. 🌎✨')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: const DecorationImage(
          image: AssetImage('assets/images/png/saitama_poker_face.png'),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
    );
  }
}

class _NameAndCity extends StatelessWidget {
  const _NameAndCity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saitama Se˚iyū	Makoto Furukawa',
            style: AlboradaTextStyle.bodyText
                .copyWith(fontWeight: FontWeight.bold, color: Palette.black),
          ),
          Text(
            'Medellín, Colombia',
            style: AlboradaTextStyle.bodyText,
          ),
        ],
      ),
    );
  }
}

class _EditeButton extends StatelessWidget {
  const _EditeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonIconWidget(
      height: 32,
      margin: EdgeInsets.zero,
      padding: edgeInsetsH8,
      buttonColor: Palette.white,
      text: 'Editar',
      imagePath: 'deseos.svg',
      textStyle: AlboradaTextStyle.bodyText.copyWith(color: Palette.yellow80),
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Palette.yellow5,
            isScrollControlled: true,
            context: context,
            builder: (context) => EditProfileView());
      },
    );
  }
}
