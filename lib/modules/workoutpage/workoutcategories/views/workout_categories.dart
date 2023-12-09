import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/modules/workoutpage/workoutcategories/views/learnbasic_page.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_images.dart';

class WorkoutCategories extends StatefulWidget {
  const WorkoutCategories({super.key});

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => const WorkoutCategories(),
    );
  }

  @override
  State<WorkoutCategories> createState() => _WorkoutCategoriesState();
}

class _WorkoutCategoriesState extends State<WorkoutCategories>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  List<String> workoutimage = [
    AppImage.workoutimage1,
    AppImage.workoutimage2,
    AppImage.workoutimage3,
    AppImage.workoutimage4,
  ];

  List<String> workoutnames = [
    'Learn The Basic Trainig',
    'Learn The Intermdeaite Trainig',
    'Learn The Hard Trainig',
    'Learn The Extra Hard Trainig'
  ];

  List<String> workouttitle = [
    '06 Workout Basic Trainig',
    '06 Workoute Intermdeaite Trainig',
    '06 WorkoutHard Trainig',
    '06 WorkoutExtra Hard Trainig'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(text: 'Workout Categories'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TabBar(
                  labelPadding: const EdgeInsets.all(5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 5,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.orange),
                  unselectedLabelColor: AppColors.black,
                  controller: _tabController,
                  tabs: const [
                    SwapIndictor(text: 'Beginner', fontsize: 13),
                    SwapIndictor(text: 'Intermediate', fontsize: 13),
                    SwapIndictor(text: 'Advance', fontsize: 13)
                  ]),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemExtent: 200,
                        itemCount: workoutimage.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, LearnBasicPage.route());
                              },
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
                                  Positioned(
                                    top: 120,
                                    left: 15,
                                    right: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          workoutnames[index],
                                          style: const TextStyle(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              workouttitle[index],
                                              style: const TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: AppColors.white),
                                              child: const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Row(
                                                  children: [
                                                    TextWidgetTitle(
                                                        text: 'Go Pro',
                                                        fontSize: 13,
                                                        color:
                                                            AppColors.orange),
                                                    Icon(
                                                      Icons
                                                          .local_fire_department_sharp,
                                                      size: 15,
                                                      color: AppColors.orange,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                const Text('data'),
                const Text('data')
              ]),
            )
          ],
        ),
      )),
    );
  }
}
