import 'package:alborada_demo/app/alborada_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  startApp();
}

void startApp() => runApp(const AlboradaApp());
