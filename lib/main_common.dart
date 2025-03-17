import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/alborada_app.dart';
import 'app/di/service_locator.dart';

// TODO: add runZonedGuarded
Future<void> mainCommon({required String flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env.$flavor');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );

  await setupServiceLocator();

  runApp(AlboradaApp(flavor: flavor));
}
