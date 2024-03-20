import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/app_text.dart';
import '../../../constant/colors.dart';
import '../collection_music_screen/collection_want_to_hear_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListWantToHear extends StatefulWidget {
  const ListWantToHear({super.key});

  @override
  State<ListWantToHear> createState() => _ListWantToHearState();
}

class _ListWantToHearState extends State<ListWantToHear> {
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
      children: [
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              AppLocalizations.of(context)!.maybeYouWantToHear,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff121212)),
            )),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const CollectionWantToHearScreen()))
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
          height: screenHeight * 0.2,
          child: ListView.builder(
            itemCount: listImage.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(listImage[index],
                          width: 132, height: 132, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(
                      child: Text(
                    'Music corner IU',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: colorText),
                  ))
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
