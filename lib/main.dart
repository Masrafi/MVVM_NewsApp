import 'package:flutter/material.dart';
import 'package:mvvm/screens/news_screen.dart';
import 'package:mvvm/viewmodels/news_article_list_view_model.dart';
import 'package:mvvm/viewmodels/news_article_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NewsArticleListViewModel(),
          )
        ],
        child: NewsScreen(),
      ),
    );
  }
}
