import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/app_input.dart';
import '../../../constant/colors.dart';

class HeaderHomeScreen extends StatefulWidget {
  const HeaderHomeScreen({super.key});

  @override
  State<HeaderHomeScreen> createState() => _HeaderHomeScreenState();
}

class _HeaderHomeScreenState extends State<HeaderHomeScreen> {
  List<String> listImage = [
    'lib/assets/images/anh.png',
    'lib/assets/images/anh_1.png',
    'lib/assets/images/anh_2.png',
    'lib/assets/images/anh_3.png',
    'lib/assets/images/anh_4.png',
    'lib/assets/images/anh_5.png',
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hi, Tuấn Hùng!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(AppLocalizations.of(context)!.whatListenToToDay)
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'lib/assets/images/Rectangle_513_2.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          AppInput(
            placeholder: AppLocalizations.of(context)!.search,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.mic),
          ),
          const SizedBox(
            height: 13,
          ),
          SizedBox(
            height: screenHeight * 0.2,
            child: ListView.builder(
              itemCount: listImage.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(listImage[index],
                            width: screenWidth * 0.7, fit: BoxFit.cover),
                      ),
                    ),
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        children: [
                          Text(
                            'Today V-pop Hits',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: colorWhite),
                          ),
                          Text(
                            'Drama | 10 April 2021 ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff9E9E9E)),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
