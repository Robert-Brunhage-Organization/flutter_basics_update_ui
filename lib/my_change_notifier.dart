import 'package:flutter/cupertino.dart';

class MyChangeNotifier extends ChangeNotifier {
  String _name = 'Robert';
  String get name => _name;

  set name(String newName) {
    _name = newName;
    notifyListeners();
  }
}
