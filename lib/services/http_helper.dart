import 'package:dharma_bakti_app/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class HttpHelper {
  final String fullUrl =
      'https://newsdata.io/api/1/news?apikey=pub_59126ffce58070e761643ea6303a09d208517&q=SCHOOL&language=id';

  Future<List?> getNews() async {
    var url = Uri.parse(fullUrl);
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      print(result.body);
      final newsMap = jsonResponse['results'];
      List news = newsMap.map((i) => News.fromJson(i)).toList();
      return news;
    } else {
      return null;
    }
  }
}
