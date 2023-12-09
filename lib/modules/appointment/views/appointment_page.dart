import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/modules/payment/views/payment_page.dart';
import 'package:diet_app/widgets/app_button.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:diet_app/widgets/navigator_animated_file.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppoitmentPage extends StatefulWidget {
  const AppoitmentPage({super.key});

  static MaterialPageRoute route() {
    return MaterialPageRoute(builder: (context) => const AppoitmentPage());
  }

  @override
  State<AppoitmentPage> createState() => _AppoitmentPageState();
}

class _AppoitmentPageState extends State<AppoitmentPage> {
  DateTime selectedDate = DateTime.now();
  bool _iconontap = false;

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

  List<String> selecttimes = [
    '10:00 am',
    '10:30 am',
    '11:00 am',
    '11:30 am',
    '12:00 pm'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      color: AppColors.black,
                      onPressed: () {},
                    ),
                    const TextWidget(text: 'Appointment'),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.cancel_outlined))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextWidget(text: 'Select Date'),
                ),
                AspectRatio(
                  aspectRatio: 1 / 1.1,
                  child: TableCalendar(
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
                              borderRadius: BorderRadius.circular(13))),
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.utc(2023),
                      lastDay: DateTime.utc(2024)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextWidget(text: 'Select Time'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(children: [
                    Row(
                      children: [
                        ontaptime(context, 0),
                        Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: ontaptime(context, 1)),
                        Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: ontaptime(context, 2)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          ontaptime(context, 3),
                          Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: ontaptime(context, 4)),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: AppButton(
              value: "Next",
              onPressed: () {
                showDialog(
                    barrierDismissible: true,
                    barrierColor: Colors.black54,
                    useSafeArea: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 250),
                        child: Dialog(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextWidgetTitleWorkoutandDiet(
                                    text: 'Your Order Details:',
                                    fontSize: 17,
                                    color: AppColors.black,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: CommonContainer(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidgetTitle(
                                            text: 'Selected Date',
                                            fontSize: 14,
                                            color: AppColors.black,
                                          ),
                                          TextWidgetTitleWorkoutandDiet(
                                            text: '28/03/2021',
                                            fontSize: 15,
                                            color: AppColors.black,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.1,
                                            child: const GrayDivider()),
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidgetTitle(
                                            text: 'Selected Time',
                                            fontSize: 14,
                                            color: AppColors.black,
                                          ),
                                          TextWidgetTitleWorkoutandDiet(
                                            text: '02:00 pm',
                                            fontSize: 15,
                                            color: AppColors.black,
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                                ),
                                const Divider(
                                  color: AppColors.gray,
                                  thickness: 1,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidgetTitleWorkoutandDiet(
                                        text: 'Estimated Cost:',
                                        fontSize: 15,
                                        color: AppColors.black),
                                    TextWidgetTitleWorkoutandDiet(
                                        text: '500.00\$',
                                        fontSize: 15,
                                        color: AppColors.black),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 35,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _iconontap = !_iconontap;
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.04,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.orange,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: _iconontap
                                                  ? AppColors.white
                                                  : AppColors.orange),
                                          child: Center(
                                              child: TextWidgetTitle(
                                            text: 'Cancel',
                                            fontSize: 15,
                                            color: _iconontap
                                                ? AppColors.orange
                                                : AppColors.white,
                                          )),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                                context,
                                                PageAnimated(
                                                    navigatorname:
                                                        const PaymentPage()));
                                            _iconontap = !_iconontap;
                                          });
                                        },
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.04,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.orange,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: !_iconontap
                                                  ? AppColors.white
                                                  : AppColors.orange),
                                          child: Center(
                                              child: TextWidgetTitle(
                                            text: 'Confirm',
                                            fontSize: 15,
                                            color: !_iconontap
                                                ? AppColors.orange
                                                : AppColors.white,
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              backgroundColor: AppColors.orange),
        ),
      ),
    );
  }

  GestureDetector ontaptime(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _iconontap = !_iconontap;
        });
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.04,
        width: MediaQuery.sizeOf(context).width * 0.27,
        decoration: BoxDecoration(
            border: Border.all(
                color: _iconontap ? AppColors.gray : AppColors.orange,
                width: 2),
            borderRadius: BorderRadius.circular(40),
            color: _iconontap ? AppColors.white : AppColors.orange),
        child: Center(
            child: TextWidgetTitle(
          text: selecttimes[index],
          fontSize: 15,
          color: _iconontap ? AppColors.gray : AppColors.white,
        )),
      ),
    );
  }
}
