// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app_restaurante/components/desc_page_components/buttons.dart';
import 'package:app_restaurante/services/providers.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DescPage extends StatelessWidget {
  const DescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SweetInfo>(
      builder: (context, sweet, child) {
        return Scaffold(
          backgroundColor: AppTheme.backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
              onPressed: () => context.pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      sweet.image,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sweet.nome,
                        style: AppTheme.titleStyle,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'R\$ ${sweet.preco.toStringAsFixed(2)}',
                          style: AppTheme.titleStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: sweet.rating,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            sweet.rating.toStringAsFixed(1),
                            style: AppTheme.bodyTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Descrição',
                        style: AppTheme.subtitleStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        sweet.desc,
                        style: AppTheme.bodyTextStyle,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => sweet.decrementQuantidade(),
                            icon: Icon(Icons.remove),
                            color: AppTheme.primaryColor,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '${sweet.quantidade}',
                              style: AppTheme.subtitleStyle,
                            ),
                          ),
                          IconButton(
                            onPressed: () => sweet.incrementQuantidade(),
                            icon: Icon(Icons.add),
                            color: AppTheme.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const DescPageButtons(),
        );
      },
    );
  }
}
