import 'package:alborada_demo/app/presentation/views/whishes/widgets/exchange_card.dart';
import 'package:flutter/material.dart';

class WishesView extends StatelessWidget {
  const WishesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const ExchangeCard(
            logo: 'logo',
            description: 'description',
            brand: 'brand',
            image: 'image',
          );
        },
      ),
    );
  }
}
