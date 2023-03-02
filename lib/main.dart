import 'package:flutter/material.dart';
import 'package:smartcollege/nav-main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart College',
      home: Nav_main(),
    );
  }
}
