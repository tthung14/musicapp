import 'package:injectable/injectable.dart';

import '../networking/api_provider.dart';

@module
abstract class AppModule {
  @singleton
  ApiProvider get apiProvider => ApiProvider();
}
