import 'package:flutter/material.dart';
import 'package:bai4/screen/login/widget/tabBar_account.dart';
import 'package:bai4/screen/login/widget/tabBar_phone.dart';

import '../../common/app_text.dart';
import '../../constant/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LinearGradient linearGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: primaryColor,
  );
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
              height: 50,
            ),
            const SizedBox(
              height: 700,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(
                            child: AppText(
                          text: 'Phone',
                          fonSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                        Tab(
                            child: AppText(
                          text: 'Account',
                          fonSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: TabBarPhone(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: TabBarAccount(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
