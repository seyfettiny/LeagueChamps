import 'package:flutter/material.dart';

class SearchNotifier extends ChangeNotifier {
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
}
