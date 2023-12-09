import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/modules/onbordingpage/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacement(context, OnboardingScreen.route()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: AspectRatio(
              aspectRatio: 1 / 2,
              child: Image(image: AssetImage(AppImage.logo)))),
    );
  }
}
