import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lojong/config/routes/app_routes.dart';

bool isConnected = false;
bool connectionError = false;
bool connectionPageEnable = true;
dynamic stateVar = AppLifecycleState.resumed;

class ConnectivityHelper with WidgetsBindingObserver {
  static bool canCheckConnection() {
    return stateVar != AppLifecycleState.detached &&
        stateVar != AppLifecycleState.inactive &&
        stateVar != AppLifecycleState.paused;
  }

  static void serviceCheck() {
    WidgetsBinding.instance.addObserver(ConnectivityHelper());
    check();
    internetChecker.onStatusChange.listen((event) {
      if (event == InternetConnectionStatus.disconnected) {
        isConnected = false;
      } else {
        isConnected = true;
      }
    });
  }

  static Future<bool> hasConnection() async {
    if (!canCheckConnection()) {
      return true;
    }
    return internetChecker.hasConnection;
  }

  static Future<void> check() async {
    if (!await hasConnection()) {
      connectionError = true;
      checkConnectionPage();
    }
  }

  static void checkConnectionPage() {
    if (connectionError && !connectionPageEnable && navigatorKey.currentContext != null) {
      if (!canCheckConnection()) {
        return;
      }
      connectionPageEnable = true;
    }
  }

  static InternetConnectionChecker internetChecker = InternetConnectionChecker.createInstance(
      checkTimeout: const Duration(seconds: 10), checkInterval: const Duration(seconds: 10));
}
