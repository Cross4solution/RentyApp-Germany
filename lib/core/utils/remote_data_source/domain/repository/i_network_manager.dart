import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import '../../../../error/failures/failure.dart';

abstract class INetworkManager {
  final Dio dio;

  INetworkManager(this.dio);

  Future<Either<Failure, String>> baseGet({
    required MainEndpoints endPoint,
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<Failure, String>> basePost({
    required MainEndpoints endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? requestBody,
  });

  Future<Either<Failure, String>> baseDelete({
    required MainEndpoints endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? requestBody,
  });

  Future<Either<Failure, String>> basePut({
    required MainEndpoints endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? requestBody,
  });
}
