import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bai4/screen/login/forgot_password/verify_code_screen.dart';
import '../../../common/button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectAddressContact extends StatefulWidget {
  const SelectAddressContact({super.key});

  @override
  State<SelectAddressContact> createState() => _SelectAddressContactState();
}

class _SelectAddressContactState extends State<SelectAddressContact> {
  bool selectOption = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SvgPicture.asset(
                  'lib/assets/images/Frame.svg',
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              const SizedBox(
                child: Text(
                  'Select which contact details should we use to reset your password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectOption = !selectOption;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: selectOption ? 2 : 1,
                          color: selectOption
                              ? const Color(0xff714CF4)
                              : const Color(0xffEEEEEE)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: _widget('lib/assets/images/message.svg',
                      '+1 111 ******99', 'SMS: ', selectOption),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectOption = !selectOption;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: !selectOption ? 2 : 1,
                          color: !selectOption
                              ? const Color(0xff714CF4)
                              : const Color(0xffEEEEEE)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: _widget('lib/assets/images/email.svg',
                      'and***ley@yourdomain.com', 'Email: ', selectOption),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonWidget(
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const VerifyCodeScreen()));
                },
                title: AppLocalizations.of(context)!.continues,
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _widget(String icon, String contact, String title, bool selectOption) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: SvgPicture.asset(icon),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                contact,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              )
            ],
          ),
        )
      ],
    );
  }
}
