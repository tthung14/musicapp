import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/colors.dart';

class CollectionVideo extends StatefulWidget {
  const CollectionVideo({super.key});

  @override
  State<CollectionVideo> createState() => _CollectionVideoState();
}

class _CollectionVideoState extends State<CollectionVideo> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Videos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.only(right: 15),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: const BoxDecoration(
                              color: Color(0xffF5F6F7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(27))),
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
                height: 16,
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'lib/assets/images/anh.png',
                      fit: BoxFit.fill,
                      width: screenWidth,
                    ),
                  ),
                  Positioned(
                    top: screenWidth * 0.3,
                    left: screenWidth * 0.45,
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
                  ),
                  const Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Made For You',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF)),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Drama Orange Country',
                          style: TextStyle(color: Color(0xffFFFFFF)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
