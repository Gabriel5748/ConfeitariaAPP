//Botões adicionar favorito e adicionar ao carrinho na página desc_page
// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:app_restaurante/model/classes/carrinho_class.dart';
import 'package:app_restaurante/model/classes/favorito_class.dart';
import 'package:app_restaurante/services/providers.dart';
import 'package:app_restaurante/view/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class DescPageButtons extends StatelessWidget {
  const DescPageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SweetInfo, FavoritesProvider>(
      builder: (context, sweet, favorites, child) {
        return Container(
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
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  favorites.toggleFavorite(
                    nome: sweet.nome,
                    preco: sweet.preco,
                    quantidade: sweet.quantidade,
                    desc: sweet.desc,
                    image: sweet.image,
                    rating: sweet.rating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppTheme.primaryColor,
                      content: Row(
                        children: [
                          Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${sweet.nome} ${favorites.isFavorite(sweet.nome) ? 'adicionado aos' : 'removido dos'} favoritos',
                            style: AppTheme.bodyTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppTheme.primaryColor,
                  padding: const EdgeInsets.all(20),
                  shape: const CircleBorder(),
                  elevation: 5,
                ),
                child: Icon(
                  favorites.isFavorite(sweet.nome)
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CartProvider>().addToCart(
                          nome: sweet.nome,
                          preco: sweet.preco,
                          quantidade: sweet.quantidade,
                          desc: sweet.desc,
                          image: sweet.image,
                          rating: sweet.rating,
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppTheme.primaryColor,
                        content: Row(
                          children: [
                            Icon(
                              CupertinoIcons.cart_fill,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${sweet.nome} adicionado ao carrinho',
                              style: AppTheme.bodyTextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        action: SnackBarAction(
                          label: 'Ver Carrinho',
                          textColor: Colors.white,
                          onPressed: () => context.push('/cart'),
                        ),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.cart_fill,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Adicionar ao Carrinho',
                        style: AppTheme.subtitleStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
