import 'package:sample_flutter_app/data_objects/Thumbnail.dart';

class Multimedium {
  final String id;
  final String externalId;
  final String uploaderExternalId;
  final String name;
  final String mcpName;
  final String uri;

  final Thumbnail thumbnail;
  final DateTime uploadTime;
  final String description;

  Multimedium(
      {this.id,
        this.externalId,
        this.uploaderExternalId,
        this.name,
        this.mcpName,
        this.uri,
        this.thumbnail,
        this.uploadTime,
        this.description});

  factory Multimedium.fromJson(Map<String, dynamic> json) {
    return Multimedium(
      id: json['id'],
      externalId: json['externalId'],
      uploaderExternalId: json['uploaderExternalId'],
      name: json['name'],
      mcpName: json['mcpName'],
      uri: json['uri'],
      thumbnail: json['thumbnail'] == null? new Thumbnail() : Thumbnail.fromJson(json['thumbnail']),
      uploadTime: DateTime.parse(json['uploadTime']),
      description: json['description'],
    );
  }
}