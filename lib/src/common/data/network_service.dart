import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class NetworkService {
  final Dio _dio;
  final Environment _environment;

  NetworkService({required Environment environment, Dio? client})
      : _environment = environment,
        _dio = client ?? Dio() {
    if (client == null) {
      _dio.options
        ..connectTimeout = 10000
        ..baseUrl = _environment.apiUrl
        ..contentType = 'multipart/form-data';
    }
  }

  Future<Either<NetworkException, dynamic>> get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    return request(path, query: query, method: 'GET');
  }

  Future<Either<NetworkException, dynamic>> post(
    String path, {
    Map<String, dynamic>? query,
    dynamic body,
  }) async {
    return request(path, query: query, body: body, method: 'POST');
  }

  Future<Either<NetworkException, dynamic>> put(
    String path, {
    Map<String, dynamic>? query,
    dynamic body,
  }) async {
    return request(path, query: query, body: body, method: 'PUT');
  }

  Future<Either<NetworkException, dynamic>> postForm(
    String path, {
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
  }) async {
    final form = FormData.fromMap(body);
    return request(path, query: query, body: form, method: 'POST');
  }

  Future<Either<NetworkException, dynamic>> patchForm(
    String path, {
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
  }) async {
    final form = FormData.fromMap(body);
    return request(path, query: query, body: form, method: 'PATCH');
  }

  Future<Either<NetworkException, dynamic>> request(
    String path, {
    required String method,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final result = rawRequest(
      path,
      query: query,
      body: body,
      method: method,
    );
    return result.map<dynamic>((r) => r.data).run();
  }

  @protected
  TaskEither<NetworkException, Response> rawRequest(
    String path, {
    required String method,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    dynamic body,
  }) {
    final request = RequestOptions(
      path: _environment.apiUrl + path,
      method: method,
      queryParameters: query,
      headers: headers,
      data: body,
    );
    return TaskEither<NetworkException, Response>(() async {
      try {
        final response = await _dio.fetch<dynamic>(request);

        if ((response.data as Object?).isNullOrEmptyList) return const Left(NetworkException.noDataException());
        return Right(response);
      } catch (err, st) {
        final message = 'error ${err.runtimeType} in NetworkService[$method][${_environment.apiUrl + path}]';

        if (kDebugMode) log(message, error: err, stackTrace: st);

        if (err is DioError) {
          return Left(NetworkException.fromDioError(err));
        }
        return const Left(NetworkException(message: 'unknown'));
      }
    });
  }
}

class AuthenticatedNetworkService extends NetworkService {
  final int userId;
  final String token;

  AuthenticatedNetworkService({
    required this.userId,
    required this.token,
    required Environment environment,
    Dio? client,
  }) : super(environment: environment, client: client);
}
