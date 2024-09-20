import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 500,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(20)
            ),
            child: IconButton(onPressed: (){
            },icon: const Align(
              alignment: Alignment.centerLeft,
              child: Icon(CupertinoIcons.search)),),
          )
        ],
      ),
    );
  }
}
