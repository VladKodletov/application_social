import 'dart:convert';
import 'package:application_social/core/service/models/followers_model.dart';
import 'package:application_social/core/service/models/following_model.dart';
import 'package:application_social/core/service/models/repositories_model.dart';
import 'package:application_social/core/service/models/user_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<User> getUser(String nameLogin) async {
    Uri uri = Uri.parse('https://api.github.com/users/$nameLogin');
    final response = await http.get(uri);
    try {
      Map<String, dynamic> data = jsonDecode(response.body);
      User user = User.fromMap(data);

      return user;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<Following>> getFollowingUser(String nameLogin) async {
    Uri uri = Uri.parse('https://api.github.com/users/$nameLogin/following');
    final response = await http.get(uri);
    List<Following> following = [];

    try {
      List<dynamic> data = jsonDecode(
        response.body,
      );
      for (var element in data) {
        following.add(Following.fromMap(element));
      }

      return following;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<Repositories>> getRepositoriesUser(String nameLogin) async {
    Uri uri = Uri.parse('https://api.github.com/users/$nameLogin/repos');
    final response = await http.get(uri);
    List<Repositories> repositories = [];

    try {
      List<dynamic> data = jsonDecode(
        response.body,
      );
      for (var element in data) {
        repositories.add(Repositories.fromMap(element));
      }

      return repositories;
    } catch (error) {
      throw error.toString();
    }
  }

Future<List<Followers>> getFollowerUser(String nameLogin) async {
    Uri uri = Uri.parse('https://api.github.com/users/$nameLogin/followers');
    final response = await http.get(uri);
    List<Followers> followers = [];

    try {
      List<dynamic> data = jsonDecode(
        response.body,
      );
      for (var element in data) {
        followers.add(Followers.fromMap(element));
      }

      return followers;
    } catch (error) {
      throw error.toString();
    }
  }



}

