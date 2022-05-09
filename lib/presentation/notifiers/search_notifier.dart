import 'package:flutter/material.dart';

import '../../domain/entities/champion.dart';

class SearchNotifier extends ChangeNotifier {
  final List<Champion> _champions = [];
  final List<String> _filters = [];
  SearchNotifier();
  List<Champion> get champions => _champions;
  get filters => _filters;
  void addFilter(String filter) {
    _filters.add(filter);
    notifyListeners();
  }

  void removeFilterWhere(bool Function(String) predicate) {
    _filters.removeWhere(predicate);
    notifyListeners();
  }

  void addChampions(List<Champion> champions) {
    _champions.clear();
    _champions.addAll(champions);
    notifyListeners();
  }
}
