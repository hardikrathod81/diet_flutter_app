import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/widgets/app_button.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/app_images.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
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
                    child: FlexibleSpaceBar(
                      background: Image.asset(
                        workoutimage[3],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
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
                  children: [
                    const TextWidget(text: 'Drill Essentials'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                          text: '15',
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                        TextWidgetTitleWorkoutandDiet(
                                            text: 'Avg.Minutes',
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
                                          text: 'Low',
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                        TextWidgetTitleWorkoutandDiet(
                                            text: 'Intensity',
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
                                          text: 'Beginner',
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                        TextWidgetTitleWorkoutandDiet(
                                            text: 'Level',
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
                              'Lace up and ease onto a varitey of diffrent workout types.geared to teach you the basic and kick-start your training journey.',
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: AppButton(
              value: 'Start',
              onPressed: () {},
              backgroundColor: AppColors.orange),
        ),
      ),
    );
  }
}
