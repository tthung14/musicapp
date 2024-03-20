import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../downloaded_screen/downloaded_screen.dart';
import '../favorite_screen/favorite_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile/my_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final pages = [
    const MyHomeScreen(),
    const MyFavoriteScreen(),
    const MyDownloadedScreen(),
    const MyProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        selectedItemColor: const Color(0xff0D7EF4),
        unselectedItemColor: Colors.grey.shade500,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: pageIndex == 0
                ? SvgPicture.asset(
                    'lib/assets/images/icon_home.svg',
                  )
                : SvgPicture.asset(
                    'lib/assets/images/Group.svg',
                  ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
              icon: pageIndex == 1
                  ? SvgPicture.asset(
                      'lib/assets/images/icon_heart_color.svg',
                    )
                  : SvgPicture.asset(
                      'lib/assets/images/icon_heart.svg',
                    ),
              label: AppLocalizations.of(context)!.like),
          BottomNavigationBarItem(
              icon: pageIndex == 2
                  ? SvgPicture.asset(
                      'lib/assets/images/icon_download_color.svg',
                    )
                  : SvgPicture.asset(
                      'lib/assets/images/icon_download.svg',
                    ),
              label: AppLocalizations.of(context)!.downloaded),
          BottomNavigationBarItem(
              icon: pageIndex == 3
                  ? SvgPicture.asset(
                      'lib/assets/images/icon_person_color.svg',
                    )
                  : SvgPicture.asset(
                      'lib/assets/images/icon_person.svg',
                    ),
              label: AppLocalizations.of(context)!.profile),
        ],
      ),
    );
  }
}
