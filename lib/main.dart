// ignore_for_file: prefer_const_constructors

import 'package:app_restaurante/services/providers.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(create: (_) => UserData()),
            ChangeNotifierProvider(create: (_) => SweetInfo()),
            ChangeNotifierProvider(create: (_) => CarrinhoProvider()),
            ChangeNotifierProvider(create: (_) => FavoritoProvider()),
          ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
