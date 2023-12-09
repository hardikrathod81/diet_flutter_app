import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton(
      {super.key,
      required this.value,
      required this.onPressed,
      required this.backgroundColor});

  final void Function()? onPressed;
  final String value;
  final Color backgroundColor;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        onPressed: widget.onPressed,
        child: Text(
          widget.value,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
