import 'package:flutter/material.dart';
import 'package:bai4/common/button_widget.dart';
import 'package:bai4/screen/login/sign_in_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyOnBoarding extends StatefulWidget {
  const MyOnBoarding({super.key});

  @override
  State<MyOnBoarding> createState() => _MyOnBoardingState();
}

class _MyOnBoardingState extends State<MyOnBoarding> {
  int _currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  List<Map<String, dynamic>> listOnBoardingScreen = [
    {
      'image': 'lib/assets/images/Rectangle_513.png',
      'name': 'Welcome to',
      'title': 'Nonstop Max',
      'description': 'Please ring start now to start exploring',
      'button': 'Start now'
    },
    {
      'image': 'lib/assets/images/Rectangle_513_2.png',
      'name': 'Let\'s start exploring',
      'title': 'your music',
      'description':
          'Hot music hits around the world are waiting for you to discover',
      'button': 'Continue'
    },
    {
      'image': 'lib/assets/images/Rectangle_513_3.png',
      'name': 'Create your own',
      'title': 'music',
      'description': 'Listen and create your own album',
      'button': 'Continue'
    }
  ];

  void nextPage() {
    if (_currentPage == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const MySignIn()));
    } else {
      setState(() {
        _currentPage++;
      });
      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          SizedBox(
            child: PageView.builder(
              controller: pageController,
              itemCount: listOnBoardingScreen.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('${listOnBoardingScreen[index]['image']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${listOnBoardingScreen[index]['name']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${listOnBoardingScreen[index]['title']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${listOnBoardingScreen[index]['description']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ButtonWidget(
                            onPress: () {
                              nextPage();
                            },
                            title: '${listOnBoardingScreen[index]['button']}',
                          ),
                        ]),
                  ),
                );
              },
            ),
          ),
          Positioned(
              bottom: 170,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: listOnBoardingScreen.length,
                        effect: const WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: Colors.white,
                          activeDotColor: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
