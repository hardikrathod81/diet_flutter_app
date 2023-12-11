import 'package:diet_app/core/app_images.dart';
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
  TabController? _tabController;
  List<String> workoutimage = [
    AppImage.workoutimage1,
    AppImage.workoutimage2,
    AppImage.workoutimage3,
    AppImage.workoutimage4,
  ];

  List<String> workoutnames = [
    'Learn The Basic Training',
    'Learn The Intermediate Training',
    'Learn The Hard Training',
    'Learn The Extra Hard Training'
  ];

  List<String> workouttitle = [
    '06 Workout Basic Training',
    '06 Workout Intermediate Training',
    '06 Workout Hard Training',
    '06 Workout Extra Hard Training'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var image in workoutimage) {
      precacheImage(AssetImage(image), context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController;
  }

  Widget _buildWorkoutListView(List<String> images, int itemExtent) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 1,
      child: ListView.builder(
        itemExtent: itemExtent.toDouble(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(images[index]),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workoutnames[index],
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      workouttitle[index],
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: TextWidget(text: 'Today Workout Plan'),
                      ),
                      _buildWorkoutListView(workoutimage, 380),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(text: 'Workout Categories'),
                            OrangeSellAllWidget(name: 'See all'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Material(
                  elevation: 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: TabBar(
                      dividerColor: AppColors.white,
                      labelColor: AppColors.white,
                      unselectedLabelColor: AppColors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.orange,
                      ),
                      tabs: const [
                        SwapIndictor(text: 'Beginner', fontsize: 13),
                        SwapIndictor(text: 'Intermediate', fontsize: 13),
                        SwapIndictor(text: 'Advance', fontsize: 13),
                      ],
                    ),
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
                            _buildWorkoutListView(workoutimage, 370),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: TextWidget(text: 'New Workout'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  workoutimage[index],
                                                ),
                                              ),
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
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildWorkoutListView(workoutimage, 370),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: TextWidget(text: 'New Workout'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  workoutimage[index],
                                                ),
                                              ),
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
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildWorkoutListView(workoutimage, 370),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: TextWidget(text: 'New Workout'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  workoutimage[index],
                                                ),
                                              ),
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
