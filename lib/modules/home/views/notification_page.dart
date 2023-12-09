import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/modules/home/home.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(builder: (context) => const NotificationPage());
  }

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Map<String, String> notificationnew = {
    'Congratulations': '50% of your daily challenge is completed.',
    'Attention':
        'Your subscription is going to expire very soon. Subscribe now.'
  };
  Map<String, String> notificationearlier = {
    'Drink More':
        'You drunk less than 500ml today. To reach your goal you have to drink 700ml more.',
    'Daily Activity': 'Time for your yoga session',
    'Appointment': 'you have got an appointment with a yoga instructor',
    'Drink1 More':
        'You1 drunk less than 500ml today. To reach your goal you have to drink 700ml more.',
    'Daily2 Activity': 'Time 2for your yoga session',
    'Daily3 Activity': 'Time2 for your yoga session',
    'Ap2pointment': 'you have2 got an appointment with a yoga instructor',
  };

  List<String> notificationnewtime = ['9:35 AM', '9:20 AM'];
  List<String> notificationearliertime = [
    'Yesterday',
    '20 Apr',
    '15 Apr',
    '14 Apr',
    '13 Apr',
    '12 Apr',
    '11 Apr',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context, RootPage.route(), (route) => false);
                      },
                      color: AppColors.black,
                    ),
                    const TextWidget(text: 'Notification'),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.settings))
                  ],
                ),
              ),
              Row(
                children: [
                  const TextWidget(text: 'New'),
                  NotifiicationCircle(
                    number: notificationnew.length.toString(),
                  )
                ],
              ),
              ListView.builder(
                itemCount: notificationnew.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidgetTitleWorkoutandDiet(
                            text: notificationnew.keys.elementAt(index),
                            fontSize: 15,
                            color: AppColors.black),
                        TextWidgetTitleWorkoutandDiet(
                            text: notificationnewtime[index],
                            fontSize: 15,
                            color: AppColors.black)
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextWidgetTitle(
                          text: notificationnew.values.elementAt(index),
                          fontSize: 14,
                          color: AppColors.black),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: Row(
                  children: [
                    const TextWidget(text: 'Earlier'),
                    NotifiicationCircle(
                      number: notificationearlier.length.toString(),
                    )
                  ],
                ),
              ),
              ListView.builder(
                itemCount: notificationearlier.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidgetTitleWorkoutandDiet(
                            text: notificationearlier.keys.elementAt(index),
                            fontSize: 15,
                            color: AppColors.black),
                        TextWidgetTitleWorkoutandDiet(
                            text: notificationearliertime[index],
                            fontSize: 15,
                            color: AppColors.black)
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5, right: 80),
                      child: TextWidgetTitle(
                          text: notificationearlier.values.elementAt(index),
                          fontSize: 14,
                          color: AppColors.black),
                    ),
                  );
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}

class NotifiicationCircle extends StatelessWidget {
  const NotifiicationCircle({super.key, required this.number});

  final String number;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.03,
        width: MediaQuery.sizeOf(context).width * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 247, 205, 181),
                blurRadius: 15,
                blurStyle: BlurStyle.inner)
          ],
        ),
        child: Center(
          child: TextWidgetTitle(
              text: number, fontSize: 14, color: AppColors.orange),
        ),
      ),
    );
  }
}
