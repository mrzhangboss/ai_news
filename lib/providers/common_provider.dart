import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {

  String _currentSearch = '';

  String get currentSearch => _currentSearch;

  set currentSearch(String search) {
    _currentSearch = search;
    notifyListeners();
  }


}