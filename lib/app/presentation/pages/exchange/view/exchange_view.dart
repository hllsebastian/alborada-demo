import 'package:alborada_demo/app/presentation/pages/exchange/widgets/exchange_card.dart';
import 'package:flutter/material.dart';

class ExchangeView extends StatelessWidget {
  const ExchangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return const ExchangeCard(
          logo: 'logo',
          description: 'description',
          brand: 'brand',
          image: 'image',
        );
      },
    );
  }
}
