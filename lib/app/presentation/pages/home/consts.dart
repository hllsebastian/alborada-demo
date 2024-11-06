import 'package:alborada_demo/app/presentation/alborada_ui/icons/alborada_icons.dart';
import 'package:alborada_demo/app/presentation/pages/Map/alborada_map.dart';
import 'package:alborada_demo/app/presentation/pages/community/view/community_view.dart';
import 'package:alborada_demo/app/presentation/pages/exchange/view/exchange_view.dart';
import 'package:alborada_demo/app/presentation/pages/home/view/home_view.dart';
import 'package:flutter/material.dart' show Icon, Icons, NavigationDestination;

const navigationBarItems = [
  NavigationDestination(
    icon: Icon(AlboradaIcons.compass),
    label: 'Découverte',
  ),
  NavigationDestination(
    // TODO: Icon doesnt looks as the design
    icon: Icon(size: 30, AlboradaIcons.deseos),
    label: 'cagnotte',
  ),
  NavigationDestination(
    icon: Icon(AlboradaIcons.list),
    label: 'Initiatives',
  ),
  NavigationDestination(
    icon: Icon(AlboradaIcons.social),
    label: 'Communaute',
  ),
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
  ExchangeView(),
  AlboradaMap(),
  // InitiativesView(),
  CommunityView(),
];
