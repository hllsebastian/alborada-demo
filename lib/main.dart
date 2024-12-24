import 'package:alborada_demo/app/alborada_app.dart';
import 'package:alborada_demo/app/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://sjxtxbnwxhhuqurkoecn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNqeHR4Ym53eGhodXF1cmtvZWNuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ3MzI0NjAsImV4cCI6MjA1MDMwODQ2MH0.JRA3yXgwWkfpVhYr4ivinB3WkGZZam8EXpDVoGhug0A',
  );
  setupServiceLocator();
  runApp(const AlboradaApp());
}
