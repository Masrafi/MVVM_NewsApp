import 'package:flutter/material.dart';
import 'package:mvvm/viewmodels/news_article_list_view_model.dart';
import 'package:mvvm/viewmodels/news_article_view_model.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Text(listViewModel.articles.length.toString()),
    );
  }
}
