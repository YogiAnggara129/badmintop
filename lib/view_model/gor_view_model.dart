import 'package:badmintop/model/gor_repository.dart';
import 'package:badmintop/model/gor.dart';
import 'package:badmintop/view_model/booked_view_model.dart';
import 'package:flutter/cupertino.dart';

class GorViewModel extends ChangeNotifier {
  List<Gor> _gorList = [];
  List<int> _gorSavedIdList = [];
  bool _isThereGorSaved = false;
  int _gorIdSelected = -1;
  String _gorSearched = '';
  String get gorSearched => _gorSearched;

  GorViewModel() {
    getGors();
  } 

  void setGorList(List<Gor> gorsList) {
    _gorList = gorsList;
    // notifyListeners();
  }
  void setGorSavedIdList(List<int> gorSavedIdList) {
    _gorSavedIdList = gorSavedIdList;
  }
  void setIsThereGorSaved(bool isThereGorSaved) {
    _isThereGorSaved = isThereGorSaved;
    notifyListeners();
  }
  setGorSearched(String gorSearched) {
    _gorSearched = gorSearched;
    notifyListeners();
  }
  List<Gor> get gorList => _gorList;
  bool get isThereGorSaved => _isThereGorSaved;

  Future<void> getGors() async {
    final gors = await GorRepository().fetchGorList();
    setGorList(gors);

    final savedIdList = collectGorSavedIdFromJson();
    setGorSavedIdList(savedIdList);

    setIsThereGorSaved(savedIdList.isNotEmpty);
  }

  void setGorIdSelected(id) {
    _gorIdSelected = id;
    notifyListeners();
  }

  List<int> get gorSavedIdList => _gorSavedIdList;

  Gor get gorSelected => _gorList.where((gor) => gor.id == _gorIdSelected).toList().first;

  void pressedSaveGor(){
    gorSelected.isSave = !gorSelected.isSave!;
    gorSelected.isSave! ? _gorSavedIdList.insert(0, _gorIdSelected) : _gorSavedIdList.remove(_gorIdSelected);
    notifyListeners();
    _isThereGorSaved = _gorSavedIdList.isNotEmpty;
    notifyListeners();
  }

  List<Gor> get gorSavedList => _gorSavedIdList.map((idSaved) => _gorList.where((gor) => gor.id == idSaved).toList().first).toList();

  Gor getGorBookedNewest() => _gorList.where((gor) => gor.id == BookedViewModel().getBookedNewest().gorId).toList().first;

  List<int> collectGorSavedIdFromJson() => _gorList.where((gor) => gor.isSave!).map((gor) => gor.id!).toList();

  List<Gor> getSearchGor() {
    final List<Gor> gorSearchedList = [];
    for (var _gor in _gorList) {
      if(_gor.name!.toLowerCase().contains(_gorSearched.toLowerCase())) {
        gorSearchedList.add(_gor);
      }
    }

    return gorSearchedList;
  }
}