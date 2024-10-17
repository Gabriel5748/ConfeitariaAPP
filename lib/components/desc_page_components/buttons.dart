//Botões adicionar favorito e adicionar ao carrinho na página desc_page
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:app_restaurante/model/carrinho.dart';
import 'package:app_restaurante/model/sweet_class.dart';
import 'package:app_restaurante/model/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescPageButtons extends StatelessWidget {
  const DescPageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // final compras = Provider.of<ComprasProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Consumer<SweetInfo>(builder: (context, sweet, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Doces doce = Doces(
                  image: sweet.sweetImage,
                  nome: sweet.sweetName,
                );
                sweet.addFav(doce);
              },
              child: Icon(CupertinoIcons.heart),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20)),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Doces doce = Doces(
                    image: sweet.sweetImage,
                    nome: sweet.sweetName,
                    preco: sweet.sweetPrice);
                sweet.addCart(doce);
              },
              child: Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            )
          ],
        );
      }),
    );
  }
}
