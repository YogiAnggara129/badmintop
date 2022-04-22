import 'package:badmintop/model/news_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:badmintop/model/news.dart';

class NewsViewModel with ChangeNotifier {
  List<News> _newsList = [];
  setNewsList(List<News> newsList) => _newsList = newsList;
  List<News> get newsList => _newsList;

  Future<void> getNews() async {
    final data = await NewsRepository().fetchNewsList();
    setNewsList(data);
    notifyListeners();
  }

}