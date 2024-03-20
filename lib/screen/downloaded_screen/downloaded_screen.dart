import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bai4/screen/search/search_screen.dart';

import '../../common/button_widget.dart';
import '../../common/row_music.dart';

class MyDownloadedScreen extends StatefulWidget {
  const MyDownloadedScreen({super.key});

  @override
  State<MyDownloadedScreen> createState() => _MyDownloadedScreenState();
}

class _MyDownloadedScreenState extends State<MyDownloadedScreen> {
  List<String> listImage = [
    'lib/assets/images/anh.png',
    'lib/assets/images/anh_1.png',
    'lib/assets/images/anh_2.png',
    'lib/assets/images/anh_3.png',
    'lib/assets/images/anh_4.png',
    'lib/assets/images/anh_5.png',
    'lib/assets/images/anh_2.png',
    'lib/assets/images/anh_3.png',
    'lib/assets/images/anh_3.png',
    'lib/assets/images/anh_4.png',
    'lib/assets/images/anh_5.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SearchScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  AppLocalizations.of(context)!.downloaded,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff121212)),
                ),
              ),
              const Center(
                child: Text(
                  'Music downloaded or on the device',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ButtonWidget(
                  onPress: () {},
                  title: AppLocalizations.of(context)!.randomPlay,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: Text(
                  AppLocalizations.of(context)!.songs,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                  itemCount: listImage.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
            ],
          ),
        ),
      ),
    );
  }
}
