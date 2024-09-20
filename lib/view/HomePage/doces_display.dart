import 'package:flutter/material.dart';

class ListaDoces extends StatelessWidget {
  const ListaDoces({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 200,          
            margin: const EdgeInsetsDirectional.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green[200]
            ),
            child: Text('Index: $index')
          );
        });
  }
}
