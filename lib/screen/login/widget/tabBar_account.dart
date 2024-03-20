import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/app_input.dart';
import '../../../common/app_text.dart';
import '../../../common/button_widget.dart';
import '../../home_screen/home_screen.dart';
import '../../tabBar_home_page/bottom_tabBar_home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/login_bloc.dart';
import '../forgot_password/select_address_contact.dart';

class TabBarAccount extends StatelessWidget {
  const TabBarAccount({super.key});

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
  bool visibleEyes = true;
  String? errorNameAccount;
  String? errorPassword;
  bool checkBoxRememberAccount = false;

  void _handleListener(BuildContext context, LoginState state) {
    final trans = AppLocalizations.of(context);
    if (state is VisiblePasswordState) {
      visibleEyes = state.visiblePassword;
    }
    if (state is ValidateNameAccountState) {
      errorNameAccount = trans?.enterNameAccount;
    }
    if (state is ValidatePasswordState) {
      errorPassword = trans?.enterPassword;
    }
    if (state.checkSignInAccount) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const HomePage()));
    }
    if (state is RememberAccountState) {
      checkBoxRememberAccount = state.rememberAccount;
    }
  }

  @override
  Widget build(BuildContext context) {
    final trans = AppLocalizations.of(context);
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) => _handleListener(context, state),
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              AppInput(
                placeholder: 'Name account',
                prefixIcon: const Icon(Icons.person),
                errorText:
                    state.nameAccount.isNotEmpty ? null : errorNameAccount,
                onValueChange: (value) {
                  context.read<LoginBloc>().add(NameAccountValueEvent(value));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AppInput(
                  placeholder: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: visibleEyes,
                  errorText:
                      state.passwordValue.isNotEmpty ? null : errorPassword,
                  onValueChange: (value) {
                    context.read<LoginBloc>().add(PasswordValueEvent(value));
                  },
                  suffixIcon: !visibleEyes
                      ? GestureDetector(
                          onTap: () {
                            context
                                .read<LoginBloc>()
                                .add(VisiblePasswordEvent(visibleEyes));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 11),
                            child: SvgPicture.asset(
                              'lib/assets/images/eye.svg',
                            ),
                          ))
                      : GestureDetector(
                          onTap: () {
                            context
                                .read<LoginBloc>()
                                .add(VisiblePasswordEvent(visibleEyes));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SvgPicture.asset(
                              'lib/assets/images/hide_eye.svg',
                            ),
                          ))),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: checkBoxRememberAccount,
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .add(RememberAccountEvent(value ?? false));
                      },
                    ),
                    Text(AppLocalizations.of(context)!.rememberPassword),
                  ],
                ),
              ),
              ButtonWidget(
                onPress: () {
                  context.read<LoginBloc>().add(CheckValidAccountEvent());
                },
                title: 'Sign In',
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
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
