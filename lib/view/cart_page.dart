// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_restaurante/services/providers.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:app_restaurante/model/classes/carrinho_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../components/custom_bottom_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'Meu Carrinho',
          style: AppTheme.titleStyle.copyWith(color: AppTheme.textColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.cart_badge_minus,
                    size: 64,
                    color: AppTheme.primaryColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Carrinho vazio',
                    style: AppTheme.subtitleStyle.copyWith(
                      color: AppTheme.primaryColor.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Adicione itens ao carrinho para vê-los aqui',
                    style: AppTheme.bodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cart.cartItems.length,
                  itemBuilder: (context, index) {
                    final doce = cart.cartItems[index];
                    return Dismissible(
                      key: Key(doce.nome ?? ''),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        cart.removeFromCart(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${doce.nome} removido do carrinho'),
                            backgroundColor: AppTheme.primaryColor,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          context.read<SweetInfo>().updateDoce(
                                nome: doce.nome ?? '',
                                preco: doce.preco,
                                quantidade: doce.quantidade,
                                desc: doce.desc ?? '',
                                image: doce.image,
                                rating: doce.rating ?? 0.0,
                              );
                          context.push('/home/desc');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: AppTheme.cardDecoration,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  doce.image,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doce.nome ?? '',
                                        style: AppTheme.subtitleStyle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  if (doce.quantidade > 1) {
                                                    cart.updateQuantity(index, doce.quantidade - 1);
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.remove_circle_outline,
                                                  color: AppTheme.primaryColor,
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.primaryColor.withOpacity(0.1),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  '${doce.quantidade}',
                                                  style: AppTheme.bodyTextStyle,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  cart.updateQuantity(index, doce.quantidade + 1);
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outline,
                                                  color: AppTheme.primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'R\$ ${(doce.preco * doce.quantidade).toStringAsFixed(2)}',
                                                style: AppTheme.titleStyle.copyWith(
                                                  color: AppTheme.primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.delete_outline,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  cart.removeFromCart(index);
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('${doce.nome} removido do carrinho'),
                                                      backgroundColor: AppTheme.primaryColor,
                                                      behavior: SnackBarBehavior.floating,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: AppTheme.subtitleStyle,
                        ),
                        Text(
                          'R\$ ${cart.total.toStringAsFixed(2)}',
                          style: AppTheme.titleStyle.copyWith(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Implementar checkout
                        },
                        style: AppTheme.primaryButtonStyle,
                        child: Text(
                          'Finalizar Pedido',
                          style: AppTheme.subtitleStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const CustomBottomBar(selectedIndex: 2),
    );
  }
}
