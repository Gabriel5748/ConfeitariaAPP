// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:app_restaurante/model/classes/sweet_class.dart';
import 'package:app_restaurante/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../services/providers.dart';

class ListaDoces extends StatefulWidget {
  const ListaDoces({super.key});

  @override
  State<ListaDoces> createState() => _ListaDocesState();
}

class _ListaDocesState extends State<ListaDoces> {
  final doce = Doces(preco: 0.00, quantidade: 1,image: '');
  List<bool> isSelected = List.generate(10, (index) => true);
  void toggleSelected(index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final sweetInfo = Provider.of<SweetInfo>(context);
    return GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: doce.docesList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              sweetInfo.setName(index, doce.docesList[index].nome!);
              sweetInfo.setPrice(index, doce.docesList[index].preco!);
              sweetInfo.setQuantidade(index, doce.docesList[index].quantidade!);
              sweetInfo.setDesc(index, doce.docesList[index].desc!);
              sweetInfo.setImage(index, doce.docesList[index].image!);
              sweetInfo.setRating(index, doce.docesList[index].rating!);
              Navigate.descPage(context);
            },
            child: Card(
              color: Color.fromARGB(255, 213, 132, 233),
              shadowColor: Colors.blueAccent[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    doce.docesList[index].image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(doce.docesList[index].nome!),
                        IconButton(
                            onPressed: () {
                              toggleSelected(index);
                            },
                            icon: isSelected[index]
                                ? Icon(CupertinoIcons.chevron_up)
                                : Icon(CupertinoIcons.chevron_down))
                      ],
                    ),
                  ),
                  RatingBarIndicator(
                    rating: doce.docesList[index].rating!,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 15,
                    direction: Axis.horizontal,
                  )
                ],
              ),
            ),
          );
        });
  }
}
