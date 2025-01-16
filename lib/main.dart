import 'package:alborada_demo/app/alborada_app.dart';
import 'package:alborada_demo/app/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const platform = MethodChannel("com.map.app/env");
  const apiKey = String.fromEnvironment("GOOGLE_MAPS_API_KEY",
      defaultValue: "No key found");
  try {
    await platform.invokeMethod("setApiKey", {"apiKey": apiKey});
  } catch (e) {
    print("Failed to pass API Key to native code: $e");
  }
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );
  setupServiceLocator();
  runApp(const AlboradaApp());
}
