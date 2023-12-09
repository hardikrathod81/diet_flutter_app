import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import 'diet_categories_1_page.dart';
import 'diet_categories_2_page.dart';
import 'diet_categories_3_page.dart';

class DietPage extends StatefulWidget {
  const DietPage({super.key});
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => const DietPage(),
    );
  }

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  List<String> breakfastImage = [
    AppImage.breakfast1,
    AppImage.breakfast2,
    AppImage.breakfast3
  ];

  List<String> breakfastname = ['Vegan Diet', 'Keto Diet', 'Logon Diet'];

  List<int> breakfastday = [15, 10, 5];

  List<Widget> dietCategories = [
    const DietCategories1Page(),
    const DietCategories2Page(),
    const DietCategories3Page()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [TextWidget(text: 'Diet')],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(text: 'Today Diet Plan'),
                    OrangeSellAllWidget(name: 'See all')
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
                                          MediaQuery.sizeOf(context).width * 1,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fitWidth,
                                            image: AssetImage(
                                              breakfastImage[index],
                                            )),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 150),
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
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(text: 'Diet Categories'),
                    OrangeSellAllWidget(
                      name: 'See all',
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ListView.builder(
                    itemExtent: 270,
                    shrinkWrap: true,
                    itemCount: breakfastImage.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => dietCategories[index],
                                ));
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(breakfastImage[index])),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              const Positioned(
                                left: 210,
                                top: 5,
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  color: AppColors.white,
                                  size: 30,
                                ),
                              ),
                              Positioned(
                                top: 340,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      breakfastname[index],
                                      style: const TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      '${breakfastday[index]} Days Plan',
                                      style: const TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
