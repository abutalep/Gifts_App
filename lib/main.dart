import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gifts_app/firebase_options.dart';
import 'package:gifts_app/views/screens/splashScreen.dart';
import 'package:gifts_app/views/widgets/ShoppingCart.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const Gifts_App());
} 

// ignore: camel_case_types
class Gifts_App extends StatelessWidget {
  const Gifts_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gifts App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        '/cart': (context) => ShoppingCart(),
      },
      home: const SplashScreen(),
    );
  }
}