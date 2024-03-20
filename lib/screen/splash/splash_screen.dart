import 'package:flutter/material.dart';
import 'package:bai4/constant/colors.dart';

import '../login/onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
        const Duration(milliseconds: 2000),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyOnBoarding())));
  }

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: primaryColor,
    ).createShader(const Rect.fromLTWH(120.0, 100.0, 200.0, 70.0));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/images/logo_k_music.png'),
            Text(
              'NONSTOP MAX',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
