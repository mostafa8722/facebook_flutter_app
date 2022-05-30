import 'package:facebook_flutter_app/screens/home/home_screen.dart';
import "package:flutter/material.dart";

    class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber
      ),
      home : HomeScreen()
    );

  }
    }