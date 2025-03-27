import 'package:app_restaurante/model/classes/carrinho_class.dart';
import 'package:app_restaurante/model/classes/favorito_class.dart';
import 'package:app_restaurante/model/classes/sweet_class.dart';
import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String _username = '';
  String _email = '';
  String _password = '';

  // Lista para armazenar usuários cadastrados
  static final List<Map<String, String>> _usuariosCadastrados = [];

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

  // Método para cadastrar um novo usuário
  void cadastrarUsuario() {
    if (_username.isNotEmpty && _email.isNotEmpty && _password.isNotEmpty) {
      _usuariosCadastrados.add({
        'username': _username,
        'email': _email,
        'password': _password,
      });
      notifyListeners();
    }
  }

  // Método para verificar credenciais
  bool verificarCredenciais(String email, String senha) {
    final usuario = _usuariosCadastrados.firstWhere(
      (user) => user['email'] == email && user['password'] == senha,
      orElse: () => {},
    );

    if (usuario.isNotEmpty) {
      _username = usuario['username'] ?? '';
      _email = usuario['email'] ?? '';
      _password = usuario['password'] ?? '';
      return true;
    }
    return false;
  }

  String get username => _username;
  String get email => _email;
  String get password => _password;
}

class SweetInfo extends ChangeNotifier {
  String _nome = '';
  double _preco = 0.0;
  int _quantidade = 1;
  String _desc = '';
  String _image = '';
  double _rating = 0.0;

  String get nome => _nome;
  double get preco => _preco;
  int get quantidade => _quantidade;
  String get desc => _desc;
  String get image => _image;
  double get rating => _rating;

  void updateDoce({
    required String nome,
    required double preco,
    required int quantidade,
    required String desc,
    required String image,
    required double rating,
  }) {
    _nome = nome;
    _preco = preco;
    _quantidade = quantidade;
    _desc = desc;
    _image = image;
    _rating = rating;
    notifyListeners();
  }

  void incrementQuantidade() {
    _quantidade++;
    notifyListeners();
  }

  void decrementQuantidade() {
    if (_quantidade > 1) {
      _quantidade--;
      notifyListeners();
    }
  }
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
    bool itemJaExiste = _favs.any((fav) => fav.nome == item.nome);
    
    if (!itemJaExiste) {
      _favs.add(item);
      notifyListeners();
    }
  }

  void removeFav(int index) {
    _favs.removeAt(index);
    notifyListeners();
  }

  List<MeusFavoritos> get favs => _favs;
}

class HomeProvider extends ChangeNotifier {
  List<Sweet> _doces = [];
  List<Sweet> get doces => _doces;
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  HomeProvider() {
    _carregarDoces();
  }

  void _carregarDoces() {
    Doces.getDados();
    _doces = Doces(
      image: '',
      nome: '',
      desc: '',
      preco: 0,
      quantidade: 0,
      categoria: '',
      rating: 0,
    ).docesList;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<Sweet> get filteredDoces {
    if (_searchQuery.isEmpty) {
      return _doces;
    }
    return _doces.where((doce) =>
        doce.nome?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false).toList();
  }
}

class FavoritesProvider extends ChangeNotifier {
  final List<Sweet> _favorites = [];

  List<Sweet> get favorites => _favorites;

  bool isFavorite(String nome) {
    return _favorites.any((sweet) => sweet.nome == nome);
  }

  void toggleFavorite({
    required String nome,
    required double preco,
    required int quantidade,
    required String desc,
    required String image,
    required double rating,
  }) {
    final index = _favorites.indexWhere((sweet) => sweet.nome == nome);
    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(
        Doces(
          nome: nome,
          preco: preco,
          quantidade: quantidade,
          desc: desc,
          image: image,
          rating: rating,
          categoria: '',
        ),
      );
    }
    notifyListeners();
  }
}

class CartProvider extends ChangeNotifier {
  final List<Sweet> _cartItems = [];

  List<Sweet> get cartItems => _cartItems;

  void addToCart({
    required String nome,
    required double preco,
    required int quantidade,
    required String desc,
    required String image,
    required double rating,
  }) {
    // Verifica se o item já existe no carrinho
    final index = _cartItems.indexWhere((item) => item.nome == nome);
    if (index >= 0) {
      // Se existir, atualiza a quantidade
      _cartItems[index] = Doces(
        nome: nome,
        preco: preco,
        quantidade: _cartItems[index].quantidade + quantidade,
        desc: desc,
        image: image,
        rating: rating,
        categoria: '',
      );
    } else {
      // Se não existir, adiciona novo item
      _cartItems.add(
        Doces(
          nome: nome,
          preco: preco,
          quantidade: quantidade,
          desc: desc,
          image: image,
          rating: rating,
          categoria: '',
        ),
      );
    }
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _cartItems.length && newQuantity > 0) {
      final item = _cartItems[index];
      _cartItems[index] = Doces(
        nome: item.nome ?? '',
        preco: item.preco,
        quantidade: newQuantity,
        desc: item.desc ?? '',
        image: item.image,
        rating: item.rating ?? 0.0,
        categoria: '',
      );
      notifyListeners();
    }
  }

  double get total => _cartItems.fold(
        0,
        (sum, item) => sum + (item.preco * item.quantidade),
      );
}
