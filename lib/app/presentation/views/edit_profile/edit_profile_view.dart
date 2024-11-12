import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        _AppBar(),
        SizedBox(
          width: double.infinity,
          height: 10,
          child: ColoredBox(color: Palette.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              _ImageAndName(),
              CustomTextField(
                maxLines: 4,
                hintText: 'Espacio para hablar de ti',
                textStyle: AlboradaTextStyle.tagText.copyWith(fontSize: 12),
                initialValue:
                    'Apasionada por el cambio social y el trabajo comunitario. Creyente de que cada pequq;a acción puede transformar vidas. 🌎✨',
                onChanged: (a) {},
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
    );
  }
}

class _ImageAndName extends StatelessWidget {
  const _ImageAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image profile
        Container(
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
        ),
        Flexible(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Igresa acá tu nombre',
                initialValue: 'Saitama Seiyū',
                textStyle: AlboradaTextStyle.bodyText.copyWith(
                  color: Palette.black,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (a) {},
              ),
              CustomTextField(
                hintText: 'Ingresa aca tu apellido',
                initialValue: 'Makoto Furukawa',
                textStyle: AlboradaTextStyle.bodyText.copyWith(
                  color: Palette.black,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (a) {},
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
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Guardar',
              style: AlboradaTextStyle.bodyText
                  .copyWith(fontSize: 16, color: Palette.black),
            ),
          ),
        ],
      ),
    );
  }
}
