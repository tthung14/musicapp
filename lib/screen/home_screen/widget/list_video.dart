import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/app_text.dart';
import '../../../common/dialog_success.dart';
import '../../../constant/colors.dart';
import '../collection_music_screen/collection_video.dart';

class ListVideo extends StatefulWidget {
  const ListVideo({super.key});

  @override
  State<ListVideo> createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
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
    return Column(
      children: [
        const SizedBox(
          height: 22,
        ),
        Row(
          children: [
            const Expanded(
                child: Text(
              'Video',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff121212)),
            )),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const CollectionVideo()))
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
          height: screenHeight * 0.12,
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
                            width: screenWidth * 0.4, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showTextFieldDialog();
                            },
                            child: const Text(
                              'Today V-pop Hits',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: colorWhite),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 80,
                      top: 50,
                      child: Center(
                        child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: SvgPicture.asset(
                              'lib/assets/images/play_icon.svg',
                            )),
                      ),
                    )
                  ],
                );
              }),
        ),
      ],
    );
  }

  void _showTextFieldDialog() {
    showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return const DialogSuccess();
      },
    );
  }
}
