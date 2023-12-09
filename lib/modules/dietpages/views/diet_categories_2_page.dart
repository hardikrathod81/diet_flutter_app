import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/modules/dietpages/views/diet_categories_1_page.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class DietCategories2Page extends StatefulWidget {
  const DietCategories2Page({super.key});

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => const DietCategories2Page(),
    );
  }

  @override
  State<DietCategories2Page> createState() => _DietCategories1PageState();
}

class _DietCategories1PageState extends State<DietCategories2Page> {
  bool _value = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.white,
            pinned: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: Stack(
              children: [
                const Positioned(
                  left: 0,
                  right: 0,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(AppImage.breakfast2)),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: -20,
                  right: 0,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
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
                    text: 'Day 01',
                    fontSize: 22,
                    color: AppColors.black,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextWidgetTitle(
                        text: 'Week 01,Assessment Week',
                        fontSize: 17,
                        color: AppColors.gray),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidgetTitleWorkoutandDiet(
                                      text: '500',
                                      fontSize: 14,
                                      color: AppColors.orange,
                                    ),
                                    TextWidgetTitleWorkoutandDiet(
                                        text: 'Protein',
                                        fontSize: 14,
                                        color: AppColors.black)
                                  ],
                                ),
                              ),
                              const GrayDivider(),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidgetTitleWorkoutandDiet(
                                      text: '250',
                                      fontSize: 14,
                                      color: AppColors.orange,
                                    ),
                                    TextWidgetTitleWorkoutandDiet(
                                        text: 'Fat',
                                        fontSize: 14,
                                        color: AppColors.black)
                                  ],
                                ),
                              ),
                              const GrayDivider(),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidgetTitleWorkoutandDiet(
                                      text: '1500',
                                      fontSize: 14,
                                      color: AppColors.orange,
                                    ),
                                    TextWidgetTitleWorkoutandDiet(
                                        text: 'Calories',
                                        fontSize: 14,
                                        color: AppColors.black)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: brekfastimage.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Commonbreakfast(
                                        brekfastimage: brekfastimage,
                                        eattimeline: eattimeline,
                                        eatitemname: eatitemname,
                                        eattimes: eattimes,
                                        context: context,
                                        index: index),
                                    Checkbox(
                                        shape: const CircleBorder(
                                            side: BorderSide(width: 1)),
                                        checkColor: AppColors.white,
                                        activeColor: AppColors.orange,
                                        value: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = !_value;
                                          });
                                        })
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
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
