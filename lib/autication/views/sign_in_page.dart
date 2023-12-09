import 'package:diet_app/BLoC/EmailValidBLoc/sign_in_bloc.dart';
import 'package:diet_app/BLoC/EmailValidBLoc/sign_in_event.dart';
import 'package:diet_app/BLoC/EmailValidBLoc/sign_in_state.dart';
import 'package:diet_app/autication/views/sign_up_page.dart';
import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/core/app_images.dart';
import 'package:diet_app/modules/home/home.dart';
import 'package:diet_app/widgets/app_button.dart';
import 'package:diet_app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  static MaterialPageRoute route() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (context) => SignInBloc(),
              child: const SigninPage(),
            ));
  }

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _value = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextWidget(text: 'Sign in'),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) {
                        if (state is SignInErrorState) {
                          return Text(
                            state.errormessege,
                            style: const TextStyle(
                                fontFamily: 'inter',
                                fontWeight: FontWeight.bold),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: AppColors.gray,
                            width: 2,
                          ),
                        ),
                        child: TextField(
                          controller: emailcontroller,
                          onChanged: (val) {
                            BlocProvider.of<SignInBloc>(context).add(
                                SignInChangeEvent(emailcontroller.text,
                                    passwordcontroller.text));
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 15,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Phone / Email',
                            hintStyle: TextStyle(
                                color: AppColors.gray,
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'inter'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: AppColors.gray,
                              width: 2,
                            ),
                          ),
                          child: TextField(
                            controller: passwordcontroller,
                            onChanged: (val) {
                              BlocProvider.of<SignInBloc>(context).add(
                                  SignInChangeEvent(emailcontroller.text,
                                      passwordcontroller.text));
                            },
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 15),
                                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                                suffixIconColor: AppColors.gray,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: AppColors.gray,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'inter')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.05,
                          child: Transform.scale(
                            scale: 0.6,
                            child: Checkbox(
                              value: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = !_value;
                                });
                              },
                              activeColor: AppColors.orange,
                            ),
                          ),
                        ),
                        const TextWidgetTitle(
                            text: 'Remember me',
                            fontSize: 15,
                            color: AppColors.gray)
                      ],
                    ),
                    const TextWidgetTitle(
                        text: ' Forgot Password?',
                        fontSize: 15,
                        color: AppColors.gray)
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'By continuing you agree to Apps Terms of \n Servies & Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.gray,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'inter'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 30),
                  child: AppButton(
                      value: 'Sign in',
                      onPressed: () {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInChangeEvent(
                                emailcontroller.text, passwordcontroller.text));
                        Navigator.pushAndRemoveUntil(
                            context, RootPage.route(), (route) => false);
                      },
                      backgroundColor: AppColors.orange),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 10,
                          ),
                        ),
                      ),
                      const TextWidgetTitle(
                          text: 'Or Sign in with',
                          fontSize: 13,
                          color: AppColors.gray),
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ThirdpartyAppIcon(
                        name: AppImage.google,
                      ),
                      ThirdpartyAppIcon(name: AppImage.facebook)
                    ],
                  ),
                ),
                const TextWidgetTitle(
                    text: 'Don\'n have an account?',
                    fontSize: 13,
                    color: AppColors.gray),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, SignUpPage.route());
                    },
                    child: const TextWidgetTitle(
                        text: 'Sign up', fontSize: 15, color: AppColors.orange),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThirdpartyAppIcon extends StatelessWidget {
  const ThirdpartyAppIcon({
    required this.name,
    super.key,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.05,
        width: MediaQuery.sizeOf(context).width * 0.2,
        child: Image.asset(name));
  }
}
