import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../common/app_input.dart';
import '../../../common/app_text.dart';
import '../../../common/button_widget.dart';
import '../../home_screen/home_screen.dart';
import '../../tabBar_home_page/bottom_tabBar_home_page.dart';
import '../bloc/login_bloc.dart';
import '../forgot_password/select_address_contact.dart';

class TabBarPhone extends StatelessWidget {
  const TabBarPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  String? errorPhone;
  bool checkBoxRememberPhone = false;

  void _handleListener(BuildContext context, LoginState state) {
    final trans = AppLocalizations.of(context);
    if (state.checkSignInPhone) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const HomePage()));
    }
    if (state is ValidatePhoneState) {
      errorPhone = trans?.enterPhoneNumber;
    }
    if (state is RememberPhoneState) {
      checkBoxRememberPhone = state.rememberPhone;
    }
  }

  @override
  Widget build(BuildContext context) {
    final trans = AppLocalizations.of(context);
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) => _handleListener(context, state),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              AppInput(
                placeholder: 'phone',
                prefixIcon: const Icon(Icons.phone),
                textInputType: TextInputType.phone,
                errorText: state.phoneValue.isNotEmpty ? null : errorPhone,
                onValueChange: (value) {
                  context.read<LoginBloc>().add(PhoneValueEvent(value));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: checkBoxRememberPhone,
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .add(RememberPhoneEvent(value ?? false));
                      },
                    ),
                    Text(AppLocalizations.of(context)!.rememberPassword),
                  ],
                ),
              ),
              ButtonWidget(
                onPress: () {
                  context.read<LoginBloc>().add(CheckValidPhoneEvent());
                },
                title: 'Sign In',
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const SelectAddressContact()));
                },
                child: const AppText(
                  text: 'Don\'t forget password',
                  fonSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  const Divider(
                    thickness: 1,
                    color: Color(0xffEEEEEE),
                    indent: 16,
                    endIndent: 16,
                  ),
                  Center(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        "Continue to",
                        style: TextStyle(
                            color: Color(0xff616161), fontSize: 14, height: 1),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 18),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xffEEEEEE)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/logo_apple.svg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 18),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xffEEEEEE)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/logo_google.svg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(trans!.youNoAccount,
                        style: const TextStyle(
                          color: Color(0xff9E9E9E),
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomeScreen()));
                    },
                    child: const Text("Sign In",
                        style: TextStyle(
                          color: Color(0xff121212),
                          fontWeight: FontWeight.w600,
                        )),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
