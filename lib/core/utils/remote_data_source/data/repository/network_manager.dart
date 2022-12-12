import 'package:dio/dio.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/entites/status_code_enums.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/repository/i_network_manager.dart';

class NetworkManager extends INetworkManager {
  NetworkManager(super.dio);

  @override
  Future<Either<Failure, String>> baseGet(
      {required MainEndpoints endPoint, Map<String, dynamic>? queryParameters}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> basePost(
      {required MainEndpoints endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? requestBody}) async {
    try {
      Response response = await dio.post(
        endPoint.path,
        queryParameters: queryParameters,
        data: jsonEncode(requestBody),
      );

      final statusCode =
          StatusCodeEnums.values.first.statusCodeToEnum(response.statusCode);

      if (statusCode.isSuccess()) {
        return Right(response.data);
      } else {
        return Left(statusCode.stateToFailure() ?? NotFoundFailure());
      }
    } catch (e) {
      return Left(NotFoundFailure());
    }
  }
}
