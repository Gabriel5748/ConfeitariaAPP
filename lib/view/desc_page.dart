// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:app_restaurante/model/providers.dart';
import 'package:app_restaurante/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class DescPage extends StatefulWidget {
  const DescPage({super.key});

  @override
  State<DescPage> createState() => _DescPageState();
}

class _DescPageState extends State<DescPage> {
  int quantidade = 1;
  late double total;

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
    return Scaffold(
      body: Consumer<SweetInfo>(
        builder: (context, sweet, child) {
          total = double.parse(sweet.sweetPrice!);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.asset(
                  sweet.sweetImage!,
                  fit: BoxFit.cover,
                ),
              ),
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
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: Padding(
              //     padding: const EdgeInsets.all(20),
              //     child: ElevatedButton(
              //         onPressed: () {},
              //         child: Icon(
              //           CupertinoIcons.bag,
              //           color: Colors.white,
              //           size: 30,
              //         ),
              //         style: ElevatedButton.styleFrom(
              //             backgroundColor: Colors.black,
              //             padding: const EdgeInsets.all(30),
              //             shape: const CircleBorder())),
              //   ),
              // )
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          decrement();
                          calculatePrice(
                              quantidade, double.parse(sweet.sweetPrice!));
                        },
                        child: Text('-')),
                    Text(quantidade.toString()),
                    TextButton(
                        onPressed: () {
                          increment();
                          calculatePrice(
                              quantidade, double.parse(sweet.sweetPrice!));
                        },
                        child: Text('+')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Total: \$${total.toString()}'),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
