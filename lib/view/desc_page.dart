// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:app_restaurante/model/providers.dart';
import 'package:app_restaurante/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescPage extends StatelessWidget {
  const DescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SweetInfo>(
        builder: (context, sweet, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.asset(
                  'images/cupcake3.webp',
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
              Text('${sweet.sweetDesc}'),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.bag,
                        color: Colors.white,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.all(30),
                          shape: const CircleBorder())),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
