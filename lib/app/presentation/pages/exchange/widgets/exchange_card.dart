import 'package:flutter/material.dart';

class ExchangeCard extends StatelessWidget {
  const ExchangeCard({
    super.key,
    required this.logo,
    required this.description,
    required this.brand,
    required this.image,
  });
  final String logo;
  final String description;
  final String brand;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Container(
      width: screenSize.width * 0.85,
      height: screenSize.height * 0.3,
      // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenSize.width * 0.9,
            // height: screenSize.height * 0.2,
            child: Image.asset(
              'assets/images/arbolito.jpg',
            ),
          ),
          // Flexible(
          //   child: Text(
          //     brand,
          //     style: const TextStyle(
          //         fontSize: 15,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.amber),
          //   ),
          // ),
          // Flexible(
          //   child: Text(description,
          //       style: const TextStyle(
          //         color: Colors.black,
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //       )),
          // ),
        ],
      ),
    );
  }
}
