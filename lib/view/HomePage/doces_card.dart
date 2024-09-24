import 'package:flutter/material.dart';

class DocesCard extends StatelessWidget {
  const DocesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'images/cupcake.jpeg',
        fit: BoxFit.fill,
      ),
    );
  }
}
