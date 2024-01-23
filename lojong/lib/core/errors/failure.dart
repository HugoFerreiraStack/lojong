import 'dart:developer';

import 'package:dio/dio.dart';

abstract class Failure implements Exception {
  final String? message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure({String? message, DioException? dioException}) : super(message) {
    if (dioException != null) {
      log(dioException.error.toString());
    }
    if (message != null) log(message.toString());
  }
}

class AppFailure extends Failure {
  AppFailure(String? message) : super(message) {
    log(message.toString(), name: 'AppFailure');
  }
}
