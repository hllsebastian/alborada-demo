import 'package:alborada_demo/app/domain/models/initiative_info.dart';
import 'package:alborada_demo/app/presentation/design/cards/initiative_action_card.dart';
import 'package:flutter/material.dart';

enum InitiativeType { environnement, solidarite, caritalive }

const listOfInitiatives = [
  InitiativeInfo(
    'Environnement',
    'Lorem ipsum dolor sit amet consectetur adipiscing elit nam,',
    'blandit feugiat ultricies turpis donec',
  ),
  InitiativeInfo(
    'Caritalive',
    'Lorem ipsum dolor sit amet consectetur adipiscing elit nam,',
    'blandit feugiat ultricies turpis donec',
  ),
  InitiativeInfo(
    'Solidarite',
    'Lorem ipsum dolor sit amet consectetur adipiscing elit nam,',
    'blandit feugiat ultricies turpis donec',
  ),
  InitiativeInfo(
    'Caritalive',
    'Lorem ipsum dolor sit amet consectetur adipiscing elit nam,',
    'blandit feugiat ultricies turpis donec',
  ),
  InitiativeInfo(
    'Environnement',
    'Lorem ipsum dolor sit amet consectetur adipiscing elit nam,',
    'blandit feugiat ultricies turpis donec',
  ),
];

class InitiativeList extends StatelessWidget {
  const InitiativeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: listOfInitiatives.length,
        itemBuilder: (context, index) {
          final initiativeItem = listOfInitiatives[index];
          return InitiativeActionCard(
            type: initiativeItem.type,
            description: initiativeItem.description,
            phrase: initiativeItem.phrase,
          );
        },
      ),
    );
  }
}
