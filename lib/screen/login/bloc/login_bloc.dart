import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late String phoneValue;
  late String nameAccount;
  late String passwordValue;
  late String newPassword;
  late String confirmNewPassword;
  bool rememberPhone = false;
  bool rememberAccount = false;
  LoginBloc() : super(LoginInitialState()) {
    phoneValue = '';
    nameAccount = '';
    passwordValue = '';
    newPassword = '';
    confirmNewPassword = '';
    on<VisiblePasswordEvent>(_onVisiblePassword);
    on<PhoneValueEvent>(_onPhoneValue);
    on<CheckValidPhoneEvent>(_onCheckValidPhoneEvent);
    on<CheckValidAccountEvent>(_onCheckValidAccountEvent);
    on<RememberPhoneEvent>(_onRememberPhone);
    on<RememberAccountEvent>(_onRememberAccount);
    on<NameAccountValueEvent>(_onNameAccountValue);
    on<PasswordValueEvent>(_onPasswordValue);
    on<NewPasswordEvent>(_onNewPasswordEvent);
    on<ConfirmNewPasswordEvent>(_onConfirmNewPasswordEvent);
    on<CheckValidNewPasswordEvent>(_onCheckValidNewPasswordEvent);
    on<VisibleNewPasswordEvent>(_onVisibleNewPassword);
    on<VisibleConfirmNewPasswordEvent>(_onVisibleConfirmNewPassword);
  }

  void _onVisiblePassword(
      VisiblePasswordEvent event, Emitter<LoginState> emit) {
    emit(VisiblePasswordState(!event.visibleEyes));
  }

  void _onVisibleNewPassword(
      VisibleNewPasswordEvent event, Emitter<LoginState> emit) {
    emit(VisibleNewPasswordState(!event.visibleNewPassword));
  }

  void _onVisibleConfirmNewPassword(
      VisibleConfirmNewPasswordEvent event, Emitter<LoginState> emit) {
    emit(VisibleConfirmNewPasswordState(!event.visibleConfirmNewPassword));
  }

  void _onPhoneValue(PhoneValueEvent event, Emitter<LoginState> emit) {
    phoneValue = event.phoneValue;
  }

  void _onPasswordValue(PasswordValueEvent event, Emitter<LoginState> emit) {
    passwordValue = event.passwordValue;
  }

  void _onNameAccountValue(
      NameAccountValueEvent event, Emitter<LoginState> emit) {
    nameAccount = event.nameAccount;
  }

  void _onNewPasswordEvent(NewPasswordEvent event, Emitter<LoginState> emit) {
    phoneValue = event.newPassword;
  }

  void _onConfirmNewPasswordEvent(
      ConfirmNewPasswordEvent event, Emitter<LoginState> emit) {
    phoneValue = event.confirmNewPassword;
  }

  void _onCheckValidPhoneEvent(
      CheckValidPhoneEvent event, Emitter<LoginState> emit) {
    bool isValidate = true;
    if (phoneValue == '') {
      emit(ValidatePhoneState());
      isValidate = false;
    }
    if (isValidate == false) {
      return;
    }
    if (phoneValue.isNotEmpty) {
      emit(
        state.copyWith(loading: true),
      );
      //todo call api
      try {
        emit(
          state.copyWith(checkSignInPhone: true),
        );
        emit(
          state.copyWith(loading: false),
        );
      } on Exception catch (e) {
        print(e);
      }
    }
  }

  void _onCheckValidAccountEvent(
      CheckValidAccountEvent event, Emitter<LoginState> emit) {
    bool isValidate = true;
    if (passwordValue == '') {
      emit(ValidatePasswordState());
      isValidate = false;
    }
    if (nameAccount == '') {
      emit(ValidateNameAccountState());
      isValidate = false;
    }
    if (isValidate == false) {
      return;
    }
    emit(
      state.copyWith(checkSignInAccount: true),
    );
  }

  void _onCheckValidNewPasswordEvent(
      CheckValidNewPasswordEvent event, Emitter<LoginState> emit) {
    bool isValidate = true;
    if (newPassword == '') {
      emit(ValidateNewPassword());
      isValidate = false;
    }
    if (confirmNewPassword == '') {
      emit(ValidateConfirmNewPassword());
      isValidate = false;
    }
    if (isValidate == false) {
      return;
    }
    emit(
      state.copyWith(checkNewPassword: true),
    );
  }

  void _onRememberPhone(RememberPhoneEvent event, Emitter<LoginState> emit) {
    rememberPhone = !rememberPhone;
    emit(RememberPhoneState(rememberPhone));
  }

  void _onRememberAccount(
      RememberAccountEvent event, Emitter<LoginState> emit) {
    rememberAccount = !rememberAccount;
    emit(RememberAccountState(rememberAccount));
  }
}
