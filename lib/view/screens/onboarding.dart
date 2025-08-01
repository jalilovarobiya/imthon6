import 'package:flutter/material.dart';
import 'package:imthon6/view/widgets/onboarding_body.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 29, 78),
      body: OnboardingBody(),
    );
  }
}
