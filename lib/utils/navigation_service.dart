import 'package:flutter/material.dart';

final NavigationService navService = NavigationService();

class NavigationService<T, U> {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  BuildContext? get globalContext => navigationKey.currentContext;

  Future<T?> pushNamed(String routeName, {Object? args}) async {
    assert(navigationKey.currentState != null);
    return await navigationKey.currentState!.pushNamed<T>(
      routeName,
      arguments: args,
    );
  }

  Future<T?> push(Route<T> route) async {
    assert(navigationKey.currentState != null);
    return await navigationKey.currentState!.push<T>(route);
  }

  Future<T?> pushReplacementNamed(String routeName, {Object? args}) async {
    assert(navigationKey.currentState != null);
    return await navigationKey.currentState!.pushReplacementNamed<T, U>(
      routeName,
      arguments: args,
    );
  }

  Future<T?> pushNamedAndRemoveUntil(String nextRouteName,
      {Object? args, String rootName = ''}) async {
    assert(navigationKey.currentState != null);
    return await navigationKey.currentState!.pushNamedAndRemoveUntil<T>(
      nextRouteName,
      rootName == ''
          ? (Route<dynamic> route) => false
          : ModalRoute.withName(rootName),
      arguments: args,
    );
  }

  Future<T?> popAndPushNamed(String routeName, {Object? args}) async {
    assert(navigationKey.currentState != null);
    return await navigationKey.currentState!.popAndPushNamed<T, U>(
      routeName,
      arguments: args,
    );
  }

  Future<Object> maybePop([Object? args]) async {
    assert(navigationKey.currentState != null);
    return await navigationKey.currentState!.maybePop<Object>(args);
  }

  bool canPop() {
    assert(navigationKey.currentState != null);
    return navigationKey.currentState!.canPop();
  }

  void goBack({T? result}) {
    assert(navigationKey.currentState != null);
    return navigationKey.currentState!.pop<T>(result);
  }

  void popUtil(String routeRoot) {
    assert(navigationKey.currentState != null);
    navigationKey.currentState!.popUntil(ModalRoute.withName(routeRoot));
  }
}
