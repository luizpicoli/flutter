import 'package:flutter/material.dart';
import 'package:residencial2/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de suporte de T.I',
      home: HomePage(),
    );
  }
}
