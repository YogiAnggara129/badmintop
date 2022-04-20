import 'package:badmintop/model/gor_repository.dart';
import 'package:badmintop/model/gor.dart';
import 'package:flutter/cupertino.dart';

class GorViewModel extends ChangeNotifier {
  List<Gor> _gorList = [];
  List<int> _gorSavedIdList = [];
  int _gorIdSelected = -1;
  setGorList(List<Gor> gorsList) => _gorList = gorsList;
  setGorSavedIdList(List<int> gorSavedIdList) => _gorSavedIdList = gorSavedIdList;
  List<Gor> get gorList => _gorList;

  void getGors() async {
    final gors = await GorRepository().fetchGorList();
    final List<int> savedIdList = [];
    setGorList(gors);
    for (var element in gors) {
      if(element.isSave! == true) {
        savedIdList.add(element.id!);
      }
    }
    setGorSavedIdList(savedIdList);
    notifyListeners();
  }

  void setGorIdSelected(id) {
    _gorIdSelected = id;
    notifyListeners();
  }

  List<int> get gorSavedIdList => _gorSavedIdList;

  Gor get gorSelected => _gorList.where((element) => element.id == _gorIdSelected).toList()[0];

  void pressedSaveGor(){
    gorSelected.isSave = !gorSelected.isSave!;
    gorSelected.isSave! ? _gorSavedIdList.insert(0, _gorIdSelected) : _gorSavedIdList.remove(_gorIdSelected);
    notifyListeners();
  }

  List<Gor> get gorSavedList {
    return _gorSavedIdList.map((e) => _gorList.where((element) => element.id == e).toList()[0]).toList();
  }

}