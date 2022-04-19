import 'package:badmintop/model/gor_repository.dart';
import 'package:badmintop/model/gor.dart';
import 'package:flutter/cupertino.dart';

class GorViewModel with ChangeNotifier {
  List<Gor> _gorList = [];
  bool _loading = false;
  setGorList(List<Gor> gorsList) => _gorList = gorsList;
  List<Gor> get gorList => _gorList;

  GorViewModel() {
    getGors();
  }  

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }  

  void getGors() async {
    setLoading(true);
    final data = await GorRepository().fetchNewsList();
    setGorList(data);
    setLoading(false);
  }
}