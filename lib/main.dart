import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gifts_app/firebase_options.dart';
import 'package:gifts_app/views/screens/splashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
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
