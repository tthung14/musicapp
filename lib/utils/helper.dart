import 'package:flutter/material.dart';
import 'package:bai4/utils/navigation_service.dart';
import 'package:loader_overlay/loader_overlay.dart';

void showLoading({BuildContext? context}) {
  if (context == null) {
    navService.globalContext?.loaderOverlay.show();
  } else {
    context.loaderOverlay.show();
  }
}

void hideLoading({BuildContext? context}) {
  if (context == null) {
    if (navService.globalContext == null) return;
    _hideLoading(context: navService.globalContext!);
  } else {
    _hideLoading(context: context);
  }
}

void _hideLoading({required BuildContext context}) {
  if (context.loaderOverlay.visible) {
    context.loaderOverlay.hide();
  }
}

String formatPhoneNumber(String? phone) {
  if (phone == null) return '';
  final encodedPhoneNumber = phone.replaceAllMapped(
    RegExp(r'(\d{3})-?(\d{4})-?(\d{0})'),
    (match) {
      return '${match[1]}-****-${match[3]}';
    },
  );
  return encodedPhoneNumber;
}

RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$');

RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,30}$');
