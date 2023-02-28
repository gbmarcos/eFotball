import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
class NetworkException with _$NetworkException implements Exception {
  const factory NetworkException({
    required String message,
    int? statusCode,
    Object? response,
    StackTrace? stackTrace,
  }) = ServerException;

  /// Usually this exception indicates that a data was null or empty
  const factory NetworkException.noDataException() = NoDataException;

  const NetworkException._();

  factory NetworkException.fromDioError(DioError error, {String? message}) {
    return NetworkException(
      statusCode: error.response?.statusCode,
      message: message ?? error.message,
      response: error.response?.data,
      stackTrace: error.stackTrace,
    );
  }

  String? get responseMessage {
    try {
      return maybeWhen(
        (message, statusCode, response, stackTrace) {
          final data = json.decode((response ?? '{}') as String) as Map?;
          final message = (data ?? <dynamic, dynamic>{})['error'] as String?;
          return message;
        },
        orElse: () => null,
      );
    } on Exception {
      return null;
    }
  }

  @override
  String toString() {
    return when(
      (message, statusCode, response, stackTrace) => 'NetworkException{statusCode: $statusCode, message: $message}',
      noDataException: () => 'NoDataException',
    );
  }
}

@freezed
class StreamsHavingNullUrlException with _$StreamsHavingNullUrlException implements Exception {
  static const message = 'There are some streams having a null value as url';

  const factory StreamsHavingNullUrlException({
    List<int>? streamIds,
  }) = StreamsException;

  const StreamsHavingNullUrlException._();

  @override
  String toString() {
    return 'StreamsHavingNullUrlException {streamIds: $streamIds}';
  }
}

void reportError(Object error, [StackTrace? stackTrace]) {
  FlutterError.reportError(
    FlutterErrorDetails(exception: error, stack: stackTrace),
  );
}

abstract class LocalStorageException implements Exception {
  final String? message;
  final StackTrace? stackTrace;

  LocalStorageException({this.message, this.stackTrace});
}

class HiveException extends LocalStorageException {
  HiveException({String? message, StackTrace? stackTrace}) : super(message: message, stackTrace: stackTrace);
}

class SharedPreferencesException extends LocalStorageException {
  SharedPreferencesException({String? message, StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}
