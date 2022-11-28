import 'package:flutter/material.dart';

import 'package:application_social/core/service/api_service/api_service.dart';
import 'package:application_social/core/service/models/user_model.dart';
import 'package:application_social/features/profile/presentation/widgets/profile_button.dart';

class ProfileScreen extends StatefulWidget {
  final String nameLogin;
  const ProfileScreen({
    Key? key,
    required this.nameLogin,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool login = false;
  String nameCompany = '';
  String email = '';
  String bio = '';
  String name = '';

  User _user = User(
    login: '',
    id: 1,
    avatarUrl: '',
    followersUrl: '',
    followingUrl: '',
    organizationsUrl: '',
    reposUrl: '',
    name: '',
    company: '',
    email: '',
    bio: '',
    publicRepos: 1,
    publicGists: 1,
    followers: 1,
    following: 1,
  );

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  getUserProfile() async {
    User user = await APIService().getUser(widget.nameLogin);
    setState(() {
      _user = user;
      login = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return login == false
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
            color: const Color.fromARGB(240, 246, 246, 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black.withOpacity(0.08),
                      foregroundColor: Colors.black,
                      child: const Icon(Icons.settings),
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black.withOpacity(0.08),
                      foregroundColor: Colors.black,
                      child: const Icon(Icons.notifications),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(_user.avatarUrl),
                    ),
                    Text(
                      _user.login,
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      _user.id.toString(),
                      style:
                          const TextStyle(color: Colors.black38, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const ProfileButton(
                  colorIcon: Colors.red,
                  iconPrefix: Icons.favorite,
                  nameButton: "My following",
                ),
                const ProfileButton(
                  colorIcon: Colors.red,
                  iconPrefix: Icons.favorite,
                  nameButton: "My followers",
                ),
                const ProfileButton(
                  colorIcon: Colors.yellow,
                  iconPrefix: Icons.star,
                  nameButton: "My badges",
                ),
                const ProfileButton(
                  colorIcon: Colors.green,
                  iconPrefix: Icons.money_rounded,
                  nameButton: "My organizations",
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      // textStyle: const TextStyle(
                      //     fontSize: 18, fontWeight: FontWeight.w500),
                      minimumSize: const Size(double.infinity, 60)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'View all ',
                      ),
                      Icon(Icons.arrow_right_alt_outlined)
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
