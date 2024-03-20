import 'package:flutter/material.dart';
import 'package:bai4/constant/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPress;
  final List<Color>? colors;
  final Color? textColor;
  const ButtonWidget(
      {super.key,
      required this.title,
      required this.onPress,
      this.colors,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return TextButton(
        onPressed: () {
          onPress();
        },
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: const Alignment(0.8, 1),
              colors: colors ?? primaryColor,
              tileMode: TileMode.mirror,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Text(
              title,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
