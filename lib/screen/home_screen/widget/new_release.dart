import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bai4/constant/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/app_text.dart';
import '../collection_music_screen/collection_new_release.dart';

class NewRelease extends StatefulWidget {
  const NewRelease({super.key});

  @override
  State<NewRelease> createState() => _NewReleaseState();
}

class _NewReleaseState extends State<NewRelease> {
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
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.newRelease,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorText),
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const CollectionNewRelease()))
              },
              child: Row(
                children: [
                  AppText(
                    text: AppLocalizations.of(context)!.seeAll,
                    fonSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  SvgPicture.asset(
                    'lib/assets/images/icon_next.svg',
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
              itemCount: listImage.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(right: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: const BoxDecoration(
                        color: Color(0xffF5F6F7),
                        borderRadius: BorderRadius.all(Radius.circular(27))),
                    child: const Text(
                      'New Release',
                      style: TextStyle(
                          color: colorText,
                          fontSize: 13,
                          height: 1,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ));
              }),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _widget(listImage[index]);
              }),
        )
      ],
    );
  }

  _widget(String image) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: screenWidth * 0.2,
                height: screenHeight * 0.1,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You raise me up',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Mnado, Andrew',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                Text(
                  '2 days',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              'lib/assets/images/icon_results_dot.svg',
            ),
          )
        ],
      ),
    );
  }
}
