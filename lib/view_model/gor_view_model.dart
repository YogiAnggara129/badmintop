import 'package:badmintop/model/gor_repository.dart';
import 'package:badmintop/model/gor.dart';
import 'package:badmintop/view_model/booked_view_model.dart';
import 'package:flutter/cupertino.dart';

class GorViewModel extends ChangeNotifier {
  List<Gor> _gorList = [];
  List<int> _gorSavedIdList = [];
  bool _isThereGorSaved = false;
  int _gorIdSelected = -1;
  setGorList(List<Gor> gorsList) => _gorList = gorsList;
  setGorSavedIdList(List<int> gorSavedIdList) => _gorSavedIdList = gorSavedIdList;
  setIsThereGorSaved(bool isThereGorSaved) => _isThereGorSaved = isThereGorSaved;
  List<Gor> get gorList => _gorList;
  bool get isThereGorSaved => _isThereGorSaved;

  void getGors() async {
    final gors = await GorRepository().fetchGorList();
    setGorList(gors);
    notifyListeners();

    final savedIdList = collectGorSavedIdFromJson();
    setGorSavedIdList(savedIdList);
    notifyListeners();

    setIsThereGorSaved(savedIdList != []);
    notifyListeners();
  }

  void setGorIdSelected(id) {
    _gorIdSelected = id;
    notifyListeners();
  }

  List<int> get gorSavedIdList => _gorSavedIdList;

  Gor get gorSelected => _gorList.where((gor) => gor.id == _gorIdSelected).toList()[0];

  void pressedSaveGor(){
    gorSelected.isSave = !gorSelected.isSave!;
    gorSelected.isSave! ? _gorSavedIdList.insert(0, _gorIdSelected) : _gorSavedIdList.remove(_gorIdSelected);
    _isThereGorSaved = _gorSavedIdList != [];
    notifyListeners();
  }

  List<Gor> get gorSavedList => _gorSavedIdList.map((idSaved) => _gorList.where((gor) => gor.id == idSaved).toList()[0]).toList();

  Gor getGorBookedNewest() => _gorList.where((gor) => gor.id == BookedViewModel().getBookedNewest().gorId).toList()[0];

  List<int> collectGorSavedIdFromJson() => _gorList.where((gor) => gor.isSave!).map((gor) => gor.id!).toList();
  
}