import 'package:app_restaurante/model/providers.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/login_page.dart';

void main() {
  runApp(DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(create: (_) => UserData()),
            ChangeNotifierProvider(create: (_) => SweetInfo())
          ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
