import 'dart:convert';
import 'package:sample_flutter_app/Configuration.dart';
import 'package:sample_flutter_app/data_objects/Multimedium.dart';
import 'package:http/http.dart' as http;

class MediaHunterApi {
  static Future<List<Multimedium>> getPageOfMultimedia(int page) async {
    http.Response response =
        await http.get(Uri.encodeFull(Configuration.BACKEND_URL + "/api/records/" + page.toString()));
    List<dynamic> array = json.decode(response.body);
    List<Multimedium> posts = new List();
    for (int i = 0; i < array.length; i++) {
      Map<String, dynamic> post = array[i];
      posts.add(Multimedium.fromJson(post));
    }
    return posts;
  }
}
