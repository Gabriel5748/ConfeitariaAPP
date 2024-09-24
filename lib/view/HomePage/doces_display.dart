// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListaDoces extends StatefulWidget {
  const ListaDoces({super.key});

  @override
  State<ListaDoces> createState() => _ListaDocesState();
}

class _ListaDocesState extends State<ListaDoces> {
  List<bool> isSelected = List.generate(10, (index) => true);

  void toggleSelected(index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.blueAccent[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/cupcake3.webp',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cupcake'),
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
                  rating: 4.5,
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
          );
        });
  }
}
