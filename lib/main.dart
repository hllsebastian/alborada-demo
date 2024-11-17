import 'package:alborada_demo/app/alborada_app.dart';
import 'package:alborada_demo/flavor_config.dart';
import 'package:flutter/material.dart';

void main() {
  FlavorConfig.initialize(Environment.dev);
  runApp(const AlboradaApp());
}
