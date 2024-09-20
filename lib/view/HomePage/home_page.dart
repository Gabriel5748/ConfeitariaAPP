import 'package:app_restaurante/data/sweets_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final doces = Doces();
  late final List<Doces> listaDoces;
  int selectedIndex = 1;

  void onItemTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  void initState() {
    doces.getDados();
    listaDoces = doces.docesList ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            Text(
              'Hi, Username 👋',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => onItemTap(index),
        selectedItemColor: Colors.purple[200],
        items: const [
          BottomNavigationBarItem(
              label: 'Favoritos', icon: Icon(CupertinoIcons.heart)),
          BottomNavigationBarItem(label: 'Menu', icon: Icon(Icons.menu)),
          BottomNavigationBarItem(
              label: 'Carrinho', icon: Icon(CupertinoIcons.cart))
        ],
      ),
    );
  }
}
