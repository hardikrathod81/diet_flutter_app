import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/modules/workoutpage/views/workoutplan_1.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class WorkOutPage extends StatefulWidget {
  const WorkOutPage({super.key});

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const WorkOutPage(),
    );
  }

  @override
  State<WorkOutPage> createState() => _WorkOutPageState();
}

class _WorkOutPageState extends State<WorkOutPage>
    with TickerProviderStateMixin {
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

  List<Widget> route = [const WorkoutPlan1()];

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
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const TextWidget(text: 'Workout'),
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: AppColors.white,
                expandedHeight: MediaQuery.sizeOf(context).height * 0.4,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: TextWidget(text: 'Today Workout Plan'),
                      ),
                      Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.25,
                                width: MediaQuery.sizeOf(context).width * 1,
                                child: ListView.builder(
                                  itemExtent: 380,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: workoutimage.length,
                                  itemBuilder: (context, index) {
                                    return Hero(
                                      tag: 'ff',
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => route[0],
                                            ),
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.2,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.fitWidth,
                                                    image: AssetImage(
                                                      workoutimage[index],
                                                    ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 150),
                                              child: Center(
                                                child: CommonContainer(
                                                    child: Column(
                                                  children: [
                                                    TextWidgetTitle(
                                                      text: "Day 01",
                                                      fontSize: 17,
                                                      color: AppColors.black,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: TextWidgetTitle(
                                                        text: "7:00 AM-8:00 AM",
                                                        fontSize: 17,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(text: 'Workout Categoried'),
                                    OrangeSellAllWidget(name: 'See all')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.04,
                  child: TabBar(
                    unselectedLabelColor: AppColors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.orange),
                    tabs: const [
                      SwapIndictor(text: 'Beginner', fontsize: 13),
                      SwapIndictor(text: 'Intermediate', fontsize: 13),
                      SwapIndictor(text: 'Advance', fontsize: 13)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.25,
                              width: MediaQuery.sizeOf(context).width * 1,
                              child: ListView.builder(
                                itemExtent: 370,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: workoutimage.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.2,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: AssetImage(
                                                  workoutimage[index],
                                                )),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 120,
                                        left: 20,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              workoutnames[index],
                                              style: const TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            Text(
                                              workouttitle[index],
                                              style: const TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: TextWidget(text: 'New Workout'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.15,
                                child: ListView.builder(
                                  itemExtent: 190,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: workoutimage.length,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.2,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                    workoutimage[index],
                                                  )),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Column(
                      children: [Text('data')],
                    ),
                    const Column(
                      children: [Text('data')],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
