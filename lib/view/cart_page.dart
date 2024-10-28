// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:app_restaurante/components/cart_page_components/alert_dialog.dart';
import 'package:app_restaurante/components/cart_page_components/total_price.dart';
import 'package:app_restaurante/model/classes/carrinho_class.dart';
import 'package:app_restaurante/services/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 0.00;

  void decrement(int index, List<MeuCarrinho> compras) {
    if (compras[index].quantidade > 1) {
      setState(() {
        compras[index].quantidade =
            (compras[index].quantidade - 1);

        recalcularTotal(compras);
      });
    }
  }

  void increment(int index, List<MeuCarrinho> compras) {
    setState(() {
      compras[index].quantidade =
          compras[index].quantidade + 1;

      recalcularTotal(compras);
    });
  }

  void recalcularTotal(List<MeuCarrinho> compras) {
    total = 0.0;
    for (MeuCarrinho d in compras) {
      total += d.preco * d.quantidade;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC77DFF),
      body: Consumer<CarrinhoProvider>(builder: (context, cart, child) {
        // Garante que o total é recalculado ao abrir a página
        recalcularTotal(cart.compras);

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cart.compras.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (DismissDirection direction) async {
                        if (direction == DismissDirection.endToStart) {
                          return await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialogCartPage(index: index);
                              });
                        }
                        return null;
                      },
                      key: ValueKey(cart.compras[index]),
                      background: Card(
                        color: Colors.red[600],
                        shadowColor: Colors.black,
                        elevation: 20,
                        child: SizedBox(
                            width: 400,
                            height: 100,
                            child: Icon(CupertinoIcons.trash,
                                color: Colors.white)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          color: Color(0xffcfbaf0),
                          shadowColor: Colors.black,
                          elevation: 20,
                          child: SizedBox(
                            width: 400,
                            height: 100,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 200,
                                  child: Image.asset(
                                    cart.compras[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(cart.compras[index].nome!),
                                      ],
                                    ),
                                    subtitle: Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('\$'),
                                              Text(cart.compras[index].preco.toStringAsFixed(2)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.redAccent[400],
                                                radius: 15,
                                                child: TextButton(
                                                  onPressed: () {
                                                    decrement(
                                                        index, cart.compras);
                                                  },
                                                  child: Center(
                                                      child: Text(
                                                    '-',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  cart.compras[index]
                                                      .quantidade.toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.redAccent[400],
                                                radius: 15,
                                                child: TextButton(
                                                  onPressed: () {
                                                    increment(
                                                        index, cart.compras);
                                                  },
                                                  child: Center(
                                                      child: Text(
                                                    '+',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            TotalPrice(
              total: total,
            )
          ],
        );
      }),
    );
  }
}
