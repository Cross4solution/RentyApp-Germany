import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../error/failures/failure.dart';

abstract class INetworkManager {
  final Dio dio;

  INetworkManager(this.dio);

  Future<Either<Failure, String>> baseGet({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  });
  Future<Either<Failure, String>> basePost({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? requestBody,
  });
}
