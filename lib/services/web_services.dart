//Service  3rd

import 'package:dio/dio.dart';
import 'package:mvvm/model/news_articles.dart';

class WebService {
  var dio = Dio();

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=0ac07833cbf04985aaec552f3e013773";
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
