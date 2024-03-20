import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bai4/constant/colors.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitCircle(
        itemBuilder: (context, index) {
          const colors = primaryColor;
          final color = colors[index % colors.length];
          return DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle));
        },
      )),
    );
  }
}
