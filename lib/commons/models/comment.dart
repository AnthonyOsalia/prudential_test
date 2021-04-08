// To parse this JSON data, do
//
//     final comment = commentFromMap(jsonString);

import 'dart:convert';

List<Comment> commentFromMap(String str) =>
    List<Comment>.from(json.decode(str).map((x) => Comment.fromMap(x)));

String commentToMap(List<Comment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Comment {
  Comment({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
        postId: json["postId"] == null ? null : json["postId"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        body: json["body"] == null ? null : json["body"],
      );

  Map<String, dynamic> toMap() => {
        "postId": postId == null ? null : postId,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "body": body == null ? null : body,
      };
}
