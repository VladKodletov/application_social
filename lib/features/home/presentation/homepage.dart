import 'package:flutter/material.dart';

import 'package:application_social/features/followers/presentation/Followers.dart';
import 'package:application_social/features/home/presentation/widgets/home_widget.dart';
import 'package:application_social/features/profile/presentation/profile_screen.dart';

class HomePage extends StatefulWidget {
  final String userName;
  const HomePage({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int indexNavigation = 0;
  late List pages = [
    HomeWidget(nameLogin: widget.userName),
    FollowersScreen(nameLogin: widget.userName),
    FollowersScreen(nameLogin: widget.userName),
    ProfileScreen(nameLogin: widget.userName),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexNavigation],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black.withOpacity(0),
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
