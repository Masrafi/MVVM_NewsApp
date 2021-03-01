import 'package:dio/dio.dart';
import 'package:mvvm/model/news_articles.dart';

class WebService {
  var dio = Dio();

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    String url =
        "http://newsapi.org/v2/everything?q=tesla&from=2021-02-01&sortBy=publishedAt&apiKey=API_KEY";
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
