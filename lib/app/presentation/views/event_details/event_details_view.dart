import 'package:alborada_demo/app/domain/entities/event.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/widgets/cards/event_image.dart';
import 'package:alborada_demo/app/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView(this.event, {super.key});
  final Event? event;

  @override
  Widget build(BuildContext context) {
    final eventDate = event?.date != null && event!.date.toString().isNotEmpty
        ? DateFormat('d/MM').format(event!.date!)
        : '';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageHeader(event?.imageUrl ?? ''),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Description(
                      eventName: event!.name,
                      neighborhood: event!.neighborhood,
                      description: event!.description,
                      date: eventDate,
                      points: event?.points.toString() ?? '',
                    ),
                    Divider(),
                    _Address(
                      address: event!.address,
                      place: event!.place,
                      urlIcon: event!.urlIcon ?? '',
                    ),
                    Divider(),
                    _HowWorks(event?.howWorks ?? ''),
                    // TODO: Add buttons when the reservetation functionality is required
                    // SimpleButton(
                    //   isDarkButton: true,
                    //   text: 'Reserva',
                    //   onPressed: () {},
                    // ),
                    // SimpleButton(
                    //   text: 'Escanear un QR',
                    //   icon: Icons.qr_code,
                    //   buttonColor: Colors.orange.shade300,
                    //   textColor: Colors.white,
                    //   onPressed: () {},
                    // )
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
  const _ImageHeader(this.urlImage);
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EventImage(urlImage),
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
    required this.eventName,
    required this.neighborhood,
    required this.description,
    required this.date,
    required this.points,
  });
  final String eventName;
  final String neighborhood;
  final String description;
  final String date;
  final String points;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsV20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // 'Magica Vispera de Navidad #2',
            // TODO: change font
            eventName,
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            // 'Comparte un día magico y apoya a los niños que más lo necesitan esta Navidad @alborada',
            description,
            style: GoogleFonts.outfit(fontSize: 18),
          ),
          gap16,
          Row(
            children: [
              // TODO: how is going to save the place in DB
              ButtonIconWidget(
                text: neighborhood,
                imagePath: 'pin.svg',
                buttonColor: Colors.black,
                textStyle: GoogleFonts.outfit(color: Colors.white),
              ),
              gap8,
              ButtonIconWidget(
                text: date,
                imagePath: 'calendar.svg',
                buttonColor: Colors.black,
                textStyle: GoogleFonts.outfit(color: Colors.white),
              ),
              gap8,
              ButtonIconWidget(
                text: '+$points',
                imagePath: 'deseos.svg',
                buttonColor: Colors.black,
                textStyle: GoogleFonts.outfit(color: Colors.white),
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
    required this.address,
    required this.place,
    this.urlIcon = '',
  });
  final String address;
  final String place;
  final String urlIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsV16,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          urlIcon.isNotEmpty
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(urlIcon) as ImageProvider),
                )
              : Icon(
                  AlboradaIcons.deseos,
                  color: Colors.amber,
                  size: 40,
                ),
          space10,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // TODO: place name
                  place,
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  address,
                  // 'Cl. 125 # 51 D 12, Playon de los Comuneros, Santa Cruz, Medellin',
                  style: GoogleFonts.outfit(fontSize: 14),
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
  const _HowWorks(this.howWorks);
  final String howWorks;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: edgeInsetsV20,
      child: howWorks.isEmpty
          ? sizedBoxShrink
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Como funciona?',
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    color: Colors.orange.shade200,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gap20,
                Text(
                  howWorks,
                  style: GoogleFonts.outfit(fontSize: 14),
                ),
                // _HowWorksItem(
                //   screenSize,
                //   'Hazte voluntario',
                //   'Anima actividades, distribuye alimentos y regalos, y disfruta de experiencia con el equipo de voluntarios',
                //   Icons.handshake_outlined,
                // ),
                // gap16,
                // _HowWorksItem(
                //   screenSize,
                //   'Haz una donación economica',
                //   'Apoya la causa y contribuye a proporcionar alimentos, materiales escolares y regalos para los niños de la escula',
                //   Icons.attach_money_rounded,
                // ),
                // gap16,
                // _HowWorksItem(
                //   screenSize,
                //   'Dona artículos en buen estado',
                //   'Tienes material escolar, libros o juguetes en buen estado que ya no usas? Dónalos y dale una segunda vida',
                //   Icons.favorite,
                // ),
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
        space30,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gap4,
              Text(
                description,
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
