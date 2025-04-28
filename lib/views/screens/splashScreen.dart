import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gifts_app/views/screens/onboardingScreens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
    "assets/images/Splash_Screen.png",
    fit: BoxFit.cover,
    width: double.infinity,
    height: double.infinity,
  ),
    );
  }
}