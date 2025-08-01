import 'package:flutter/material.dart';

import 'package:imthon6/constants/app_colors.dart';
import 'package:imthon6/constants/app_images.dart';
import 'package:imthon6/constants/app_styles.dart';
import 'package:imthon6/view/screens/video_screen.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leftTopAnimation;
  late Animation<double> _rightTopAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _leftTopAnimation = Tween<double>(
      begin: 200,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _rightTopAnimation = Tween<double>(
      begin: 0,
      end: 200,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.mobile,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                left: 20,
                top: _leftTopAnimation.value + 300,
                child: Image.asset(AppImages.leftCash, width: 100, height: 100),
              );
            },
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                right: 20,
                top: _rightTopAnimation.value + 300,
                child: Image.asset(
                  AppImages.rightCash,
                  width: 100,
                  height: 100,
                ),
              );
            },
          ),
          Positioned(
            bottom: 180,
            left: 20,
            right: 20,
            child: Text(
              "Premium Video-darsliklarimiz orqali Tradingni 0 dan mukammal o’rganing",
              textAlign: TextAlign.center,
              style: AppStyles.w700s25h38white,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 100,
            right: 100,
            child: SizedBox(
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBlue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return VideoScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  "BATAFSIL",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
