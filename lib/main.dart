import 'package:application_social/features/onboarding/presentation/screens/onboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: OnBoardScreen()),
    );
  }
}
