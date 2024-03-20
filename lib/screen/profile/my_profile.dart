import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bai4/screen/login/login_screen.dart';
import 'package:bai4/screen/profile/widget/change_password_screen.dart';
import 'package:bai4/screen/profile/widget/language_screen.dart';
import 'package:bai4/screen/profile/widget/notification_screen.dart';
import 'package:bai4/screen/profile/widget/profile.dart';

import '../../common/button_widget.dart';
import '../../common/list_title.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool selectOption = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.myMovieProfile),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const NotificationScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 22),
              child: Icon(Icons.notifications_none_rounded),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _bottomSheetEditImage();
              },
              child: Center(
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'lib/assets/images/Rectangle_513_2.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 8,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black45,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                        child: const Icon(
                          Icons.edit,
                          //color: Colors.white,
                        ),
                      ))
                ]),
              ),
            ),
            const Center(
              child: Text(
                'Nguyễn Thông Tiến',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectOption = !selectOption;
                      });
                    },
                    child: _widget(
                        selectOption
                            ? 'lib/assets/images/icon_heart_color.svg'
                            : 'lib/assets/images/icon_heart.svg',
                        AppLocalizations.of(context)!.favoriteSongs,
                        '40',
                        selectOption),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectOption = !selectOption;
                      });
                    },
                    child: _widget(
                        !selectOption
                            ? 'lib/assets/images/icon_download_color.svg'
                            : 'lib/assets/images/icon_download.svg',
                        AppLocalizations.of(context)!.downloaded,
                        '40',
                        !selectOption),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Column(
                  children: [
                    AppListTitle(
                      icon: SvgPicture.asset(
                        'lib/assets/images/icon_edit_person.svg',
                      ),
                      title: AppLocalizations.of(context)!.myProfile,
                      onPress: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const Profile()));
                      },
                      training: const Icon(
                        Icons.navigate_next_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppListTitle(
                      icon: SvgPicture.asset(
                        'lib/assets/images/icon_lock.svg',
                      ),
                      title: AppLocalizations.of(context)!.changePassword,
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const ChangePasswordScreen()));
                      },
                      training: const Icon(
                        Icons.navigate_next_outlined,
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Column(
                  children: [
                    AppListTitle(
                      icon: SvgPicture.asset(
                        'lib/assets/images/icon_language.svg',
                      ),
                      title: AppLocalizations.of(context)!.language,
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const LanguageScreen()));
                      },
                      training: const Icon(
                        Icons.navigate_next_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppListTitle(
                      icon: SvgPicture.asset(
                        'lib/assets/images/icon_security.svg',
                      ),
                      title: AppLocalizations.of(context)!.securityCenter,
                      onPress: () {},
                      training: const Icon(
                        Icons.navigate_next_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppListTitle(
                      icon: SvgPicture.asset(
                        'lib/assets/images/icon_help.svg',
                      ),
                      title: AppLocalizations.of(context)!.helpCenter,
                      onPress: () {},
                      training: const Icon(
                        Icons.navigate_next_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppListTitle(
                      icon: SvgPicture.asset(
                        'lib/assets/images/icon_logout.svg',
                      ),
                      title: AppLocalizations.of(context)!.signOut,
                      onPress: () {
                        _bottomSheet();
                      },
                      training: const Icon(
                        Icons.navigate_next_outlined,
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }

  _widget(String icon, String title, String total, bool selectOption) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: selectOption
                  ? const Color(0xff714CF4)
                  : const Color(0xffEEEEEE)),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            total,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }

  _bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.areYouSureSignOut,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ButtonWidget(
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const LoginScreen()));
                    },
                    title: AppLocalizations.of(context)!.yes,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ButtonWidget(
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    title: AppLocalizations.of(context)!.no,
                    colors: const [
                      Color(0xffFFFFFF),
                      Color(0xffFFFFFF),
                      Color(0xffFFFFFF),
                    ],
                    textColor: Colors.blue,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _bottomSheetEditImage() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    onPress: () {},
                    title: AppLocalizations.of(context)!.choosePhotoFromGallery,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ButtonWidget(
                    onPress: () {},
                    title: AppLocalizations.of(context)!.takeAPhoto,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ButtonWidget(
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    title: AppLocalizations.of(context)!.cancel,
                    colors: const [
                      Color(0xffFFFFFF),
                      Color(0xffFFFFFF),
                      Color(0xffFFFFFF),
                    ],
                    textColor: Colors.blue,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
