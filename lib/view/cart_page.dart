// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_restaurante/components/cart_page_components/alert_dialog.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SweetInfo>(builder: (context, cart, child) {
        return cart.compras!.isNotEmpty
            ? ListView.builder(
                itemCount: cart.compras!.length,
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
                    key: ValueKey(cart.compras![index]),
                    background: Card(
                      color: Colors.red[600],
                      shadowColor: Colors.black,
                      elevation: 20,
                      child: SizedBox(
                        width: 400,
                        height: 100,
                        child: ListTile(
                          leading: Image.asset(cart.compras![index].image!),
                          title: Text(cart.compras![index].nome!),
                        ),
                      ),
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
                                  cart.compras![index].image!,
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
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.red[200],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Icon(
                                          CupertinoIcons.xmark,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                  subtitle: Column(children: [
                                    Row(
                                      children: [
                                        Text('\$'),
                                        Text(cart.compras![index].preco!),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('-'),
                                              Text('1'),
                                              Text('+'),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
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
