part of 'root_bloc.dart';

class RootEvent {
  const RootEvent();
}

class LanguageEvent extends RootEvent {
  final String language;

  const LanguageEvent(this.language);
}
