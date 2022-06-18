import 'package:authors_app/utils/constants/api.dart';

class Message {
  Message({
    required this.count,
    required this.pageToken,
    required this.messages,
  });

  int count;
  String pageToken;
  List<MessageElement> messages;

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        count: data["count"],
        pageToken: data["pageToken"],
        messages: List<MessageElement>.from(
            data["messages"].map((x) => MessageElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "pageToken": pageToken,
        "messages": List<dynamic>.from(messages.map((x) => x.toMap())),
      };
}

class MessageElement {
  MessageElement(
      {required this.content,
      required this.updated,
      required this.id,
      required this.author,
      required this.isFavourite});

  String content;
  DateTime updated;
  int id;
  Author author;
  bool isFavourite;

  factory MessageElement.fromMap(Map<String, dynamic> data) => MessageElement(
        content: data["content"],
        updated: DateTime.parse(data["updated"]),
        id: data["id"],
        author: Author.fromMap(data["author"]),
        isFavourite: false,
      );

  Map<String, dynamic> toMap() => {
        "content": content,
        "updated": updated.toIso8601String(),
        "id": id,
        "author": author.toMap(),
      };
}

class Author {
  Author({
    required this.name,
    required this.photoUrl,
  });

  String name;
  String photoUrl;

  factory Author.fromMap(Map<String, dynamic> data) => Author(
        name: data["name"],
        photoUrl: Api.host + data["photoUrl"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoUrl": photoUrl,
      };
}
