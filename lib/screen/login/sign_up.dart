import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bai4/common/app_input.dart';

import '../../common/button_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(child: Image.asset('lib/assets/images/logo_k_music.png')),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Create your account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const AppInput(
                placeholder: 'Full name',
                prefixIcon: Icon(Icons.person),
              ),
              const SizedBox(
                height: 24,
              ),
              const AppInput(
                placeholder: 'Phone',
                prefixIcon: Icon(Icons.phone_in_talk_outlined),
              ),
              const SizedBox(
                height: 24,
              ),
              const AppInput(
                placeholder: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              const SizedBox(
                height: 24,
              ),
              const AppInput(
                placeholder: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
              const SizedBox(
                height: 24,
              ),
              ButtonWidget(onPress: () {}, title: 'Sign In', colors: const [
                Color(0x80FC1B7C),
                Color(0x80714CF4),
                Color(0x800084F3),
              ]),
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
                        "or continue with",
                        style: TextStyle(
                            color: Color(0xff616161), fontSize: 14, height: 1),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 18),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xffEEEEEE)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/logo_apple.svg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 18),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xffEEEEEE)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/logo_google.svg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    child: Text("Bạn chưa có tài khoản?",
                        style: TextStyle(
                          color: Color(0xff9E9E9E),
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const SignUp()));
                    },
                    child: const Text("Sign In",
                        style: TextStyle(
                          color: Color(0xff121212),
                          fontWeight: FontWeight.w600,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
