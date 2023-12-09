import 'package:flutter/material.dart';

class PageAnimated extends PageRouteBuilder {
  final Widget navigatorname;
  PageAnimated({required this.navigatorname})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              navigatorname,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0, 1);
            var end = Offset.zero;
            var curve = Curves.easeIn;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}

class PageBackAnimated extends PageRouteBuilder {
  final Widget navigatorname;
  PageBackAnimated({required this.navigatorname})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              navigatorname,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0, -1);
            var end = Offset.zero;
            var curve = Curves.easeIn;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
