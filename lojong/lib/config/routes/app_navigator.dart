import 'package:flutter/material.dart';
import 'package:lojong/config/routes/app_routes.dart';
import 'package:lojong/core/helpers/connectivity_helper.dart';

class AppNavigator {
  static String? lastRooute;

  static bool isContext() {
    return navigatorKey.currentContext != null;
  }

  static Future pushNamed(
    String route, {
    bool checkConnection = false,
  }) async {
    lastRooute = route;
    if (checkConnection) {
      if (!await ConnectivityHelper.hasConnection()) {
        return null;
      }
    }
    return Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pushNamed(route);
  }
}
