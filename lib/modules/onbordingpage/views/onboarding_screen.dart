import 'package:diet_app/autication/views/sign_in_page.dart';
import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const OnboardingScreen(),
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late int index;
  int currentindex = 0;

  final onboardPageList = [
    PageModel(
      widget: Container(
        padding: const EdgeInsets.only(left: 30),
        decoration: const BoxDecoration(color: AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(AppImage.onboardingPageImage1),
            ),
            const Text(
              'Meet your coach \n& start your \njourney.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: Container(
        padding: const EdgeInsets.only(left: 30),
        decoration: const BoxDecoration(color: AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Image.asset(AppImage.onboardingPageImage2),
            ),
            const Text(
              'Create a \nworkout & diet \nplan to stay fit.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: Container(
        padding: const EdgeInsets.only(left: 30),
        decoration: const BoxDecoration(color: AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(AppImage.onboardingPageImage3),
            ),
            const Text(
              'Easily track your \nworkout and diet \nactivity.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: Container(
        padding: const EdgeInsets.only(left: 30),
        decoration: const BoxDecoration(color: AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Image.asset(AppImage.onboardingPageImage4),
            ),
            const Text(
              'Stay Fit Always',
              style: TextStyle(
                  color: AppColors.orange,
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
            const Text(
              'No more negative \nbody thoughts.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Onboarding(
            pages: onboardPageList,
            startPageIndex: 0,
            onPageChange: (int pageIndex) {
              setState(() {
                currentindex = pageIndex;
              });
            },
          ),
          currentindex == 3
              ? Positioned(
                  bottom: 140,
                  left: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: SizedBox(
                      width: 150,
                      child: AppButton(
                          value: 'Get Started',
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context, SigninPage.route(), (route) => false);
                          },
                          backgroundColor: AppColors.orange),
                    ),
                  ),
                )
              : Positioned(
                  left: 30,
                  bottom: 150,
                  child: Row(
                    children: [
                      Container(
                        height: 10,
                        width: currentindex == 0 ? 30 : 10,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: currentindex == 0
                              ? AppColors.orange
                              : AppColors.gray,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: currentindex == 1 ? 30 : 10,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: currentindex == 1
                              ? AppColors.orange
                              : AppColors.gray,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: currentindex == 2 ? 30 : 10,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: currentindex == 2
                              ? AppColors.orange
                              : AppColors.gray,
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
