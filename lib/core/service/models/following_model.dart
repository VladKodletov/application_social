// To parse this JSON data, do
//
//     final following = followingFromMap(jsonString);

import 'dart:convert';

class Following {
  Following({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
  });

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;

  factory Following.fromJson(String str) => Following.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Following.fromMap(Map<dynamic, dynamic> json) => Following(
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
