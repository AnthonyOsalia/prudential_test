import 'dart:convert';

List<Post> postFromMap(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

String postToMap(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Post {
  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
      };
}
