part of 'login_bloc.dart';

class LoginState {
  final String nameAccount;
  final String phoneValue;
  final String passwordValue;
  final String newPassword;
  final String confirmNewPassword;
  final bool checkSignInPhone;
  final bool checkSignInAccount;
  final bool checkNewPassword;
  final bool loading;

  LoginState({
    this.nameAccount = '',
    this.phoneValue = '',
    this.passwordValue = '',
    this.newPassword = '',
    this.confirmNewPassword = '',
    this.checkSignInPhone = false,
    this.checkSignInAccount = false,
    this.loading = false,
    this.checkNewPassword = false,
  });

  LoginState copyWith({
    String? nameAccount,
    String? phoneValue,
    String? passwordValue,
    String? newPassword,
    String? confirmNewPassword,
    bool? checkSignInPhone,
    bool? checkSignInAccount,
    bool? loading,
    bool? checkNewPassword,
  }) {
    return LoginState(
      nameAccount: nameAccount ?? this.nameAccount,
      phoneValue: phoneValue ?? this.phoneValue,
      passwordValue: passwordValue ?? this.passwordValue,
      checkSignInPhone: checkSignInPhone ?? this.checkSignInPhone,
      checkSignInAccount: checkSignInAccount ?? this.checkSignInAccount,
      loading: loading ?? this.loading,
      newPassword: newPassword ?? this.newPassword,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
      checkNewPassword: checkNewPassword ?? this.checkNewPassword,
    );
  }
}

class LoginInitialState extends LoginState {}

class VisiblePasswordState extends LoginState {
  final bool visiblePassword;
  VisiblePasswordState(this.visiblePassword);
}

class VisibleNewPasswordState extends LoginState {
  final bool visibleNewPassword;
  VisibleNewPasswordState(this.visibleNewPassword);
}

class VisibleConfirmNewPasswordState extends LoginState {
  final bool visibleConfirmNewPassword;
  VisibleConfirmNewPasswordState(this.visibleConfirmNewPassword);
}

class ValidatePasswordState extends LoginState {}

class ValidateNameAccountState extends LoginState {}

class ValidatePhoneState extends LoginState {}

class ValidateNewPassword extends LoginState {}

class ValidateConfirmNewPassword extends LoginState {}

class RememberPhoneState extends LoginState {
  final bool rememberPhone;
  RememberPhoneState(this.rememberPhone);
}

class RememberAccountState extends LoginState {
  final bool rememberAccount;
  RememberAccountState(this.rememberAccount);
}
