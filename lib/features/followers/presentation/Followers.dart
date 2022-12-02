// ignore_for_file: file_names

import 'package:application_social/core/const/const.dart';
import 'package:application_social/core/provider/login_provider.dart';
import 'package:flutter/material.dart';

import 'package:application_social/core/service/api_service/api_service.dart';
import 'package:application_social/core/service/models/followers_model.dart';
import 'package:provider/provider.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  TextEditingController myController = TextEditingController();
  bool login = false;
  List<Followers> _followers = [];

  @override
  void initState() {
    super.initState();

    getFollowers();
  }

  Future getFollowers() async {
    List<Followers> followers =
        await APIService().getFollowerUser(context.read<Login>().getLogin);
    setState(() {
      _followers = followers;
      login = true;
    });
  }

  Future refresh() async {
    List<Followers> followers =
        await APIService().getFollowerUser(context.read<Login>().getLogin);
    setState(() {
      _followers = followers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return login == false
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            // padding: const EdgeInsets.only(
            //   top: 60.0,
            // ),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: RefreshIndicator(
                      onRefresh: refresh,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(_followers[index].avatarUrl),
                                ),
                                title: Text(
                                  _followers[index].login,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                subtitle: Text(_followers[index].id.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ),
                              const Divider(thickness: 1.5),
                            ],
                          );
                        },
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Followers',
                    style: mainWord,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 12, right: 12),
                  child: TextField(
                    controller: myController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.filter_alt_outlined),
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      filled: true,
                      fillColor: Color.fromRGBO(240, 240, 240, 1),
                      hintText: 'Search...',
                      hintStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
