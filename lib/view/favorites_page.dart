// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_restaurante/model/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SweetInfo>(builder: (context, fav, child) {
        return fav.favs!.isNotEmpty
            ? Card(
                child: ListView.separated(
                    itemCount: fav.favs!.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: Image.asset(fav.favs![index].image!),
                          title: Text(fav.favs![index].nome!),
                          trailing: IconButton(
                              onPressed: () {
                                fav.removeFav(index);
                              },
                              icon: Icon(CupertinoIcons.trash)));
                    }),
              )
            : SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'images/no_favorites.png',
                  fit: BoxFit.cover,
                ));
      }),
    );
  }
}
