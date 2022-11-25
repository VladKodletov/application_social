import 'package:application_social/core/service/api_service/api_service.dart';
import 'package:application_social/core/service/models/user_model.dart';
import 'package:application_social/features/followers/presentation/Followers.dart';
import 'package:application_social/features/home/presentation/screens/widgets/home_widget.dart';
import 'package:application_social/features/onboarding/presentation/screens/onboard.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexNavigation = 0;
  final pages = [
    const HomeWidget(),
    const FollowersScreen(),
    const OnBoardScreen(),
    const OnBoardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexNavigation],
      bottomNavigationBar: NavigationBar(
        selectedIndex: indexNavigation,
        onDestinationSelected: (value) => setState(() {
          indexNavigation = value;
        }),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.people_alt_sharp), label: 'Followers'),
          NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline_rounded), label: 'Chat'),
          NavigationDestination(
              icon: Icon(Icons.account_box_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}