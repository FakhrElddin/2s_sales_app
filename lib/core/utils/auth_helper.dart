import 'package:flutter/material.dart';
import 'package:twos_home_wear_app/core/cache/shared_prefs_utils.dart';
import 'package:twos_home_wear_app/core/config/app_routes.dart';
import 'package:twos_home_wear_app/core/utils/navigator_key.dart';

class AuthHelper {
  static bool _isHandlingSessionExpired = false;

  static Future<void> handleSessionExpired() async {
    if (_isHandlingSessionExpired) return;

    _isHandlingSessionExpired = true;

    await SharedPrefsUtils.removeData(key: 'session_id');

    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      AppRoutes.loginScreenRoute,
      (route) => false,
    );

    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Session expired, please login again'),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 3),
        ),
      );
    }

    // Wait 2 seconds to ignore duplicate calls, then reset for next time.
    Future.delayed(const Duration(seconds: 2), () {
      _isHandlingSessionExpired = false;
    });
  }
}
