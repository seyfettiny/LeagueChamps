import 'package:flutter/material.dart';

import '../../domain/entities/champion.dart';

class SearchNotifier extends ChangeNotifier {
  List<Champion> _champions = [];
  List<Champion> get champions => _champions;

  final List<String> _filters = [];
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
