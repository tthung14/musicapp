import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bai4/common/app_input.dart';
import 'package:bai4/common/button_widget.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
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
                        trans.personalInformation,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      AppInput(
                        label: trans.userName,
                        placeholder: 'username',
                        suffixIcon: const Icon(Icons.edit),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppInput(
                        label: trans.dateOfBirth,
                        placeholder: 'Date of birth',
                        suffixIcon: const Icon(Icons.date_range_outlined),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AppInput(
                        label: trans.address,
                        placeholder: 'address',
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
