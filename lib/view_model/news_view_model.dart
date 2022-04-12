import 'package:badmintop/model/news_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:badmintop/model/news.dart';

class NewsViewModel with ChangeNotifier {
  News? _news;

  News? get news {
    return _news;
  }

  Future<void> FetchNewsData() async {
    try {
      List<News> newsList = await NewsRepository().fetchNewsList();
    } catch(e) {
      print(e);
    }
    notifyListeners();
  }

  // List<News> getNewsList() {

  // }

  void setSelectedNews(News? news) {
    _news = news;
    notifyListeners();
  }
}