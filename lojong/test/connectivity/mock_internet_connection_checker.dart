import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lojong/core/helpers/connectivity_helper.dart';
import 'package:mockito/mockito.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {
  @override
  late List<AddressCheckOptions> addresses;

  @override
  Duration get checkInterval => const Duration(seconds: 10);

  @override
  Duration get checkTimeout => const Duration(seconds: 10);

  @override
  Future<InternetConnectionStatus> get connectionStatus => throw UnimplementedError();

  @override
  Future<bool> get hasConnection => throw UnimplementedError();

  @override
  bool get hasListeners => throw UnimplementedError();

  @override
  bool get isActivelyChecking => throw UnimplementedError();

  @override
  Future<AddressCheckResult> isHostReachable(AddressCheckOptions options) {
    throw UnimplementedError();
  }

  @override
  Stream<InternetConnectionStatus> get onStatusChange => throw UnimplementedError();
}

void main() {
  group('ConnectivityHelper', () {
    late MockInternetConnectionChecker mockInternetChecker;

    setUp(() {
      mockInternetChecker = MockInternetConnectionChecker();
      ConnectivityHelper.internetChecker = mockInternetChecker;
    });

    test('canCheckConnection should return false for detached state', () {
      stateVar = AppLifecycleState.detached;
      expect(ConnectivityHelper.canCheckConnection(), false);
    });

    test('canCheckConnection should return false for inactive state', () {
      stateVar = AppLifecycleState.inactive;
      expect(ConnectivityHelper.canCheckConnection(), false);
    });

    test('canCheckConnection should return false for paused state', () {
      stateVar = AppLifecycleState.paused;
      expect(ConnectivityHelper.canCheckConnection(), false);
    });

    test('canCheckConnection should return true for other states', () {
      stateVar = AppLifecycleState.resumed;
      expect(ConnectivityHelper.canCheckConnection(), true);
    });

    test('hasConnection should return true when not detached, inactive, or paused', () async {
      stateVar = AppLifecycleState.resumed;
      when(mockInternetChecker.hasConnection).thenAnswer((_) async => true);

      final result = await ConnectivityHelper.hasConnection();
      expect(result, true);
    });

    // Add more test cases for other methods as needed

    tearDown(() {
      // Clean up resources if needed
    });
  });
}
