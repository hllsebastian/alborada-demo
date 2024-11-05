import 'package:alborada_demo/app/presentation/alborada_ui/icons/alborada_icons.dart';
import 'package:flutter/material.dart';

class InitiativeActionCard extends StatelessWidget {
  const InitiativeActionCard({
    super.key,
    required this.type,
    required this.initiativeName,
    required this.associationName,
  });
  final String type;
  final String initiativeName;
  final String associationName;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Container(
      width: screenSize.width * 0.85,
      height: screenSize.height * 0.35,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/arbolito.jpg'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          //   child: Text(
          //     '🌱  $type',
          //     style: const TextStyle(color: Colors.amber),
          //   ),
          //   onPressed: () {},
          // ),
          const Spacer(),
          Text(
            initiativeName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            associationName,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  _buildIconText(AlboradaIcons.deseos, '100'),
                  // const SizedBox(width: 8),
                  _buildIconText(AlboradaIcons.deseos, '100'),
                  // const SizedBox(width: 8),
                  _buildIconText(AlboradaIcons.social, '100'),
                  // const SizedBox(width: 8),
                  _buildIconText(AlboradaIcons.deseos, '100'),
                  // _buildIconText(AlboradaIcons.deseos, '100'),
                ],
              ),
            ],
          ),
        ],
      ),
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
            // size: 20,
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
}
