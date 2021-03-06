//view 5th or last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/viewmodels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(), body: Text(listViewModel.articles.length.toString()));
    /*GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: listViewModel.articles.length,
                itemBuilder: (context, index) {
                  return Text(
                    listViewModel.articles[index].title,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  );
                }));*/
  }
}
