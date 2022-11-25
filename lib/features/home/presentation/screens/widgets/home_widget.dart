import 'package:application_social/core/service/api_service/api_service.dart';
import 'package:application_social/core/service/models/following_model.dart';
import 'package:application_social/core/service/models/repositories_model.dart';
import 'package:application_social/core/service/models/user_model.dart';
import 'package:application_social/features/home/presentation/screens/widgets/category_name.dart';
import 'package:flutter/material.dart';

String nameLogin = 'GantMan';
const TextStyle mainWord =
    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700);
const TextStyle greyWord = const TextStyle(color: Colors.black38, fontSize: 12);
const Color colorWordGrey = Colors.black38;

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

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
    User user = await APIService().getUser(nameLogin);
    setState(() {
      _user = user;
    });
  }

  getFollowing() async {
    List<Following> following = await APIService().getFollowingUser(nameLogin);
    setState(() {
      _following = following;
    });
  }

  getRepositories() async {
    List<Repositories> repositories =
        await APIService().getRepositoriesUser(nameLogin);
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
                  style: TextStyle(color: colorWordGrey, fontSize: 16),
                ),
                Text(
                  'Email - ${_user.email}',
                  style: TextStyle(color: colorWordGrey, fontSize: 16),
                ),
                Text(
                  'Bio - ${_user.bio}',
                  style: TextStyle(color: colorWordGrey, fontSize: 16),
                  maxLines: 1,
                ),
                const Divider(thickness: 2),
                const CategoryName(category: 'Following you'),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _following.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
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
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.amber,
                            ),
                            Text(
                              _repositories[index].name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              _repositories[index].id.toString(),
                              style: greyWord,
                            ),
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