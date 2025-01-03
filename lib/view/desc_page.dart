// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:app_restaurante/components/desc_page_components/buttons.dart';
import 'package:app_restaurante/services/providers.dart';
import 'package:app_restaurante/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../components/desc_page_components/expansion_tile.dart';

class DescPage extends StatefulWidget {
  const DescPage({super.key});

  @override
  State<DescPage> createState() => _DescPageState();
}

class _DescPageState extends State<DescPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 138, 200),
      body: Consumer<SweetInfo>(
        builder: (context, sweet, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: Image.asset(
                    sweet.sweetImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 10,
                    child: IconButton(
                        onPressed: () {
                          context.go('/home_page');
                        },
                        icon: Icon(
                          CupertinoIcons.back,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 30,
                        ))),
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sweet.sweetName,
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
