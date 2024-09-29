// ignore_for_file: prefer_const_constructors

import 'package:app_restaurante/view/HomePage/doces_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/providers.dart';

class SweetsPage extends StatefulWidget {
  const SweetsPage({super.key});

  @override
  State<SweetsPage> createState() => _SweetsPageState();
}

class _SweetsPageState extends State<SweetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Consumer<UserData>(builder: (context, user, child) {
                return Text(
                  'Hi, ${user.getName()} 👋',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                );
              })),
          Expanded(child: ListaDoces()),
        ],
      ),
    );
  }
}
