import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bai4/common/app_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bai4/common/button_widget.dart';

class MyContact extends StatefulWidget {
  const MyContact({super.key});

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  @override
  Widget build(BuildContext context) {
    final trans = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(trans.editProfile),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        AppLocalizations.of(context)!.myContact,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      AppInput(
                        label: trans.phoneNumber,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset(
                            'lib/assets/images/flat_vietnam.svg',
                          ),
                        ),
                        placeholder: '+84',
                        suffixIcon: const Icon(Icons.edit),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppInput(
                        label: trans.email,
                        placeholder: 'nguyenThongTien@gmail.com',
                        suffixIcon: const Icon(Icons.edit),
                      ),
                    ]),
              ),
            ),
            ButtonWidget(
              onPress: () {},
              title: AppLocalizations.of(context)!.save,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
