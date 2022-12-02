import 'package:application_social/core/provider/login_provider.dart';
import 'package:application_social/features/onboarding/presentation/onboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Login>(
      create: (context) => Login(),
      child: MaterialApp(
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
                const Color(0xffffffff),
              ),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(body: OnBoardScreen()),
      ),
    );
  }
}
