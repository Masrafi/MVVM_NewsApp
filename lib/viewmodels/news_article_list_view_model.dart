//View Model  4th

import 'package:flutter/material.dart';
import 'package:mvvm/model/news_articles.dart';
import 'package:mvvm/services/web_services.dart';
import 'news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  void topHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadLines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
