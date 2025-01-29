import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/icons/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventActionCard extends StatelessWidget {
  const EventActionCard({
    super.key,
    required this.type,
    required this.initiativeName,
    required this.associationName,
    required this.event,
  });
  final String type;
  final String initiativeName;
  final String associationName;
  final Event event;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    final eventDate = event.date != null && event.date.toString().isNotEmpty
        ? DateFormat('d/MM').format(event.date!)
        : '';

    return Column(
      children: [
        Container(
          width: screenSize.width * 0.85,
          height: screenSize.height * 0.35,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/png/arbolito.jpg'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TODO: display distance
                  _buildIconWidget('pin.svg', '100m'),
                  _buildIconWidget('calendar.svg', eventDate),
                  _buildIconWidget('deseos.svg', event.points.toString()),
                ],
              ),
            ],
          ),
        ),
        _InitiativeDescription(
          initiativeName: initiativeName,
          associationName: associationName,
        ),
      ],
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: const Color(0xfff222222),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xffffec574),
          ),
          const SizedBox(width: 1),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconWidget(String nameImage, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.black26.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgIcon(nameImage),
          const SizedBox(width: 1),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _InitiativeDescription extends StatelessWidget {
  const _InitiativeDescription({
    required this.initiativeName,
    required this.associationName,
  });

  final String initiativeName;
  final String associationName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              initiativeName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              associationName,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
