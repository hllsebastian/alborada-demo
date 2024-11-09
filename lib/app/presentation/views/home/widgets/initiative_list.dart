import 'package:alborada_demo/app/domain/models/initiative_info.dart';
import 'package:alborada_demo/app/presentation/design/cards/initiative_action_card.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

enum InitiativeType { environnement, solidarite, caritalive }

const listOfInitiatives = [
  InitiativeInfo(
    type: 'Environnement',
    title: 'Lorem',
    description: 'blandit feugiat ultricies turpis donec',
  ),
  InitiativeInfo(
    type: 'Caritalive',
    title: 'Lorem ipsum',
    description:
        'blandit feugiat ultricies turpis donec blandit feugiat ultricies turpis donec',
  ),
  InitiativeInfo(
    type: 'Solidarite',
    title: 'Lorem ipsum dolor sit amet ',
    description:
        'blandit feugiat ultricies turpis donec blandit feugiat ultricies turpis donec blandit feugiat ultricies turpis donec',
  ),
  InitiativeInfo(
    type: 'Caritalive',
    title: 'Lorem ipsum dolor sit amet consectetur',
    description:
        'blandit feugiat ultricies turpis donecblandit feugiat ultricies turpis donecblandit feugiat ultricies turpis donec blandit feugiat ultricies turpis donec',
  ),
  InitiativeInfo(
    type: 'Environnement',
    title: 'Lorem ipsum dolor sit amet consectetur adipiscing elit nam,',
    description:
        'blandit feugiat ultricies turpis donec blandit feugiat ultricies turpis donec blandit feugiat ultricies turpis donec blandit feugiat ultricies turpis donec blandit feugiat ultricies turpis donec blandit feugiat ultricies turpis donec',
  ),
];

class InitiativeList extends StatelessWidget {
  const InitiativeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: listOfInitiatives.length,
      itemBuilder: (context, index) {
        final initiativeItem = listOfInitiatives[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.initiativeDetails);
            print('Navigate to $index');
          },
          child: InitiativeActionCard(
            type: initiativeItem.type ?? '',
            initiativeName: initiativeItem.title ?? '',
            associationName: initiativeItem.description ?? '',
          ),
        );
      },
    );
  }
}
