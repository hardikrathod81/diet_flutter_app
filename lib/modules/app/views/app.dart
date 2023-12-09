import 'package:diet_app/modules/onbordingpage/views/logo_page.dart';
import 'package:flutter/material.dart';

class DietApp extends StatelessWidget {
  const DietApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoPage(),
    );
  }
}
