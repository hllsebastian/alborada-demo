import 'package:flutter/material.dart';

class InitiativeActionCard extends StatelessWidget {
  const InitiativeActionCard({
    super.key,
    required this.type,
    required this.description,
    required this.phrase,
  });
  final String type;
  final String description;
  final String phrase;

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
              image: AssetImage('assets/images/arbolito.jpg'))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              '🌱  $type',
              style: const TextStyle(color: Colors.amber),
            ),
            onPressed: () {},
          ),
          const Spacer(),
          Text(description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          Text(
            phrase,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
