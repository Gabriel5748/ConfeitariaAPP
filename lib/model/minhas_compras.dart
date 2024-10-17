import 'sweet_class.dart';

class MinhasCompras {
  final String preco;
  final int quantidade;
  final List<Doces> _compras = [];

  MinhasCompras({required this.preco, required this.quantidade});

  List<Doces> get compras => _compras;
}
