import 'package:flutter/material.dart';

bool isConnected = false;
dynamic stateVar = AppLifecycleState.resumed;

class ConnectivityHelper with WidgetsBindingObserver {
  static bool canCheckConnection(AppLifecycleState state) {
    final statesToExclude = [AppLifecycleState.detached, AppLifecycleState.inactive, AppLifecycleState.paused];
    return !statesToExclude.contains(state);
  }
}
