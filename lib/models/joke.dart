import 'dart:convert';

Joke diariesFromJson(String str) => Joke.fromJson(json.decode(str));

String diariesToJson(Joke data) => json.encode(data.toJson());

class Joke {
  DateTime? createdAt;
  String iconUrl;
  String id;
  DateTime? updatedAt;
  String url;
  String value;

  Joke({
    this.createdAt,
    this.iconUrl = "",
    this.id = "",
    this.updatedAt,
    this.url = "",
    this.value = "",
  });

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        createdAt: DateTime.parse(json["created_at"]),
        iconUrl: json["icon_url"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toString(),
        "icon_url": iconUrl,
        "id": id,
        "updated_at": updatedAt.toString(),
        "url": url,
        "value": value,
      };
}
