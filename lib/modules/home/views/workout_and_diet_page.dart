import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/modules/dietpages/views/diet_page.dart';
import 'package:diet_app/modules/workoutpage/views/workout_page.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/app_button.dart';

class WorkOutAndDietPage extends StatefulWidget {
  const WorkOutAndDietPage({
    super.key,
    required this.text,
  });

  final String text;
  static MaterialPageRoute<void> route({
    required String text,
  }) {
    return MaterialPageRoute(
        builder: (context) => WorkOutAndDietPage(
              text: text,
            ));
  }

  @override
  State<WorkOutAndDietPage> createState() => _WorkOutAndDietPageState();
}

class _WorkOutAndDietPageState extends State<WorkOutAndDietPage>
    with TickerProviderStateMixin {
  List<String> listOfmonth = [
    "Jan",
    "Fab",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfdays = ["M", "T", "W", "T", "F", "S", "S"];
  int currentDateSelacted = 0;
  final ScrollController _scrollController = ScrollController();
  DateTime selectedDate = DateTime.now();
  List<String> workoutimages = [
    AppImage.workoutimage1,
    AppImage.workoutimage2,
    AppImage.workoutimage3,
    AppImage.workoutimage4
  ];

  List<String> workoutname = [
    'High knee March',
    'Jog in Place',
    'Hip Lifts',
    'Jumaba'
  ];

  List<String> brekfastimage = [
    AppImage.breakfast1,
    AppImage.breakfast2,
    AppImage.breakfast3,
    AppImage.breakfast1,
    AppImage.breakfast2
  ];

  List<String> eattimeline = [
    'Breakfast',
    'Lunch',
    'Snacks',
    'Lunch',
    'Dinner'
  ];
  List<String> eatitemname = [
    'Potato Pancakes',
    'Vegan Gravy',
    'Rostaed Vegan Pasta',
    'Pizza',
    'Meal'
  ];

  List<String> eattimes = [
    '08:30 AM',
    '01:30 PM',
    "03:50 PM",
    '05:50 PM',
    '10:00 PM'
  ];

  bool _onTap = true;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          child: Column(
        children: [
          CommonContainer(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(
                      color: AppColors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 105),
                      child: TextWidget(text: 'Calender'),
                    ),
                  ],
                ),
                CustomScrollView(
                  controller: _scrollController,
                  shrinkWrap: true,
                  slivers: [
                    SliverAppBar(
                      backgroundColor: AppColors.white,
                      automaticallyImplyLeading: false,
                      flexibleSpace: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(text: _onTap ? widget.text : ''),
                              orangeContenier(InkWell(
                                  onTap: () {
                                    setState(() {
                                      _onTap = !_onTap;
                                    });
                                  },
                                  child: Icon(
                                    _onTap
                                        ? (Icons.keyboard_arrow_down_outlined)
                                        : Icons.keyboard_arrow_up_outlined,
                                    color: AppColors.white,
                                  )))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: TableCalendar(
                        headerVisible: _onTap ? false : true,
                        formatAnimationDuration:
                            const Duration(milliseconds: 500),
                        calendarFormat:
                            _onTap ? CalendarFormat.week : CalendarFormat.month,
                        pageAnimationCurve: Curves.easeInOut,
                        headerStyle: const HeaderStyle(
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                              color: AppColors.black,
                              fontSize: 20,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.bold),
                          formatButtonVisible: false,
                          leftChevronIcon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.orange,
                          ),
                          rightChevronIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.orange,
                          ),
                        ),
                        calendarStyle: CalendarStyle(
                          outsideTextStyle: const TextStyle(
                              color: Color.fromARGB(255, 194, 192, 192),
                              fontFamily: 'inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          weekendTextStyle: const TextStyle(
                              color: AppColors.gray,
                              fontFamily: 'inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          defaultTextStyle: const TextStyle(
                              color: AppColors.gray,
                              fontFamily: 'inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          todayTextStyle: const TextStyle(
                            fontFamily: 'inter',
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                          todayDecoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        focusedDay: DateTime.now(),
                        firstDay: DateTime.utc(2022, 1, 1),
                        lastDay: DateTime.utc(2024, 1, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: AppColors.orange, width: 2)),
                  height: MediaQuery.sizeOf(context).height * 0.035,
                  child: TabBar(
                      dividerColor: AppColors.orange,
                      unselectedLabelColor: AppColors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(40)),
                      controller: _tabController,
                      tabs: const [
                        Text(
                          'Workout',
                        ),
                        Text(
                          'Diet',
                        )
                      ]),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Scaffold(
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: AppButton(
                              value: 'Go t workout page',
                              onPressed: () {
                                Navigator.push(context, WorkOutPage.route());
                              },
                              backgroundColor: AppColors.orange),
                        )),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: TextWidget(text: 'Day 01'),
                        ),
                        const TextWidgetTitleWorkoutandDiet(
                          text: 'Today you have 11 workout',
                          color: AppColors.black,
                          fontSize: 17,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextWidget(text: 'Warm-Up'),
                        ),
                        ListView.builder(
                          itemExtent: 100,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: workoutimages.length,
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
                                        image: DecorationImage(
                                            image: AssetImage(
                                                workoutimages[index])),
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Scaffold(
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: AppButton(
                              value: 'Go to diet page',
                              onPressed: () {
                                Navigator.push(context, DietPage.route());
                              },
                              backgroundColor: AppColors.orange),
                        )),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: TextWidget(text: 'Day 01'),
                        ),
                        const TextWidgetTitleWorkoutandDiet(
                          text: 'Today you have 5 time meal plan',
                          fontSize: 17,
                          color: AppColors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: brekfastimage.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.12,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        brekfastimage[index]))),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  text: eattimeline[index],
                                                ),
                                                TextWidgetTitleWorkoutandDiet(
                                                    text: eatitemname[index],
                                                    fontSize: 15,
                                                    color: AppColors.black),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child:
                                                      TextWidgetTitleWorkoutandDiet(
                                                          text: eattimes[index],
                                                          fontSize: 15,
                                                          color:
                                                              AppColors.gray),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 0.2,
                                        color: AppColors.gray,
                                      )
                                    ],
                                  ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      )),
    );
  }

  Container orangeContenier(Widget child) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.orange),
      child: child,
    );
  }
}
