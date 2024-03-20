part of 'login_bloc.dart';

class LoginEvent {
  const LoginEvent();
}

class VisiblePasswordEvent extends LoginEvent {
  final bool visibleEyes;
  const VisiblePasswordEvent(this.visibleEyes);
}

class VisibleNewPasswordEvent extends LoginEvent {
  final bool visibleNewPassword;
  const VisibleNewPasswordEvent(this.visibleNewPassword);
}

class VisibleConfirmNewPasswordEvent extends LoginEvent {
  final bool visibleConfirmNewPassword;
  const VisibleConfirmNewPasswordEvent(this.visibleConfirmNewPassword);
}

class PhoneValueEvent extends LoginEvent {
  final String phoneValue;
  const PhoneValueEvent(this.phoneValue);
}

class NameAccountValueEvent extends LoginEvent {
  final String nameAccount;
  const NameAccountValueEvent(this.nameAccount);
}

class PasswordValueEvent extends LoginEvent {
  final String passwordValue;
  const PasswordValueEvent(this.passwordValue);
}

class NewPasswordEvent extends LoginEvent {
  final String newPassword;
  const NewPasswordEvent(this.newPassword);
}

class ConfirmNewPasswordEvent extends LoginEvent {
  final String confirmNewPassword;
  const ConfirmNewPasswordEvent(this.confirmNewPassword);
}

class CheckValidPhoneEvent extends LoginEvent {}

class CheckValidAccountEvent extends LoginEvent {}

class CheckValidNewPasswordEvent extends LoginEvent {}

class RememberPhoneEvent extends LoginEvent {
  final bool rememberPhone;
  RememberPhoneEvent(this.rememberPhone);
}

class RememberAccountEvent extends LoginEvent {
  final bool rememberAccount;
  RememberAccountEvent(this.rememberAccount);
}
