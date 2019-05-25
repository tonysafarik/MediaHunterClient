class Thumbnail {
  final String lowResolution;
  final String highResolution;

  Thumbnail({this.lowResolution, this.highResolution});

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      lowResolution: json['lowResolution'],
      highResolution: json['highResolution'],
    );
  }
}
