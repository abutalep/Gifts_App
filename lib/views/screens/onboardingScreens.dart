import 'package:flutter/material.dart';
import 'package:gifts_app/views/screens/signIn.dart';
import 'package:gifts_app/views/widgets/buildDot.dart';
import 'package:gifts_app/views/widgets/buildOnboarding.dart';

class OnboardingScreen extends StatefulWidget {
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
                subtitle: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              ),
              BuildOnboarding(
                image: "assets/images/OnboardingTwo.png",
                title: "Expressing\nFeeling",
                subtitle: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                
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
