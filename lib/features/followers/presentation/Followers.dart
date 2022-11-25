import 'package:application_social/core/service/api_service/api_service.dart';
import 'package:application_social/core/service/models/followers_model.dart';
import 'package:application_social/features/home/presentation/screens/widgets/home_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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

  getFollowers() async {
    List<Followers> followers = await APIService().getFollowerUser(nameLogin);
    setState(() {
      _followers = followers;
      login = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return login == false
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
            ),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(thickness: 2),
                            ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(_followers[index].avatarUrl),
                              ),
                              title: Text(_followers[index].login),
                              subtitle: Text(_followers[index].id.toString()),
                            ),
                          ],
                        );
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: const Text('Followers'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26, left: 12, right: 12),
                  child: TextField(
                    controller: myController,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(15),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      filled: true,
                      fillColor: Color.fromRGBO(240, 240, 240, 1),
                      // labelText: 'Nickname',
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
