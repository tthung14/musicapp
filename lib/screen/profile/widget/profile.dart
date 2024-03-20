import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bai4/screen/profile/edit_profile/my_contact.dart';
import 'package:bai4/screen/profile/edit_profile/personal_information.dart';

import '../../../common/list_title.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.myProfile),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Center(
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
                        ),
                      ))
                ]),
              ),
              const Center(
                child: Text(
                  'Thông Tiến',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.personalInformation,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const PersonalInformationScreen()));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.edit,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: const BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Column(
                    children: [
                      AppListTitle(
                          icon: const Icon(
                            Icons.location_on_outlined,
                            size: 30,
                          ),
                          onPress: () {},
                          title: AppLocalizations.of(context)!.liveIn,
                          training: const Text(
                            'Hanoi',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      AppListTitle(
                          icon: const Icon(
                            Icons.date_range,
                            size: 30,
                          ),
                          onPress: () {},
                          title: AppLocalizations.of(context)!.dateOfBirth,
                          training: const Text(
                            '11/01/2001',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      AppListTitle(
                          icon: const Icon(
                            Icons.male,
                            size: 30,
                          ),
                          onPress: () {},
                          title: AppLocalizations.of(context)!.gender,
                          training: const Text(
                            'Male',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      AppListTitle(
                          icon: const Icon(
                            Icons.credit_card_outlined,
                            size: 30,
                          ),
                          onPress: () {},
                          title: AppLocalizations.of(context)!.idNumber,
                          training: const Text(
                            '0001**********',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )),
                    ],
                  )),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.myContact,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const MyContact()));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.edit,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: const BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Column(
                    children: [
                      AppListTitle(
                          icon: const Icon(
                            Icons.phone,
                            size: 30,
                          ),
                          onPress: () {},
                          title: AppLocalizations.of(context)!.phoneNumber,
                          training: const Text(
                            '0988888888',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      AppListTitle(
                          icon: const Icon(
                            Icons.email_outlined,
                            size: 30,
                          ),
                          onPress: () {},
                          title: 'Email',
                          training: const Text(
                            'ThongTien6969@gmail.com',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
