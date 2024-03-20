import 'package:event_bus/event_bus.dart';

final eventBus = EventBus();

class EBLanguageChangeEvent {
  final String language;

  EBLanguageChangeEvent(this.language);
}
