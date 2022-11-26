// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:application_social/core/service/api_service/api_service.dart';
import 'package:application_social/core/service/models/following_model.dart';
import 'package:application_social/core/service/models/repositories_model.dart';
import 'package:application_social/core/service/models/user_model.dart';
import 'package:application_social/features/home/presentation/screens/widgets/category_name.dart';

const TextStyle mainWord = TextStyle(fontSize: 30, fontWeight: FontWeight.w700);
const TextStyle greyWord = TextStyle(color: Colors.black38, fontSize: 12);
const Color colorWordGrey = Colors.black38;

// ignore: must_be_immutable
class HomeWidget extends StatefulWidget {
  String nameLogin;
  HomeWidget({
    Key? key,
    required this.nameLogin,
  }) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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

  List<Following> _following = [];
  List<Repositories> _repositories = [];

  @override
  void initState() {
    super.initState();
    getUser();
    getFollowing();
    getRepositories();
  }

  getUser() async {
    User user = await APIService().getUser(widget.nameLogin);
    setState(() {
      _user = user;
    });
  }

  getFollowing() async {
    List<Following> following =
        await APIService().getFollowingUser(widget.nameLogin);
    setState(() {
      _following = following;
    });
  }

  getRepositories() async {
    List<Repositories> repositories =
        await APIService().getRepositoriesUser(widget.nameLogin);
    setState(() {
      _repositories = repositories;
      login = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return login == false
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_user.login, style: mainWord),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        '+  ' '  Follow on github',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )
                  ],
                ),
                Text(
                  'Company - ${_user.company}',
                  style: const TextStyle(color: colorWordGrey, fontSize: 16),
                ),
                Text(
                  'Email - ${_user.email}',
                  style: const TextStyle(color: colorWordGrey, fontSize: 16),
                ),
                Text(
                  'Bio - ${_user.bio}',
                  style: const TextStyle(color: colorWordGrey, fontSize: 16),
                  maxLines: 1,
                ),
                const Divider(thickness: 2),
                const CategoryName(category: 'Following you'),
                SizedBox(
                  // width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _following.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  NetworkImage(_following[index].avatarUrl),
                            ),
                            Text(_following[index].login),
                            Text(
                              _following[index].id.toString(),
                              style: greyWord,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(thickness: 2),
                const CategoryName(category: 'Repositories'),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _repositories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/451.jpg',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  _repositories[index].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  _repositories[index].id.toString(),
                                  style: greyWord,
                                ),
                              ],
                            ),
                            Column()
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
