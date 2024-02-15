import 'package:alborada_demo/app/presentation/pages/community/view/community_view.dart';
import 'package:alborada_demo/app/presentation/pages/exchange/view/exchange_view.dart';
import 'package:alborada_demo/app/presentation/pages/home/view/home_view.dart';
import 'package:alborada_demo/app/presentation/pages/initiatives/view/initiatives_page.dart';
import 'package:flutter/material.dart' show Icon, Icons, NavigationDestination;

const navigationBarItems = [
  NavigationDestination(
    icon: Icon(Icons.explore),
    label: 'Découverte',
  ),
  NavigationDestination(
    icon: Icon(Icons.brightness_7),
    label: 'cagnotte',
  ),
  NavigationDestination(
    icon: Icon(Icons.list),
    label: 'Initiatives',
  ),
  NavigationDestination(
    icon: Icon(Icons.people),
    label: 'Communaute',
  ),
];

const bodyWidget = [
  Homeview(),
  ExchangeView(),
  InitiativesView(),
  CommunityView(),
];
