import 'package:flutter/material.dart';
import 'package:gifts_app/models/onboarding_models.dart';

class BuildOnboarding extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  BuildOnboarding({
    required this.image,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OnboardingModels onboardingModels=OnboardingModels(image:image,title:title,subtitle: subtitle);
    return Container(
        width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(onboardingModels.image),
          fit: BoxFit.cover,
        ),
      ),
      child:Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  
                  children: [
                    Text(
                      onboardingModels.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      onboardingModels.subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 120),
                    
                  ],
                ),
              ),
    ],
  ),

      )
      ;
  }
}


