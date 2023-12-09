import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';

import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../../home/views/home_page.dart';

class InsightPage extends StatefulWidget {
  const InsightPage({super.key});

  @override
  State<InsightPage> createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _iconOnTap = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: AppColors.white,
                expandedHeight: MediaQuery.sizeOf(context).height * 0.3,
                automaticallyImplyLeading: false,
                flexibleSpace: const FlexibleSpaceBar(),
              )
            ];
          },
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                height: MediaQuery.sizeOf(context).height * 0.04,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: AppColors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 233, 224, 224),
                        blurRadius: 10,
                      ),
                    ]),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  unselectedLabelColor: AppColors.black,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.orange),
                  tabs: const [
                    SwapIndictor(fontsize: 13, text: 'Workout'),
                    SwapIndictor(
                      text: 'Diet',
                      fontsize: 13,
                    ),
                    SwapIndictor(
                      text: 'Sleep',
                      fontsize: 13,
                    ),
                    SwapIndictor(
                      text: 'Water',
                      fontsize: 13,
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 30),
                              child: CommonContainer(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: TextWidget(text: 'Calories'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidgetTitleWorkoutandDiet(
                                                text: 'Burn',
                                                fontSize: 14,
                                                color: AppColors.black,
                                              ),
                                              TextWidgetTitleWorkoutandDiet(
                                                  text: '900',
                                                  fontSize: 15,
                                                  color: AppColors.gray)
                                            ],
                                          ),
                                        ),
                                        const GrayDivider(),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidgetTitleWorkoutandDiet(
                                                text: 'Target',
                                                fontSize: 14,
                                                color: AppColors.black,
                                              ),
                                              TextWidgetTitleWorkoutandDiet(
                                                  text: '1300',
                                                  fontSize: 15,
                                                  color: AppColors.gray)
                                            ],
                                          ),
                                        ),
                                        const GrayDivider(),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidgetTitleWorkoutandDiet(
                                                text: 'Left',
                                                fontSize: 14,
                                                color: AppColors.black,
                                              ),
                                              TextWidgetTitleWorkoutandDiet(
                                                  text: '400',
                                                  fontSize: 15,
                                                  color: AppColors.orange)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.30,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.45,
                                  child: const CommonIconWidget(
                                    icon: Icon(
                                      Icons.sports_handball_outlined,
                                      size: 100,
                                      color: AppColors.orange,
                                    ),
                                    iconname: 'Total Workouts',
                                    number: '15',
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.30,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.45,
                                  child: const CommonIconWidget(
                                      icon: Icon(
                                        Icons.watch_outlined,
                                        size: 100,
                                        color: AppColors.orange,
                                      ),
                                      iconname: 'Net Duratiom',
                                      number: '50min'),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 30),
                              child: CommonContainer(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: TextWidget(text: 'Calories'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidgetTitleWorkoutandDiet(
                                                text: 'Taken',
                                                fontSize: 14,
                                                color: AppColors.black,
                                              ),
                                              TextWidgetTitleWorkoutandDiet(
                                                  text: '700',
                                                  fontSize: 15,
                                                  color: AppColors.gray)
                                            ],
                                          ),
                                        ),
                                        const GrayDivider(),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidgetTitleWorkoutandDiet(
                                                text: 'Target',
                                                fontSize: 14,
                                                color: AppColors.black,
                                              ),
                                              TextWidgetTitleWorkoutandDiet(
                                                  text: '1300',
                                                  fontSize: 15,
                                                  color: AppColors.gray),
                                            ],
                                          ),
                                        ),
                                        const GrayDivider(),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidgetTitleWorkoutandDiet(
                                                text: 'Left',
                                                fontSize: 14,
                                                color: AppColors.black,
                                              ),
                                              TextWidgetTitleWorkoutandDiet(
                                                  text: '600',
                                                  fontSize: 15,
                                                  color: AppColors.orange)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ComponetsOfIcons(
                                    icon: Icon(
                                      Icons.health_and_safety_outlined,
                                      color: AppColors.orange,
                                      size: 80,
                                    ),
                                    name: 'Calories',
                                    number: '560'),
                                ComponetsOfIcons(
                                    icon: Icon(
                                      Icons.where_to_vote_outlined,
                                      color: AppColors.orange,
                                      size: 80,
                                    ),
                                    name: 'Protein',
                                    number: '150'),
                                ComponetsOfIcons(
                                  icon: Icon(
                                    Icons.fastfood_sharp,
                                    color: AppColors.orange,
                                    size: 80,
                                  ),
                                  name: 'Fat',
                                  number: '180',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: AspectRatio(
                                aspectRatio: 2.5,
                                child: CommonContainer(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SleepIconsComponets(
                                            text1: 'Woken Up',
                                            text2: '7:43',
                                            text3: 'am',
                                          ),
                                          SleepIconsComponets(
                                              text1: 'Went to Sleep',
                                              text2: '11:30',
                                              text3: 'pm')
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, top: 20, bottom: 20),
                                        child: VerticalDivider(
                                          thickness: 3,
                                          color: AppColors.gray,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                TextWidgetTitle(
                                                    text: '37%',
                                                    fontSize: 25,
                                                    color: AppColors.orange),
                                                TextWidgetTitle(
                                                  text: 'Reduced',
                                                  fontSize: 17,
                                                  color: AppColors.black,
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Text(
                                                'Sleep time compare \nto last week',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.black,
                                                    fontFamily: 'inter',
                                                    fontWeight:
                                                        FontWeight.w700),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.30,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.43,
                                    child: const CommonIconWidget(
                                        icon: Icon(
                                          Icons.watch,
                                          color: AppColors.orange,
                                          size: 100,
                                        ),
                                        iconname: 'Total Sleep Durtion',
                                        number: '08:04'),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.30,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.43,
                                    child: const CommonIconWidget(
                                        icon: Icon(
                                          Icons.bedroom_child_outlined,
                                          size: 100,
                                          color: AppColors.orange,
                                        ),
                                        iconname: 'Deep',
                                        number: '03:43'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CommonContainer(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            waterCommonWidget(
                                              text1: "Taken",
                                              text2: "2000",
                                              text3: "ml",
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: waterCommonWidget(
                                                  text1: 'Target',
                                                  text2: '3000',
                                                  text3: 'ml'),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                CommonContainer(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.04,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.09,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: _iconOnTap
                                                    ? AppColors.orange
                                                    : AppColors.gray),
                                            child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _iconOnTap = !_iconOnTap;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                  size: 19,
                                                  color: AppColors.white,
                                                )),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.1,
                                              child: Image.asset(
                                                  AppImage.watericon)),
                                          Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.04,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.09,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: _iconOnTap
                                                    ? AppColors.orange
                                                    : AppColors.gray),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _iconOnTap = !_iconOnTap;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                size: 19,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.03,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              color: AppColors.orange),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.water_drop_outlined,
                                                color: AppColors.white,
                                                size: 15,
                                              ),
                                              Text(
                                                'Add Drink',
                                                style: TextStyle(
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child:
                                  TextWidget(text: 'Water Consume Statistics'),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SleepIconsComponets extends StatelessWidget {
  const SleepIconsComponets({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  final String text1;
  final String text2;
  final String text3;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                const OrangeDivider(
                  hight: 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w800),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 20,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      text2,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'inter',
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Text(
                                        text3,
                                        style: const TextStyle(
                                            fontFamily: 'inter',
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}

class ComponetsOfIcons extends StatelessWidget {
  const ComponetsOfIcons(
      {super.key,
      required this.icon,
      required this.name,
      required this.number});
  final Icon icon;
  final String name;
  final String number;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.28,
      child: CommonContainer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10), child: icon),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextWidgetTitleWorkoutandDiet(
                text: name, fontSize: 15, color: AppColors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextWidgetTitleWorkoutandDiet(
                text: number, fontSize: 16, color: AppColors.black),
          )
        ],
      )),
    );
  }
}

class CommonIconWidget extends StatelessWidget {
  const CommonIconWidget(
      {super.key,
      required this.icon,
      required this.iconname,
      required this.number});

  final Icon icon;
  final String iconname;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: MediaQuery.sizeOf(context).width * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 233, 224, 224),
              blurRadius: 10,
            ),
          ],
          color: AppColors.white),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20), child: icon),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextWidgetTitleWorkoutandDiet(
              text: iconname,
              fontSize: 15,
              color: AppColors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextWidgetTitleWorkoutandDiet(
              text: number,
              color: AppColors.black,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
