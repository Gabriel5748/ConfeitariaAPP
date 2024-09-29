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

class SweetInfo extends ChangeNotifier {
  late String _sweetName;
  late String _sweetPrice;
  late String _sweetDesc;
  
  void setName(int index, String name) {
    _sweetName = name;
    notifyListeners();
  }

  void setPrice(int index,String price){
    _sweetPrice = price;
    notifyListeners();
  }

  void setDesc(int index,String desc){
    _sweetDesc = desc;
    notifyListeners();
  }


  String? get sweetName => _sweetName;
  String? get sweetPrice => _sweetPrice;
  String? get sweetDesc => _sweetDesc;
}
