import 'package:flutter/material.dart';
import 'package:gifts_app/views/screens/splashScreen.dart';

void main() {
  runApp(const Gifts_App());
} 

class Gifts_App extends StatelessWidget {
  const Gifts_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
    );
  }
}
