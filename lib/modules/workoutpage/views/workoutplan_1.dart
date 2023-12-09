import 'package:diet_app/modules/workoutpage/workoutcategories/views/workout_categories.dart';
import 'package:diet_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import '../../../widgets/app_widgets.dart';

class WorkoutPlan1 extends StatefulWidget {
  const WorkoutPlan1({super.key});

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => const WorkoutPlan1(),
    );
  }

  @override
  State<WorkoutPlan1> createState() => _WorkoutPlan1State();
}

class _WorkoutPlan1State extends State<WorkoutPlan1> {
  List<String> workoutimage = [
    AppImage.workoutimage1,
    AppImage.workoutimage2,
    AppImage.workoutimage3,
    AppImage.workoutimage4,
  ];

  List<String> workoutname = [
    'High knee March',
    'Jog in Place',
    'Hip Lifts',
    'Jumaba'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.sizeOf(context).height * 0.45,
              flexibleSpace: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: FlexibleSpaceBar(
                        background: Image.asset(
                          workoutimage[1],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: -20,
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const TextWidgetTitleWorkoutandDiet(
                      text: 'Day 01',
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextWidgetTitle(
                          text: 'Week 01,Assessment Week',
                          fontSize: 17,
                          color: AppColors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CommonContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidgetTitleWorkoutandDiet(
                                          text: '11',
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                        TextWidgetTitleWorkoutandDiet(
                                            text: 'Exercise',
                                            fontSize: 14,
                                            color: AppColors.orange)
                                      ],
                                    ),
                                  ),
                                  const GrayDivider(),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidgetTitleWorkoutandDiet(
                                          text: '350',
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                        TextWidgetTitleWorkoutandDiet(
                                            text: 'Calories',
                                            fontSize: 14,
                                            color: AppColors.orange)
                                      ],
                                    ),
                                  ),
                                  const GrayDivider(),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidgetTitleWorkoutandDiet(
                                          text: '10min',
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                        TextWidgetTitleWorkoutandDiet(
                                            text: 'Net Duratiin',
                                            fontSize: 14,
                                            color: AppColors.orange)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextWidgetTitle(
                          text:
                              'Lace up and ease onto a variety of differnt workout types, geared to teach you the basics and kick-start your training journey.',
                          fontSize: 16,
                          color: AppColors.gray),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextWidget(text: 'Warm-Up'),
                        ),
                        ListView.builder(
                          itemExtent: 100,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: workoutimage.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                workoutimage[index])),
                                      ),
                                    ),
                                    title: TextWidget(
                                        text: '0:30  ${workoutname[index]}'),
                                    titleAlignment:
                                        ListTileTitleAlignment.center,
                                    trailing: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColors.gray,
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 0.5,
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: AppButton(
              value: 'Start',
              onPressed: () {
                Navigator.push(context, WorkoutCategories.route());
              },
              backgroundColor: AppColors.orange),
        ),
      ),
    );
  }
}
