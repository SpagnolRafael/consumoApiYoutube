import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/video.dart';
import 'package:youtube/model/video.dart';

class Api {
  static const chaveUtub = "AIzaSyDnWYtoi6CzfMYww4buGmH9xI0AeP5txSU";
  static const urlBase = "https://www.googleapis.com/youtube/v3/";
  static const urlChanel = "UCVHFbqXqoYvEWM1Ddxl0QDg";

  Future<List<Video>> searchMethod(String pesquisa) async {
    http.Response response = await http.get(
      Uri.parse(
        urlBase +
            "search"
                "?part=snippet"
                "&type=video"
                "&maxResults=20"
                "&order=date"
                "&key=$chaveUtub"
                //"&channelId=$urlChanel" //SE EU QUISER INF DE 1 CANAL ESPECIFICO, BASTA COLOCAR A ID DO CANAL
                "&q=$pesquisa",
      ),
    );

    Map<String, dynamic> dadosJSON = json.decode(response.body);
    List<Video> videosUtub = dadosJSON["items"].map<Video>((map) {
      return Video.fromJson(map);
    }).toList();

    return videosUtub;
  }
}
