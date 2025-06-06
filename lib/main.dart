import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_test/app/screen/get_start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: GetStartScreen());
  }
}
