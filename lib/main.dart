import 'package:diet_app/BLoC/bloc/bloc/api_calling_bloc.dart';
import 'package:diet_app/BLoC/internetBLoc/internet_bloc.dart';
import 'package:diet_app/core/app_colors.dart';
import 'package:diet_app/modules/onbordingpage/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const DietApp());
}

class DietApp extends StatelessWidget {
  const DietApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetBloc>(
            create: (context) => InternetBloc(),
          ),
          BlocProvider(
            create: (context) => ApiCallingBloc()..add(ApiCallingLoadEvent()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
          ),
          home: const LogoPage(),
        ));
  }
}
