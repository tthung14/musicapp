import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bai4/screen/tabBar_home_page/bottom_tabBar_home_page.dart';

import 'bloc/root_bloc.dart';
import 'common/loading_widget.dart';
import 'di/injection.dart';
import 'l10n/l10n.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.black.withOpacity(0.8)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.transparent
    ..textColor = Colors.transparent
    ..indicatorColor = Colors.transparent
    ..indicatorSize = 120
    ..boxShadow = const [BoxShadow(color: Colors.transparent)]
    ..contentPadding = EdgeInsets.zero
    ..radius = 120 / 2
    ..indicatorWidget = const LoadingWidget();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootBloc>(
      create: (_) => RootBloc(),
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
  String language = 'en';

  void _handleListener(BuildContext context, RootState state) {
    if (state is LanguageState) {
      language = state.language;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RootBloc, RootState>(
        listener: (context, state) => _handleListener(context, state),
        builder: (context, state) {
          return MaterialApp(
            title: 'K-Music',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            supportedLocales: L10n.all,
            locale: Locale(language),
            localizationsDelegates: const [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const HomePage(),
            builder: EasyLoading.init(),
          );
        });
  }
}
