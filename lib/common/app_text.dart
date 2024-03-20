import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../constant/colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fonSize;
  final FontWeight? fontWeight;
  const AppText({super.key, required this.text, this.fonSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GradientText(
        text,
        style: TextStyle(fontSize: fonSize ?? 14.0, fontWeight: fontWeight),
        gradientType: GradientType.linear,
        colors: primaryColor,
      ),
    );
  }
}
