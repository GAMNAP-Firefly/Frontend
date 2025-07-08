import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'features/home/presentation/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FITTEST",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFECEFF4),
      ),
      home: const HomePage(),
    );
  }
}
