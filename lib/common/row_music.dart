import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RowMusic extends StatelessWidget {
  final String image;
  // final String nameSong;
  // final String single;
  final bool visibleHeart;
  final bool visibleIconDownload;
  const RowMusic(
      {super.key,
      this.visibleHeart = false,
      this.visibleIconDownload = true,
      required this.image});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(image,
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'You raise me up',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/icon_downloaded.svg',
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Mnado, Andrew',
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
          Row(
            children: [
              Visibility(
                visible: visibleHeart,
                child: SvgPicture.asset(
                  'lib/assets/images/icon_heart_color.svg',
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Visibility(
                visible: visibleIconDownload,
                child: SvgPicture.asset(
                  'lib/assets/images/icon_results_dot.svg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
