import 'package:flutter/material.dart';
import 'package:bai4/screen/home_screen/widget/header_home_screen.dart';
import 'package:bai4/screen/home_screen/widget/list_for_you.dart';
import 'package:bai4/screen/home_screen/widget/list_video.dart';
import 'package:bai4/screen/home_screen/widget/list_want_to_hear.dart';
import 'package:bai4/screen/home_screen/widget/new_release.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      // đổi thành scaffold
      //canPop: false,
      onWillPop: () async {
        // Custom logic here if needed
        return false; // Set to false to prevent back navigation
      },
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            //physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderHomeScreen(),
                  ListForYou(),
                  NewRelease(),
                  ListVideo(),
                  ListWantToHear()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
