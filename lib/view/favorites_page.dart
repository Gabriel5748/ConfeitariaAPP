// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_restaurante/services/providers.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../components/custom_bottom_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'Meus Favoritos',
          style: AppTheme.titleStyle.copyWith(color: AppTheme.textColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favorites, child) {
          if (favorites.favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.heart_slash_fill,
                    size: 64,
                    color: AppTheme.primaryColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nenhum favorito ainda',
                    style: AppTheme.subtitleStyle.copyWith(
                      color: AppTheme.primaryColor.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Adicione itens aos favoritos para vê-los aqui',
                    style: AppTheme.bodyTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.favorites.length,
            itemBuilder: (context, index) {
              final doce = favorites.favorites[index];
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
                  favorites.toggleFavorite(
                    nome: doce.nome ?? '',
                    preco: doce.preco,
                    quantidade: doce.quantidade,
                    desc: doce.desc ?? '',
                    image: doce.image,
                    rating: doce.rating ?? 0.0,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${doce.nome} removido dos favoritos'),
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
                    child: Stack(
                      children: [
                        Row(
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
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppTheme.highlightColor,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${doce.rating?.toStringAsFixed(1) ?? '0.0'}',
                                          style: AppTheme.bodyTextStyle,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'R\$ ${doce.preco.toStringAsFixed(2)}',
                                      style: AppTheme.titleStyle.copyWith(
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              favorites.toggleFavorite(
                                nome: doce.nome ?? '',
                                preco: doce.preco,
                                quantidade: doce.quantidade,
                                desc: doce.desc ?? '',
                                image: doce.image,
                                rating: doce.rating ?? 0.0,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${doce.nome} removido dos favoritos'),
                                  backgroundColor: AppTheme.primaryColor,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const CustomBottomBar(selectedIndex: 0),
    );
  }
}
