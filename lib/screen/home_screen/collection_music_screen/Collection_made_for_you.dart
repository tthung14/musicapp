import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CollectionMadeForYou extends StatefulWidget {
  const CollectionMadeForYou({super.key});

  @override
  State<CollectionMadeForYou> createState() => _CollectionMadeForYouState();
}

class _CollectionMadeForYouState extends State<CollectionMadeForYou> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              'lib/assets/images/icon_results_dot.svg',
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('lib/assets/images/anh.png',
                        width: screenWidth,
                        height: screenWidth * 0.6,
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: screenWidth * 0.2,
                    right: screenWidth * 0.38,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: SvgPicture.asset(
                            'lib/assets/images/stop_music.svg',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                child: Text(
                  'Made For You',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const SizedBox(
                child: Text(
                  'Drama Orange Country',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                child: Text(
                  'Recommended videos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('lib/assets/images/anh.png',
                                fit: BoxFit.cover),
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
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Mnado, Andrew',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300),
                              ),
                              Text(
                                '2 days',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300),
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
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
