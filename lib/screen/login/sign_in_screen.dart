import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/button_widget.dart';
import 'login_screen.dart';

class MySignIn extends StatefulWidget {
  const MySignIn({super.key});

  @override
  State<MySignIn> createState() => _MySignInState();
}

class _MySignInState extends State<MySignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SvgPicture.asset(
              'lib/assets/images/image_sign_in.svg',
            ),
            const SizedBox(
              height: 32,
            ),
            const Center(
              child: Text(
                'Let\'s start now',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: const Color(0xffEEEEEE)),
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/images/logo_google.svg',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Continue with Google',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: const Color(0xffEEEEEE)),
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/images/logo_apple.svg',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Continue with Apple',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Stack(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Divider(
                  thickness: 1,
                  color: Color(0xffEEEEEE),
                  indent: 16,
                  endIndent: 16,
                ),
                Center(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "Or",
                      style: TextStyle(
                          color: Color(0xff616161), fontSize: 14, height: 1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            ButtonWidget(
              onPress: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              title: 'Sign In With Password',
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Color(0xff9E9E9E)),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
