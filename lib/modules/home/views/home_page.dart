import 'dart:core';

import 'package:diet_app/BLoC/internetBLoc/internet_bloc.dart';
import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/modules/home/home.dart';
import 'package:diet_app/modules/home/views/fitnessInstructorPage/views/fitness_instructor_page.dart';
import 'package:diet_app/modules/home/views/notification_page.dart';
import 'package:diet_app/modules/home/views/workout_and_diet_page.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:diet_app/widgets/navigator_animated_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../BLoC/internetBLoc/internet_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
        builder: (BuildContext context) => const RootPage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  // ignore: unused_field
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  List<String> breakfastImage = [
    AppImage.breakfast1,
    AppImage.breakfast2,
    AppImage.breakfast3
  ];

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
  int _currentSelactedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: AppColors.white,
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 233, 224, 224),
                          blurRadius: 10,
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Today',
                            style: TextStyle(
                                color: AppColors.orange,
                                fontSize: 17,
                                fontFamily: 'inter',
                                fontWeight: FontWeight.w800),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.calendar_month_outlined),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(PageAnimated(
                                        navigatorname:
                                            const NotificationPage()));
                                  },
                                  child: const Icon(Icons.notifications_none))
                            ],
                          ),
                        ],
                      ),
                      TextWidget(
                          text:
                              "${listOfmonth[selectedDate.month - 1]},${selectedDate.day},${selectedDate.year}"),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                            itemCount: 365,
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, int index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _currentSelactedIndex = index;
                                    selectedDate = DateTime.now()
                                        .add(Duration(days: index));
                                  });
                                },
                                child: SizedBox(
                                  height: 80,
                                  width: 55,
                                  child: Column(
                                    children: [
                                      Text(
                                        listOfdays[DateTime.now()
                                                .add(Duration(days: index))
                                                .weekday -
                                            1],
                                        style: const TextStyle(
                                            color: AppColors.gray,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(4)),
                                          color: _currentSelactedIndex == index
                                              ? AppColors.orange
                                              : AppColors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            DateTime.now()
                                                .add(Duration(days: index))
                                                .day
                                                .toString(),
                                            style: TextStyle(
                                              color:
                                                  _currentSelactedIndex == index
                                                      ? AppColors.white
                                                      : AppColors.gray,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: CommonContainer(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    WorkOutAndDietPage.route(
                                        text: listOfmonth[
                                            selectedDate.month - 1]));
                              },
                              child: const Text(
                                'Workout',
                                style: TextStyle(color: AppColors.gray),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(40)),
                              child: const Center(
                                child: Text(
                                  'Water',
                                  style: TextStyle(
                                      fontSize: 11, color: AppColors.white),
                                ),
                              ),
                            ),
                            const Text(
                              'Diet',
                              style: TextStyle(color: AppColors.gray),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
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
                      )
                    ],
                  )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: 'Your plan for today'),
                      OrangeSellAllWidget(name: 'Sell all')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            width: MediaQuery.sizeOf(context).width * 1,
                            child: ListView.builder(
                              itemExtent: 300,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: breakfastImage.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: AssetImage(
                                                breakfastImage[index],
                                              )),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 140),
                                      child: Center(
                                        child: CommonContainer(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextWidgetTitle(
                                              text: "Breakfast",
                                              fontSize: 17,
                                              color: AppColors.black,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: TextWidgetTitle(
                                                text: "8:00 AM-8:30 AM",
                                                fontSize: 17,
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                MultiBlocListener(listeners: [
                  BlocListener<InternetBloc, InternetState>(
                    listener: (context, state) {
                      if (state is InternetGainedState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Internet Is Connected'),
                          backgroundColor: AppColors.orange,
                        ));
                      } else if (state is InternetLostState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Internet Is Not Connected',
                            style: TextStyle(
                                fontFamily: 'inter', color: AppColors.orange),
                          ),
                          backgroundColor: AppColors.black,
                        ));
                      }
                    },
                  ),
                  //  BlocConsumer<InternetBloc, InternetState>(
                  //     builder: (context, state) {

                  //       if (state is InternetLostState) {
                  //         return const Text('Internet not connectd');
                  //       } else if (state is InternetGainedState) {
                  //         return const Text('Internet connectd');
                  //       } else {
                  //         return const Text('Loading');
                  //       }
                  //     },
                  //     listener: (context, state) {
                  //       if (state is InternetGainedState) {
                  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //           content: Text('Internet Is Connected'),
                  //           backgroundColor: AppColors.orange,
                  //         ));
                  //       } else if (state is InternetLostState) {
                  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //           content: Text('Internet Is Not Connected'),
                  //           backgroundColor: AppColors.orange,
                  //         ));
                  //       }
                  //     },
                  //   ),
                ], child: const Text('')),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: 'Fitness instrctor'),
                      OrangeSellAllWidget(name: 'See all')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageAnimated(
                            navigatorname: const FitnessInstructorPage()));
                  },
                  behavior: HitTestBehavior.translucent,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CommonContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: CircleAvatar(
                                  maxRadius: 35,
                                  foregroundImage:
                                      AssetImage(AppImage.workoutimage1),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidgetTitleWorkoutandDiet(
                                        text: 'Bill Bowerman',
                                        fontSize: 15,
                                        color: AppColors.black),
                                    TextWidgetTitle(
                                        text: 'Cardio Specialist',
                                        fontSize: 12,
                                        color: AppColors.gray),
                                    TextWidgetTitleWorkoutandDiet(
                                        text: '6 years',
                                        fontSize: 12,
                                        color: AppColors.orange),
                                    TextWidgetTitle(
                                        text: 'Experience',
                                        fontSize: 12,
                                        color: AppColors.gray)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.orange,
                                size: 19,
                              ),
                              TextWidgetTitle(
                                text: '4.5',
                                fontSize: 14,
                                color: AppColors.black,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // AppButton(
                //     value: 'Api Call by Bloc',
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const ApiCallingPage(),
                //           ));
                //     },
                //     backgroundColor: AppColors.blue)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class waterCommonWidget extends StatefulWidget {
  const waterCommonWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  final String text1;
  final String text2;
  final String text3;

  @override
  State<waterCommonWidget> createState() => _waterCommonWidgetState();
}

// ignore: camel_case_types
class _waterCommonWidgetState extends State<waterCommonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            const OrangeDivider(
              hight: 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text1,
                    style: const TextStyle(
                        color: AppColors.black,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w800),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.water_drop,
                          size: 15,
                          color: AppColors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.text2,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'inter',
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                widget.text3,
                                style: const TextStyle(
                                    fontFamily: 'inter',
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
