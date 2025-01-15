import 'package:alborada_demo/app/domain/models/initiative_info.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/views/event_details/event_details_view.dart';
import 'package:alborada_demo/app/presentation/views/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.isLoading
            ? Padding(
                padding: edgeInsetsT56,
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Palette.black,
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: state.events.length,
                itemBuilder: (context, index) {
                  // final initiativeItem = listOfInitiatives[index];
                  final event = state.events[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.initiativeDetails);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (route) => EventDetailsView(event),
                        ),
                      );
                    },
                    child: EventActionCard(
                      event: event,
                      type: 'initiativeItem.type',
                      initiativeName: event.name,
                      associationName: event.description,
                    ),
                  );
                },
              );
      },
    );
  }
}
