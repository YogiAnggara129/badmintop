import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:badmintop/model/news.dart';

class NewsRepository {
  List<News> parseNews(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<News>((json) => News.fromJson(json)).toList();
  }

  Future<List<News>> fetchNewsList() async {
      final String response = await rootBundle.loadString('assets/json/news.json');
      return compute(parseNews, response);
  }
}