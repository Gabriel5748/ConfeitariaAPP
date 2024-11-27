// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_db.dart';
import '../../services/providers.dart';

class AlertDialogCartPage extends StatelessWidget {
  final int index;

  const AlertDialogCartPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<CarrinhoProvider>(builder: (context, cart, child) {
      return AlertDialog(
        title: Text('Delete'),
        content:
            Text('Are you sure you want to remove this sweet from the cart?'),
        actions: [
          ElevatedButton(
              onPressed: () {
                AuthDB().excluirPedidoPorCriterio(cart.compras[index].nome);
                cart.removeCart(index);
                Navigator.of(context).pop();
              },
              child: Text('Yes')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'))
        ],
      );
    });
  }
}
