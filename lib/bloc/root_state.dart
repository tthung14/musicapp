part of 'root_bloc.dart';

class RootState {
  const RootState();
}

class RootStateInitial extends RootState {}

class LanguageState extends RootState {
  final String language;

  const LanguageState(this.language);
}
