import 'package:alborada_demo/app/presentation/alborada_ui/icons/alborada_icons.dart';
import 'package:alborada_demo/app/presentation/views/Map/alborada_map.dart';
import 'package:alborada_demo/app/presentation/views/home/view/home_view.dart';
import 'package:alborada_demo/app/presentation/views/whishes/view/wishes_view.dart';
import 'package:flutter/material.dart' show Icon, NavigationDestination;

const navigationBarItems = [
  NavigationDestination(
    icon: Icon(AlboradaIcons.compass),
    label: 'Causas' /* 'Découverte' */,
  ),
  NavigationDestination(
    icon: Icon(AlboradaIcons.list),
    label: 'Mapa' /* 'Initiatives' */,
  ),
  NavigationDestination(
    // TODO: Icon doesnt looks as the design
    icon: Icon(size: 30, AlboradaIcons.deseos),
    label: 'Deseos' /* 'cagnotte' */,
  ),
  // NavigationDestination(
  //   icon: Icon(AlboradaIcons.social),
  //   label: 'Communaute',
  // ),
];
const tabItems = [
  NavigationDestination(
    icon: Icon(AlboradaIcons.bars),
    label: 'Tous',
  ),
  NavigationDestination(
    icon: Icon(AlboradaIcons.solidarity),
    label: 'Solidarité',
  ),
  NavigationDestination(
    icon: Icon(AlboradaIcons.health),
    label: 'Santé',
  ),
  NavigationDestination(
    icon: Icon(AlboradaIcons.environement),
    label: 'Environnement',
  ),
];

const bodyWidget = [
  Homeview(),
  AlboradaMap(),
  WishesView(),
  // InitiativesView(),
  // CommunityView(),
];
