// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gifts_app/views/screens/signIn.dart';
import 'package:gifts_app/views/widgets/buildDot.dart';
import 'package:gifts_app/views/widgets/buildOnboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int totalPages = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (_currentPage < totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  SignIn()), 
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              BuildOnboarding(
                image: "assets/images/OnboardingOne.png",
                title: "A Romantic\nGift",
                subtitle: "Moments fade, but the right gift lasts forever We help you transform ordinary occasions into extraordinary memories with handpicked gifts that capture the heart and celebrate every special connection.",
              ),
              BuildOnboarding(
                image: "assets/images/OnboardingTwo.png",
                title: "Expressing\nFeeling",
                subtitle: "Memories in the Making Every gift in our collection is vetted for its 'wow factor' - because we believe gifting should create moments worth remembering forever.",
                
              ),
              BuildOnboarding(
                image: "assets/images/OnboardingThree.png",
                title: "Fast Delivery",
                subtitle: "Deliver happiness to your doorstep.",
                
              ),
            ],
          ),
          Positioned(
            left: 20,
          right: 20,
          bottom: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       
                    Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalPages, (index) => BuildDot(isActive: index == _currentPage)),
          ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:  Colors.white,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: const CircleBorder(
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                        onPressed: nextPage,
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                        ),
                      ),
                      
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
