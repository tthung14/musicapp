import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/app_text.dart';
import '../../../common/row_music.dart';

class DetailSongs extends StatefulWidget {
  const DetailSongs({super.key});

  @override
  State<DetailSongs> createState() => _DetailSongsState();
}

class _DetailSongsState extends State<DetailSongs> {
  bool isPlaying = false;
  double value = 0;
  final player = AudioPlayer();
  Duration? duration = Duration(seconds: 0);

  void initPlayer() async {
    await player.setSource(AssetSource("music.mp3"));
    duration = await player.getDuration();
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
              onTap: () {
                _bottomSheet();
              },
              child: SvgPicture.asset(
                'lib/assets/images/icon_results_dot.svg',
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('lib/assets/images/image_music.png',
                          width: screenWidth, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: SvgPicture.asset(
                              'lib/assets/images/play_icon.svg',
                            )),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.ios_share_outlined,
                      color: Color(0xff9E9E9E),
                    ),
                    Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.madeForYou,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff121212)),
                        ),
                        const Text(
                          'Music downloaded',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'lib/assets/images/icon_heart_color.svg',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // Container(
              //   child: Slider(
              //     value: 0.5,
              //     onChanged: (double value) {},
              //   ),
              // ),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [Text('0.16'), Text('4.15')],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${(value / 60).floor()} : ${(value % 60).floor()}",
                    style: const TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: screenWidth - 140,
                    child: Slider.adaptive(
                      onChanged: (v) {
                        value = v;
                      },
                      value: value,
                      min: 0.0,
                      //max: duration!.inSeconds.toDouble(),
                      max: 214,
                      onChangeEnd: (newValue) async {
                        setState(() {
                          value = newValue;
                        });
                        player.pause();
                        await player.seek(Duration(seconds: newValue.toInt()));
                        await player.resume();
                      },
                      activeColor: const Color(0xff714CF4),
                    ),
                  ),
                  Text(
                    "${duration!.inMinutes} : ${duration!.inSeconds % 60}",
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'lib/assets/images/shuffling.svg',
                  ),
                  SvgPicture.asset(
                    'lib/assets/images/back_music.svg',
                  ),
                  InkWell(
                    onTap: () async {
                      if (isPlaying) {
                        await player.pause();
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        await player.resume();
                        setState(() {
                          isPlaying = true;
                        });
                        player.onPositionChanged.listen((position) {
                          setState(() {
                            value = position.inSeconds.toDouble();
                          });
                        });
                      }
                    },
                    child: isPlaying
                        ? const Icon(Icons.pause)
                        : SvgPicture.asset(
                            'lib/assets/images/stop_music.svg',
                          ),
                  ),
                  SvgPicture.asset(
                    'lib/assets/images/next_music.svg',
                  ),
                  SvgPicture.asset(
                    'lib/assets/images/only_repeat.svg',
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    AppLocalizations.of(context)!.playLists,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff121212)),
                  )),
                  GestureDetector(
                    onTap: () => {},
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
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          RowMusic(
                            image: listImage[index],
                          ),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      );
                    }),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  _bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          final screenWidth = MediaQuery.of(context).size.width;
          return SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('lib/assets/images/anh.png',
                                  width: screenWidth * 0.2,
                                  height: screenWidth * 0.2,
                                  fit: BoxFit.cover),
                            ),
                            Positioned(
                              left: 30,
                              top: 30,
                              child: Center(
                                child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: SvgPicture.asset(
                                      'lib/assets/images/play_icon.svg',
                                    )),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'You raise me up',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Mnado, Andrew',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                    const Icon(
                      Icons.ios_share_rounded,
                      color: Colors.grey,
                    )
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                _rowWidget('Downloaded', 'lib/assets/images/downloaded.svg'),
                const SizedBox(
                  height: 16,
                ),
                _rowWidget('Add Favorite', 'lib/assets/images/icon_heart.svg'),
                const SizedBox(
                  height: 16,
                ),
                _rowWidget('Block', 'lib/assets/images/downloaded.svg'),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ));
        });
  }

  _rowWidget(String text, String icon) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(text)
      ],
    );
  }
}
