// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:app_restaurante/model/classes/sweet_class.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../services/providers.dart';

class ListaDoces extends StatefulWidget {
  const ListaDoces({super.key});

  @override
  State<ListaDoces> createState() => _ListaDocesState();
}

class _ListaDocesState extends State<ListaDoces> {
  final doce = Doces(preco: 0.00, quantidade: 1, image: '');
  List<bool> isSelected = List.generate(10, (index) => true);

  void toggleSelected(index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final sweetInfo = Provider.of<SweetInfo>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: doce.docesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              sweetInfo.setName(index, doce.docesList[index].nome!);
              sweetInfo.setPrice(index, doce.docesList[index].preco);
              sweetInfo.setQuantidade(index, doce.docesList[index].quantidade);
              sweetInfo.setDesc(index, doce.docesList[index].desc!);
              sweetInfo.setImage(index, doce.docesList[index].image);
              sweetInfo.setRating(index, doce.docesList[index].rating!);
              context.go('/desc_page');
            },
            child: Container(
              decoration: AppTheme.cardDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: AssetImage(doce.docesList[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            doce.docesList[index].nome!,
                            style: AppTheme.subtitleStyle.copyWith(
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: doce.docesList[index].rating!,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 15,
                                direction: Axis.horizontal,
                              ),
                              SizedBox(width: 5),
                              Text(
                                doce.docesList[index].rating!.toString(),
                                style: AppTheme.bodyStyle.copyWith(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'R\$ ${doce.docesList[index].preco.toStringAsFixed(2)}',
                            style: AppTheme.subtitleStyle.copyWith(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
