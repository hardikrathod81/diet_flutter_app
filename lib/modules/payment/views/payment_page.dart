import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/widgets/app_button.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _defultvalute = 1;
  bool _checkbox = true;
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
                  const TextWidget(text: 'Payment'),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.cancel_outlined))
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: TextWidget(text: 'Payment Method'),
              ),
              CommonContainer(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          AppImage.mastercard,
                          height: MediaQuery.sizeOf(context).height * 0.03,
                          width: MediaQuery.sizeOf(context).width * 0.1,
                        ),
                        Image.asset(
                          AppImage.paypal,
                          height: MediaQuery.sizeOf(context).height * 0.03,
                          width: MediaQuery.sizeOf(context).width * 0.1,
                        ),
                        Image.asset(
                          AppImage.appleicon,
                          height: MediaQuery.sizeOf(context).height * 0.03,
                          width: MediaQuery.sizeOf(context).width * 0.1,
                        ),
                        Image.asset(
                          AppImage.logo,
                          height: MediaQuery.sizeOf(context).height * 0.03,
                          width: MediaQuery.sizeOf(context).width * 0.1,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: AppColors.gray,
                    thickness: 0.3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Radio(
                          activeColor: AppColors.orange,
                          value: 1,
                          groupValue: _defultvalute,
                          onChanged: (value) {
                            setState(() {
                              _defultvalute = value!;
                            });
                          }),
                      Radio(
                          activeColor: AppColors.orange,
                          value: 2,
                          groupValue: _defultvalute,
                          onChanged: (value) {
                            setState(() {
                              _defultvalute = value!;
                            });
                          }),
                      Radio(
                          activeColor: AppColors.orange,
                          value: 3,
                          groupValue: _defultvalute,
                          onChanged: (value) {
                            setState(() {
                              _defultvalute = value!;
                            });
                          }),
                      Radio(
                          activeColor: AppColors.orange,
                          value: 4,
                          groupValue: _defultvalute,
                          onChanged: (value) {
                            setState(() {
                              _defultvalute = value!;
                            });
                          })
                    ],
                  )
                ],
              )),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextWidgetTitle(
                    text: 'Cardholder Name',
                    fontSize: 16,
                    color: AppColors.gray),
              ),
              TextFormField(
                cursorColor: AppColors.black,
                style: const TextStyle(
                    fontSize: 19,
                    color: AppColors.black,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextWidgetTitle(
                    text: 'Card Number', fontSize: 17, color: AppColors.gray),
              ),
              TextFormField(
                cursorColor: AppColors.black,
                style: const TextStyle(
                    fontSize: 19,
                    color: AppColors.black,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextWidgetTitle(
                              text: 'DD/MM/YY',
                              fontSize: 16,
                              color: AppColors.gray),
                        ),
                        TextFormField(
                          cursorColor: AppColors.black,
                          style: const TextStyle(
                              fontSize: 19,
                              color: AppColors.black,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.15,
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: TextWidgetTitle(
                                text: 'CVV Code',
                                fontSize: 16,
                                color: AppColors.gray),
                          ),
                          TextFormField(
                            cursorColor: AppColors.black,
                            style: const TextStyle(
                                fontSize: 19,
                                color: AppColors.black,
                                fontFamily: 'inter',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ))
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextWidgetTitle(
                    text: 'Billing zip code',
                    fontSize: 16,
                    color: AppColors.gray),
              ),
              TextFormField(
                cursorColor: AppColors.black,
                style: const TextStyle(
                    fontSize: 19,
                    color: AppColors.black,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.04,
                      width: MediaQuery.sizeOf(context).width * 0.05,
                      child: Checkbox(
                          checkColor: AppColors.white,
                          activeColor: AppColors.orange,
                          value: _checkbox,
                          onChanged: (value) {
                            setState(() {
                              _checkbox = !_checkbox;
                            });
                          }),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextWidgetTitle(
                        text: 'Set as default payment card',
                        fontSize: 17,
                        color: AppColors.black,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: AppButton(
              value: 'Confirm payment',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.35,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: TextWidgetTitleWorkoutandDiet(
                                  text: 'Payment completed',
                                  fontSize: 19,
                                  color: AppColors.black,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Congratulational! \nYou\'ve book a new appointment \nwith yout coach.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'inter',
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.calendar_month),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Tursday 02 May \n12:30-13:00',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'inter',
                                            fontSize: 16,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 20),
                                child: AppButton(
                                    value: 'Confirm',
                                    onPressed: () {},
                                    backgroundColor: AppColors.orange),
                              )
                            ],
                          ),
                        ));
                  },
                );
              },
              backgroundColor: AppColors.orange),
        ),
      ),
    );
  }
}
