import 'package:app_restaurante/model/classes/carrinho_class.dart';
import 'package:app_restaurante/model/classes/favorito_class.dart';
import 'package:app_restaurante/model/classes/sweet_class.dart';
import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String _username = 'Gabriel';
  String _email = 'gabriel@gmail.com';
  String _password = '12345@';

  void setName(String nome) {
    _username = nome;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassWord(String password) {
    _password = password;
    notifyListeners();
  }

  String get username => _username;
  String get email => _email;
  String get password => _password;
}

class SweetInfo extends ChangeNotifier {
  late String _sweetName;
  late double _sweetPrice;
  late int _sweetQuantidade;
  late String _sweetDesc;
  late String _sweetImage;
  late double _sweetRating;

  void setName(int index, String name) {
    _sweetName = name;
    notifyListeners();
  }

  void setPrice(int index, double price) {
    _sweetPrice = price;
    notifyListeners();
  }

  void setQuantidade(int index, int quantidade) {
    _sweetQuantidade = quantidade;
    notifyListeners();
  }

  void setDesc(int index, String desc) {
    _sweetDesc = desc;
    notifyListeners();
  }

  void setImage(int index, String image) {
    _sweetImage = image;
    notifyListeners();
  }

  void setRating(int index, double rating) {
    _sweetRating = rating;
    notifyListeners();
  }

  String get sweetName => _sweetName;
  double get sweetPrice => _sweetPrice;
  int get sweetQuantidade => _sweetQuantidade;
  String? get sweetDesc => _sweetDesc;
  String get sweetImage => _sweetImage;
  double? get sweetRating => _sweetRating;
}

class CarrinhoProvider with ChangeNotifier {
  final List<MeuCarrinho> _compras = [];

  void addCart(MeuCarrinho item) {
    _compras.add(item);
    notifyListeners();
  }

  void removeCart(int index) {
    _compras.removeAt(index);
    notifyListeners();
  }

  List<MeuCarrinho> get compras => _compras;
}

class FavoritoProvider with ChangeNotifier {
  final List<MeusFavoritos> _favs = [];

  void addFav(MeusFavoritos item) {
    _favs.add(item);
    notifyListeners();
  }

  void removeFav(int index) {
    _favs.removeAt(index);
    notifyListeners();
  }

  List<MeusFavoritos> get favs => _favs;
}
