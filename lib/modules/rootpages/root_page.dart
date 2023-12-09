import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/modules/dietpages/views/diet_page.dart';
import 'package:diet_app/modules/home/views/home_page.dart';
import 'package:diet_app/modules/insightpages/views/insight_page.dart';
import 'package:diet_app/modules/profilepages/views/profile_page.dart';
import 'package:diet_app/modules/workoutpage/views/workout_page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
        builder: (BuildContext context) => const RootPage(),
        settings: const RouteSettings(name: 'RootPage'));
  }

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: [
        const HomePage(),
        const WorkOutPage(),
        const InsightPage(),
        const DietPage(),
        const ProfilePage()
      ].elementAt(_index),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 233, 224, 224),
              blurRadius: 10,
            ),
          ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60)),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sports_cricket_outlined,
                  ),
                  label: 'Workout',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.insights_rounded), label: 'Insight'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.free_breakfast_outlined), label: 'Diet'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_3_outlined), label: 'Profile'),
              ],
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: const IconThemeData(
                color: AppColors.orange,
              ),
              selectedItemColor: AppColors.black,
              unselectedIconTheme: const IconThemeData(color: AppColors.gray),
              selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w800, fontFamily: 'inter'),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w500),
              currentIndex: _index,
              iconSize: 30,
              onTap: _onTapItem,
            ),
          ),
        ),
      ),
    );
  }

  void _onTapItem(int value) {
    setState(() {
      _index = value;
    });
  }
}
