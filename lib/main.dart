import 'package:flutter/material.dart';
import 'package:tpmtugas2/assets/color/colorPalette.dart';
import 'package:tpmtugas2/pages/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUGAS TPM 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorPallete.primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/' : (context) => const loginPage(),
      },
    );
  }
}

