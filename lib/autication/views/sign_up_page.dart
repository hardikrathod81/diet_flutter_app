import 'package:diet_app/autication/views/sign_in_page.dart';
import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/widgets/app_button.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static MaterialPageRoute route() {
    return MaterialPageRoute(builder: (context) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextWidget(text: 'Sign Up'),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: AppColors.gray,
                            width: 2,
                          ),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 15,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                                color: AppColors.gray,
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'inter'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: AppColors.gray,
                              width: 2,
                            ),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 15,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: AppColors.gray,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'inter')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: AppColors.gray,
                              width: 2,
                            ),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 15,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Phone',
                                hintStyle: TextStyle(
                                    color: AppColors.gray,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'inter')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: AppColors.gray,
                              width: 2,
                            ),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 15),
                                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                                suffixIconColor: AppColors.gray,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: AppColors.gray,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'inter')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  child: AppButton(
                      value: 'Sign up',
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context, SigninPage.route(), (route) => true);
                      },
                      backgroundColor: AppColors.orange),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 10,
                          ),
                        ),
                      ),
                      const TextWidgetTitle(
                          text: 'Or Sign in with',
                          fontSize: 13,
                          color: AppColors.gray),
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ThirdpartyAppIcon(
                        name: AppImage.google,
                      ),
                      ThirdpartyAppIcon(name: AppImage.facebook)
                    ],
                  ),
                ),
                const TextWidgetTitle(
                    text: 'Don\'n have an account?',
                    fontSize: 13,
                    color: AppColors.gray),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context, SigninPage.route(), (route) => false);
                    },
                    child: const TextWidgetTitle(
                        text: 'Sign in', fontSize: 15, color: AppColors.orange),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
