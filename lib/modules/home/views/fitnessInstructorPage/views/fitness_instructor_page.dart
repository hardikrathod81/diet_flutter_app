import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/modules/appointment/views/appointment_page.dart';
import 'package:diet_app/modules/rootpages/root_page.dart';
import 'package:diet_app/widgets/app_button.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:diet_app/widgets/navigator_animated_file.dart';
import 'package:flutter/material.dart';

class FitnessInstructorPage extends StatelessWidget {
  const FitnessInstructorPage({super.key});

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => const FitnessInstructorPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppImage.workoutimage1))),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(
                        color: AppColors.white,
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageBackAnimated(navigatorname: const RootPage()),
                              (route) => false);
                        },
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: AppColors.white,
                          ))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 300),
                    child: AspectRatio(
                      aspectRatio: 1 / 0.8,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 233, 224, 224),
                                  blurRadius: 10,
                                ),
                              ],
                              color: AppColors.white),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidgetTitle(
                                    text: 'Bill Bowerman',
                                    fontSize: 27,
                                    color: AppColors.black),
                                TextWidgetTitle(
                                    text: 'Cardio Specialist',
                                    fontSize: 15,
                                    color: AppColors.gray),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconWithContainer(
                                        icon: Icon(
                                          Icons.message,
                                          size: 20,
                                        ),
                                      ),
                                      IconWithContainer(
                                          icon: Icon(
                                        Icons.call,
                                        size: 20,
                                      )),
                                      IconWithContainer(
                                          icon: Icon(
                                        Icons.videocam,
                                        size: 20,
                                      ))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CommonContainer(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextWidget(text: '04'),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 10,
                                                ),
                                                child: Text(
                                                  'Work \nExperiance',
                                                  style: TextStyle(
                                                      color: AppColors.gray,
                                                      fontFamily: 'inter',
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        CommonContainer(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextWidget(text: '32'),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 2),
                                                child: Text(
                                                  'Completed \nWorkouts',
                                                  style: TextStyle(
                                                      color: AppColors.gray,
                                                      fontFamily: 'inter',
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        CommonContainer(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextWidget(text: '25'),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 15),
                                                child: Text(
                                                  'Active \nClients',
                                                  style: TextStyle(
                                                      color: AppColors.gray,
                                                      fontFamily: 'inter',
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(text: 'Reviews'),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.orange,
                                size: 19,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.orange,
                                size: 19,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.orange,
                                size: 19,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.orange,
                                size: 19,
                              ),
                              Icon(
                                Icons.star_border,
                                color: AppColors.gray,
                                size: 19,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: TextWidgetTitle(
                                  text: '4.8',
                                  fontSize: 14,
                                  color: AppColors.black,
                                ),
                              ),
                              TextWidgetTitle(
                                text: '/5.0',
                                fontSize: 14,
                                color: AppColors.gray,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(children: [
                              Padding(
                                padding: EdgeInsets.only(left: 100),
                                child: CircleAvatar(
                                  backgroundColor: AppColors.orange,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 13),
                                    child: TextWidgetTitle(
                                      text: '50K',
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 75),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(AppImage.workoutimage1),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(AppImage.workoutimage1),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(AppImage.workoutimage2),
                                ),
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(AppImage.workoutimage3),
                              ),
                            ])
                          ],
                        ),
                        OrangeSellAllWidget(name: 'Read all reviews')
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextWidget(text: 'Jorge\'s Experince'),
                    ),
                    TextWidgetTitle(
                      text:
                          'Personal trainers assess their customers bodily strengths and weknesses and create customize workout plans.',
                      fontSize: 16,
                      color: AppColors.gray,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: AppButton(
                value: 'Book an Appointment',
                onPressed: () {
                  Navigator.push(context,
                      PageAnimated(navigatorname: const AppoitmentPage()));
                },
                backgroundColor: AppColors.orange),
          ),
        ),
      ),
    );
  }
}

class IconWithContainer extends StatelessWidget {
  const IconWithContainer({super.key, required this.icon});

  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 233, 224, 224),
              blurRadius: 10,
            ),
          ],
          color: AppColors.white),
      child: IconButton(onPressed: () {}, icon: icon),
    );
  }
}
