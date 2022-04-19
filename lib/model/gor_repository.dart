import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';
import 'package:badmintop/model/gor.dart';

class GorRepository {
  List<Gor> parseNews(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Gor>((json) => Gor.fromJson(json)).toList();
  }

  Future<List<Gor>> fetchNewsList() async {
      final String response = await rootBundle.loadString('assets/json/gor.json');
      return compute(parseNews, response);
  }

  saveNewsList(Gor gor) {
    final gorJson = json.encode(gor.toJson());
    final File file = File('assets/json/gor.json'); 
    file.writeAsStringSync(gorJson);

  }
}