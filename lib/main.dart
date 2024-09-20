import 'package:app_restaurante/view/HomePage/doces_display.dart';
import 'package:app_restaurante/view/HomePage/search_field.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/login_page.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ListaDoces(),
    );
  }
}