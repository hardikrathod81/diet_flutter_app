import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/modules/home/home.dart';
import 'package:diet_app/widgets/app_button.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
      builder: (context) => const ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, RootPage.route());
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: TextWidget(text: 'Profile'),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      AppImage.profile,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Center(
                  child: Text(
                    'Mia Linues',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 25,
                        fontFamily: 'inder',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'mialinues4@gmail.com',
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 17,
                      fontFamily: 'inder',
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Weight',
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 25,
                      fontFamily: 'inder',
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeightWidget(
                      text: 'START',
                      number: '58',
                      color: AppColors.gray,
                    ),
                    WeightWidget(
                        text: 'CURRENT', number: '58', color: AppColors.gray),
                    WeightWidget(
                        text: 'CHANGE', number: '0', color: AppColors.black)
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  child: AppButton(
                      value: 'Add Weight',
                      onPressed: () {},
                      backgroundColor: AppColors.orange),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    AccountContiner(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: TextWidget(text: 'Account'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: ListTileWidget(
                                name: "Edit Profile",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AccountContiner(
                        child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: ListTileWidget(name: 'Edit Plan'),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.name,
  });

  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidgetTitle(text: name, fontSize: 15, color: AppColors.black),
        const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: AppColors.gray,
        ),
      ],
    );
  }
}

class WeightWidget extends StatelessWidget {
  const WeightWidget({
    super.key,
    required this.text,
    required this.number,
    required this.color,
  });
  final String text;
  final String number;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidgetTitle(text: text, fontSize: 15, color: AppColors.black),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5, top: 10),
                  child: TextWidgetTitle(
                    text: number,
                    fontSize: 30,
                    color: color,
                  ),
                ),
                TextWidgetTitle(text: 'KG', fontSize: 15, color: color)
              ],
            )
          ],
        )
      ],
    );
  }
}
