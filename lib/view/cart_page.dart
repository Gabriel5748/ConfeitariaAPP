// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:app_restaurante/components/cart_page_components/alert_dialog.dart';
import 'package:app_restaurante/components/cart_page_components/total_price.dart';
import 'package:app_restaurante/model/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantidade = 1;
  double total = 0.00;

  void decrement() {
    setState(() {
      if (quantidade > 1) {
        quantidade--;
      }
    });
  }

  void increment() {
    setState(() {
      quantidade++;
    });
  }

  void calculatePrice(int quantidade, double preco) {
    setState(() {
      total = preco * quantidade;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SweetInfo>(builder: (context, cart, child) {
        return cart.compras.isNotEmpty
            ? Column(
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
                                          cart.compras[index].image!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(cart.compras![index].nome!),
                                            ],
                                          ),
                                          subtitle: Column(children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('\$'),
                                                    Text(cart.compras![index]
                                                        .preco!),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 15,
                                                      child: TextButton(
                                                        onPressed: () =>
                                                            decrement(),
                                                        child: Center(
                                                            child: Text(
                                                          '-',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Text(quantidade
                                                          .toString()),
                                                    ),
                                                    CircleAvatar(
                                                      radius: 15,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            
                                                          });
                                                        
                                                        },
                                                        child: Center(
                                                            child: Text(
                                                          '+',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
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
              )
            : SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'images/empty_cart.jpg',
                  fit: BoxFit.cover,
                ));
      }),
    );
  }
}
