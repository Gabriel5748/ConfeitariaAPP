// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:app_restaurante/components/desc_page_components/buttons.dart';
import 'package:app_restaurante/model/sweet_class.dart';
import 'package:app_restaurante/model/providers.dart';
import 'package:app_restaurante/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../components/desc_page_components/expansion_tile.dart';

class DescPage extends StatefulWidget {
  const DescPage({super.key});

  @override
  State<DescPage> createState() => _DescPageState();
}

class _DescPageState extends State<DescPage> {
  int quantidade = 1;
  late double total;
  late Doces doce = Doces();

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
    // final sweetCart = Provider.of<SweetInfo>(context);
    return Scaffold(
      body: Consumer<SweetInfo>(
        builder: (context, sweet, child) {
          total = double.parse(sweet.sweetPrice!);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: Image.asset(
                    sweet.sweetImage!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 10,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                          size: 30,
                        ))),
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${sweet.sweetName}',
                      style: titleStyle,
                    ),
                    Text(
                      '\$${sweet.sweetPrice}',
                      style: titleStyle,
                    )
                  ],
                ),
              ),
              RatingBarIndicator(
                rating: sweet.sweetRating!,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20,
                direction: Axis.horizontal,
              ),
              Text('${sweet.sweetDesc}'),
              Expanded(child: ExpansionTileDescPage()),
              DescPageButtons()
            ],
          );
        },
      ),
    );
  }
}
