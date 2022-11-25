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
        primarySwatch: Colors.grey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.amber.shade900,
            ), //button color
            foregroundColor: MaterialStateProperty.all<Color>(
              Color(0xffffffff),
            ), //text (and icon)
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: OnBoardScreen()),
    );
  }
}
