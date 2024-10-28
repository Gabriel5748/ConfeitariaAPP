//Botões adicionar favorito e adicionar ao carrinho na página desc_page
// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:app_restaurante/model/classes/carrinho_class.dart';
import 'package:app_restaurante/model/classes/favorito_class.dart';
import 'package:app_restaurante/model/classes/sweet_class.dart';
import 'package:app_restaurante/services/auth.dart';
import 'package:app_restaurante/services/providers.dart';
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
      child: Consumer3<SweetInfo, FavoritoProvider, CarrinhoProvider>(
          builder: (context, sweet, fav, cart, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                MeusFavoritos doce = MeusFavoritos(
                  'sadas',sweet.sweetName,sweet.sweetImage
                  // nome: sweet.sweetName,
                  // image: sweet.sweetImage,
                );
                fav.addFav(doce);
                sendData(context, doce);
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
                // Doces doce = Doces(
                //     image: sweet.sweetImage,
                //     nome: sweet.sweetName,
                //     preco: sweet.sweetPrice);
                // cart.addCart(doce);
                MeuCarrinho doce = MeuCarrinho(
                    nome: sweet.sweetName,
                    image: sweet.sweetImage,
                    preco: sweet.sweetPrice,
                    quantidade: sweet.sweetQuantidade);

                cart.addCart(doce);
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
