import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bai4/screen/login/bloc/login_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bai4/screen/login/login_screen.dart';

import '../../../common/app_input.dart';
import '../../../common/button_widget.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

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
  bool visibleNewPassword = true;
  bool visibleConfirmNewPassword = true;
  String? errorNewPassword;
  String? errorConfirmPassword;

  void _handleListener(BuildContext context, LoginState state) {
    final trans = AppLocalizations.of(context);
    if (state is ValidateNewPassword) {
      errorNewPassword = trans!.enterPassword;
    }
    if (state is ValidateConfirmNewPassword) {
      errorConfirmPassword = trans!.enterConfirmPassword;
    }
    if (state is VisibleNewPasswordState) {
      visibleNewPassword = state.visibleNewPassword;
    }
    if (state is VisibleConfirmNewPasswordState) {
      visibleConfirmNewPassword = state.visibleConfirmNewPassword;
    }
    if (state.checkNewPassword) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) => _handleListener(context, state),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Create New Password'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  SvgPicture.asset(
                    'lib/assets/images/create_password_icon.svg',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Create Your New Password',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppInput(
                    placeholder: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: visibleNewPassword,
                    errorText:
                        state.newPassword.isNotEmpty ? null : errorNewPassword,
                    onValueChange: (value) {
                      context.read<LoginBloc>().add(NewPasswordEvent(value));
                    },
                    suffixIcon: !visibleNewPassword
                        ? GestureDetector(
                            onTap: () {
                              context.read<LoginBloc>().add(
                                  VisibleNewPasswordEvent(visibleNewPassword));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 11),
                              child: SvgPicture.asset(
                                'lib/assets/images/eye.svg',
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              context.read<LoginBloc>().add(
                                  VisibleNewPasswordEvent(visibleNewPassword));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SvgPicture.asset(
                                'lib/assets/images/hide_eye.svg',
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppInput(
                    placeholder: 'Confirm password',
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: visibleConfirmNewPassword,
                    errorText: state.confirmNewPassword.isNotEmpty
                        ? null
                        : errorConfirmPassword,
                    onValueChange: (value) {
                      context
                          .read<LoginBloc>()
                          .add(ConfirmNewPasswordEvent(value));
                    },
                    suffixIcon: !visibleConfirmNewPassword
                        ? GestureDetector(
                            onTap: () {
                              context.read<LoginBloc>().add(
                                  VisibleConfirmNewPasswordEvent(
                                      visibleConfirmNewPassword));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 11),
                              child: SvgPicture.asset(
                                'lib/assets/images/eye.svg',
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              context.read<LoginBloc>().add(
                                    VisibleConfirmNewPasswordEvent(
                                        visibleConfirmNewPassword),
                                  );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SvgPicture.asset(
                                'lib/assets/images/hide_eye.svg',
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        const Text('Remember Password'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonWidget(
                    onPress: () {
                      context
                          .read<LoginBloc>()
                          .add(CheckValidNewPasswordEvent());
                    },
                    title: AppLocalizations.of(context)!.continues,
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
