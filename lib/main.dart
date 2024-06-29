import 'package:flutter/material.dart';
import 'package:translation_app/screens/homescreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Translation APP",
      home: HomeScreen(),
    );
  }
}