// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:app_restaurante/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  final double total;
  const TotalPrice({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: Color(0xffC77DFF)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Divider()),
            const Text('Total',style: titleStyle,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: titleStyle,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text('Checkout'),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(CupertinoIcons.arrow_right)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent[400],
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
