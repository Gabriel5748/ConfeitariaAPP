import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  late String username = '';

  void setName(String nome) {
    username = nome;
    notifyListeners();
  }

  String getName() {
    return username;
  }
}
