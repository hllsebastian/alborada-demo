import 'package:alborada_demo/app/presentation/alborada_ui/icons/alborada_icons.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InitiativeDetailsView extends StatelessWidget {
  const InitiativeDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Description(),
                    Divider(),
                    _Address(screenSize: screenSize),
                    Divider(),
                    _HowWorks(),
                    SimpleButton(
                      isDarkButton: true,
                      text: 'Reserva',
                      onPressed: () {},
                    ),
                    SimpleButton(
                      text: 'Escanear un QR',
                      icon: Icons.qr_code,
                      buttonColor: Colors.orange.shade300,
                      textColor: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/png/arbolito.jpg'),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: HomeBackButton(),
        )
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Magica Vispera de Navidad #2',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Comparte un día magico y apoya a los niños que más lo necesitan esta Navidad @alborada',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ButtonIconWidget(
                text: 'Santa Cruz',
                imagePath: 'pin.svg',
                buttonColor: Colors.black,
              ),
              SizedBox(width: 8),
              ButtonIconWidget(
                text: '14/12',
                imagePath: 'calendar.svg',
                buttonColor: Colors.black,
              ),
              SizedBox(width: 8),
              ButtonIconWidget(
                text: '+5',
                imagePath: 'deseos.svg',
                buttonColor: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Address extends StatelessWidget {
  const _Address({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            AlboradaIcons.deseos,
            color: Colors.amber,
            size: 40,
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'E.I. El Playon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Cl. 125 # 51 D 12, Playon de los Comuneros, Santa Cruz, Medellin',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HowWorks extends StatelessWidget {
  const _HowWorks({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Como funciona?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade200,
            ),
          ),
          SizedBox(height: 20),
          _HowWorksItem(
            screenSize,
            'Hazte voluntario',
            'Anima actividades, distribuye alimentos y regalos, y disfruta de experiencia con el equipo de voluntarios',
            Icons.handshake_outlined,
          ),
          SizedBox(height: 16),
          _HowWorksItem(
            screenSize,
            'Haz una donación economica',
            'Apoya la causa y contribuye a proporcionar alimentos, materiales escolares y regalos para los niños de la escula',
            Icons.attach_money_rounded,
          ),
          SizedBox(height: 16),
          _HowWorksItem(
            screenSize,
            'Dona artículos en buen estado',
            'Tienes material escolar, libros o juguetes en buen estado que ya no usas? Dónalos y dale una segunda vida',
            Icons.favorite,
          ),
        ],
      ),
    );
  }

  Row _HowWorksItem(
    Size screenSize,
    String title,
    String description,
    IconData icon,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: Icon(icon),
        ),
        SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
