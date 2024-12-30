import 'package:flutter/material.dart';
import 'package:portfolio/screens/homepage.dart';
import 'package:portfolio/screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My portfolio',
      // theme: ThemeData(
      //   useMaterial3: true,
      // ),
      home: Portfolioscreen(),
    );
  }
}
