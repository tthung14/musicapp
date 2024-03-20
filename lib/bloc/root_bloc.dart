import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/event_bus.dart';
part 'root_event.dart';
part 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  late StreamSubscription<EBLanguageChangeEvent>
      _streamSubscriptionLanguageChange;

  RootBloc() : super(RootStateInitial()) {
    _streamSubscriptionLanguageChange =
        eventBus.on<EBLanguageChangeEvent>().listen((event) {
      add(LanguageEvent(event.language));
    });
    //on<LanguageEvent>(_onChangeLanguage);
    on<LanguageEvent>(_mapLanguageChangeEvent);
  }

  @override
  Future<void> close() {
    _streamSubscriptionLanguageChange.cancel();
    return super.close();
  }

  void _mapLanguageChangeEvent(LanguageEvent event, Emitter<RootState> emit) {
    emit(LanguageState(event.language));
  }

  // void _onChangeLanguage(LanguageEvent event, Emitter<RootState> emit) {
  //   if (event.language == 'en') {
  //     emit(const LanguageState('en'));
  //     //eventBus.fire(EBLanguageChangeEvent('en'));
  //   } else {
  //     emit(const LanguageState('vi'));
  //     //eventBus.fire(EBLanguageChangeEvent('vi'));
  //   }
  // }
}
