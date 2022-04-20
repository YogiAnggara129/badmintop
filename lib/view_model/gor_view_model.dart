import 'package:badmintop/model/gor_repository.dart';
import 'package:badmintop/model/gor.dart';
import 'package:flutter/cupertino.dart';

class GorViewModel extends ChangeNotifier {
  List<Gor> _gorList = [];
  int _gorIdSelected = -1;
  List<int> _gorSavedId = [];
  setGorList(List<Gor> gorsList) => _gorList = gorsList;
  List<Gor> get gorList => _gorList;

  void getGors() async {
    final data = await GorRepository().fetchGorList();
    setGorList(data);
    _gorList.forEach((element) {
        if(element.isSave!) {
          _gorSavedId.insert(0, element.id!);
        }
    });
    notifyListeners();
  }

  void setGorIdSelected(id) {
    _gorIdSelected = id;
    notifyListeners();
  }

  List<int> get gorSavedId => _gorSavedId;

  Gor get gorSelected => _gorList.where((element) => element.id == _gorIdSelected).toList()[0];

  void pressedSaveGor(){
    _gorList[_gorIdSelected].isSave = !_gorList[_gorIdSelected].isSave!;
    _gorList[_gorIdSelected].isSave! ? _gorSavedId.insert(0, _gorIdSelected) : _gorSavedId.remove(_gorIdSelected);
    notifyListeners();
  }

  List<Gor> get gorSavedList {
    return _gorSavedId.map((e) => _gorList.where((element) => element.id == e).toList()[0]).toList();
  }
}