class Channel {
  final String id;
  final String name;
  final String mcpName;
  final String uri;

  Channel({this.id, this.name, this.mcpName, this.uri});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      name: json['name'],
      mcpName: json['mcpName'],
      uri: json['uri'],
    );
  }
}
