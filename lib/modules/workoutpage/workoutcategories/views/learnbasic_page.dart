import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_images.dart';

class LearnBasicPage extends StatefulWidget {
  const LearnBasicPage({super.key});

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => const LearnBasicPage(),
    );
  }

  @override
  State<LearnBasicPage> createState() => _LearnBasicPageState();
}

class _LearnBasicPageState extends State<LearnBasicPage> {
  final ScrollController _scrollController = ScrollController();
  List<String> workoutimage = [
    AppImage.workoutimage1,
    AppImage.workoutimage2,
    AppImage.workoutimage3,
    AppImage.workoutimage4,
  ];

  List<int> numberofmin = [15, 15, 15, 15];
  List<String> nameofworkouts1 = [
    'Drill Essentials',
    'Fresh on the Circuit',
    'Drill Essentials',
    'Fresh on the Circuit'
  ];
  List<String> nameofworkouts2 = [
    'Beginner,No Equipment',
    'Beginner,No Equipment',
    'Beginner,No Equipment',
    'Beginner,No Equipment'
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
                      background: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(workoutimage[1])),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AspectRatio(
                    aspectRatio: 15 / 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidgetTitleWorkoutandDiet(
                    text: 'Learn The Basic \nof Traing',
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextWidgetTitle(
                        text: '06 Workouts·Beginner',
                        fontSize: 16,
                        color: AppColors.gray),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextWidgetTitle(
                        text:
                            'Lace up and ease onto a varitey of diffrent workout types.geared to teach you the basic and kick-start your training journey.',
                        fontSize: 16,
                        color: AppColors.gray),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextWidgetTitle(
                        text: 'Start here:Learn the Basic Drills',
                        fontSize: 18,
                        color: AppColors.black),
                  ),
                  ListView.builder(
                    controller: _scrollController,
                    itemCount: workoutimage.length,
                    itemExtent: 120,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                workoutimage[index]))),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextWidgetTitle(
                                            text: '${numberofmin[index]}',
                                            fontSize: 20,
                                            color: AppColors.white),
                                        const TextWidgetTitle(
                                            text: 'min',
                                            fontSize: 17,
                                            color: AppColors.white),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidgetTitle(
                                    text: nameofworkouts1[index],
                                    fontSize: 17,
                                    color: AppColors.black),
                                TextWidgetTitle(
                                    text: nameofworkouts2[index],
                                    fontSize: 15,
                                    color: AppColors.gray),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
