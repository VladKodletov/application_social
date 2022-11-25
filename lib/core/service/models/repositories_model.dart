// To parse this JSON data, do
//
//     final following = followingFromMap(jsonString);

import 'dart:convert';

class Repositories {
  Repositories({
    required this.id,
    required this.name,
    required this.forks,
    required this.stargazersCount,
  });

  final int id;
  final String name;
  final int forks;
  final int stargazersCount;

  factory Repositories.fromJson(String str) =>
      Repositories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Repositories.fromMap(Map<dynamic, dynamic> json) => Repositories(
        id: json["id"] ?? 1,
        name: json["name"] ?? 'No name',
        forks: json["forks"] ?? 0,
        stargazersCount: json["stargazersCount"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "forks": forks,
        "stargazersCount": stargazersCount,
      };
}
