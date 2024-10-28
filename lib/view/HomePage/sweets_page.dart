// ignore_for_file: prefer_const_constructors

import 'package:app_restaurante/view/HomePage/doces_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/providers.dart';

class SweetsPage extends StatefulWidget {
  const SweetsPage({super.key});

  @override
  State<SweetsPage> createState() => _SweetsPageState();
}

class _SweetsPageState extends State<SweetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xff9d4edd),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<UserData>(builder: (context, user, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, ${user.username} 👋',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search,color: Colors.black,size: 30,))
                  ],
                ),
              );
            }),
            Expanded(child: ListaDoces()),
          ],
        ),
      ),
    );
  }
}
