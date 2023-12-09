import 'package:flutter/material.dart';
import 'package:diet_app/core/app_colors.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 233, 224, 224),
              blurRadius: 10,
            ),
          ]),
      child: child,
    );
  }
}

class OrangeDivider extends StatelessWidget {
  const OrangeDivider({super.key, required this.hight});

  final double hight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * hight,
      child: const VerticalDivider(
        color: AppColors.orange,
        thickness: 3,
      ),
    );
  }
}

class GrayDivider extends StatelessWidget {
  const GrayDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
      child: VerticalDivider(
        color: AppColors.gray,
        thickness: 3,
      ),
    );
  }
}

class OrangeSellAllWidget extends StatelessWidget {
  const OrangeSellAllWidget({
    required this.name,
    super.key,
  });

  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          color: AppColors.orange,
          fontFamily: 'inter',
          fontWeight: FontWeight.w800),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
          fontFamily: 'inter',
          fontWeight: FontWeight.w800),
    );
  }
}

class TextWidgetTitle extends StatelessWidget {
  const TextWidgetTitle({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'inter',
          fontWeight: FontWeight.w600),
    );
  }
}

class TextWidgetTitleWorkoutandDiet extends StatelessWidget {
  const TextWidgetTitleWorkoutandDiet({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'inter',
          fontWeight: FontWeight.w700),
    );
  }
}

class BackWordButton extends StatelessWidget {
  const BackWordButton({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_back,
        color: AppColors.black,
      ),
    );
  }
}

class AccountContiner extends StatelessWidget {
  const AccountContiner({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1), color: AppColors.white),
      child: child,
    );
  }
}

class SwapIndictor extends StatelessWidget {
  const SwapIndictor({super.key, required this.text, required this.fontsize});

  final double fontsize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize, fontFamily: 'inter', fontWeight: FontWeight.w800),
    );
  }
}
