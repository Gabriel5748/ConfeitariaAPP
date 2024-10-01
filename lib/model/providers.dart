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
  late String _sweetImage;
  late double _sweetRating;
  
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

  
  void setImage(int index,String image){
    _sweetImage = image;
    notifyListeners();
  }

   void setRating(int index,double rating){
    _sweetRating = rating;
    notifyListeners();
  }


  String? get sweetName => _sweetName;
  String? get sweetPrice => _sweetPrice;
  String? get sweetDesc => _sweetDesc;
  String? get sweetImage => _sweetImage;
  double? get sweetRating => _sweetRating;
}
