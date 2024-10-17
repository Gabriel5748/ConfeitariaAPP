import 'sweet_class.dart';

class MeuCarrinho {
  final String preco;
  final int quantidade;
  final List<Doces> _compras = [];

  MeuCarrinho({required this.preco, required this.quantidade});

  List<Doces> get compras => _compras;
}
