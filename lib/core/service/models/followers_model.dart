// To parse this JSON data, do
//
//     final following = followingFromMap(jsonString);

import 'dart:convert';

class Followers {
  Followers({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
  });

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;

  factory Followers.fromJson(String str) => Followers.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Followers.fromMap(Map<dynamic, dynamic> json) => Followers(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toMap() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
      };
}
