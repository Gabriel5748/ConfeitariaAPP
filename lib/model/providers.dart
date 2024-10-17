import 'package:app_restaurante/model/sweet_class.dart';
import 'package:flutter/cupertino.dart';

import 'carrinho.dart';

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
  late String _sweetPrice;
  late String _sweetQuantidade;
  late String _sweetDesc;
  late String _sweetImage;
  late double _sweetRating;
  final List<Doces> _compras = [];
  final List<Doces> _favs = [];

  void setName(int index, String name) {
    _sweetName = name;
    notifyListeners();
  }

  void setPrice(int index, String price) {
    _sweetPrice = price;
    notifyListeners();
  }
  void setQuantidade(int index, String quantidade){
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

  void addCart(Doces item) {
    _compras.add(item);
    notifyListeners();
  }

  void removeCart(int index) {
    _compras.removeAt(index);
    notifyListeners();
  }

  void addFav(Doces item) {
    _favs.add(item);
    notifyListeners();
  }

  void removeFav(int index) {
    _favs.removeAt(index);
    notifyListeners();
  }

  String? get sweetName => _sweetName;
  String? get sweetPrice => _sweetPrice;
  String? get sweetQuantidade => _sweetQuantidade;
  String? get sweetDesc => _sweetDesc;
  String? get sweetImage => _sweetImage;
  double? get sweetRating => _sweetRating;
  List<Doces> get compras => _compras;
  List<Doces>? get favs => _favs;
}

class CarrinhoProvider with ChangeNotifier {
  final List<MeuCarrinho> _compras = [];

  List<MeuCarrinho> get compras => _compras;

  void adicionarCompra(MeuCarrinho compra) {
    _compras.add(compra);
    notifyListeners();
  }

  void removerCompra(MeuCarrinho compra) {
    _compras.remove(compra);
    notifyListeners();
  }

  double calcularPrecoTotal() {
    return _compras.fold(0.0, (total, compra) => total + (double.parse(compra.preco) * compra.quantidade));
  }
}

