import 'dart:convert';

// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);


class User {
  User({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.name,
    required this.company,
    required this.email,
    required this.bio,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
  });

  final String login;
  final int id;

  final String avatarUrl;

  final String followersUrl;
  final String followingUrl;

  final String organizationsUrl;
  final String reposUrl;

  final String name;
  final String company;

  final dynamic email;

  final String bio;

  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) => User(
        login: json["login"],
        id: json["id"],
        avatarUrl: json["avatar_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        name: json["name"],
        company: json["company"],
        email: json["email"] ?? 'Send me SMS!',
        bio: json["bio"],
        publicRepos: json["public_repos"],
        publicGists: json["public_gists"],
        followers: json["followers"],
        following: json["following"],
      );
}
