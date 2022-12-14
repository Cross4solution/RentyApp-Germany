import 'package:dio/dio.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/entites/status_code_enums.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import 'package:rent_app_germany/features/home/controller/home_controller.dart';

import '../../../../entities/product_category.dart';

class NetworkManager extends INetworkManager {
  NetworkManager(super.dio);

  @override
  Future<Either<Failure, String>> baseGet(
      {required MainEndpoints endPoint,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await dio.get(
        endPoint.path,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Authorization":
                // "Bearer 49|UKafgNkDt1RR77Iy1ClShvo5uYfxEhyrFa8C4ty5y9nX1DTPvf0GVYWIMHcs11L3p0yQIHyz6oevSVGaDWuUWDMQt3z7h8O3tgtM7KLzNitrFXUXEGMSbn46imi18vMy"
                "Bearer ${sl<UserModel>().accessToken}"
          },
        ),
      );

      final statusCode =
          StatusCodeEnumsExtension.statusCodeToEnum(response.statusCode);



      if (statusCode.isSuccess()) {
 
        return Right(response.data);
      } else {
        return Left(statusCode.stateToFailure() ?? NotFoundFailure());
      }
    } catch (e) {
      return Left(NotFoundFailure());
    }
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
        options: Options(
          headers: {"Authorization": "Bearer ${sl<UserModel>().accessToken}"},
        ),
      );

      // final statusCode =
      //     StatusCodeEnumsExtension.statusCodeToEnum(response.statusCode);

      // if (statusCode.isSuccess()) {
        return Right(response.data);
      // } else {
      //   Failure result = statusCode.stateToFailure() ?? NotFoundFailure();

      //   // if (statusCode == StatusCodeEnums.StatusCode401) {
      //   //   result.errorMessage = 'Girdi??iniz bigiler hatal??d??r';
      //   // }

      //   // if (statusCode == StatusCodeEnums.StatusCode200) {
      //   //   showCustomMessenger(CustomMessengerState.SUCCESS, 'content');
      //   // }
      //   return Left(result);
      // }
    } catch (e) {
      return Left(NotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, String>> baseDelete(
      {required MainEndpoints endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? requestBody}) async {
    try {
      Response response = await dio.delete(
        endPoint.path,
        queryParameters: queryParameters,
        options: Options(
          headers: {"Authorization": "Bearer ${sl<UserModel>().accessToken}"},
        ),
      );

      final statusCode =
          StatusCodeEnumsExtension.statusCodeToEnum(response.statusCode);

      if (statusCode.isSuccess()) {
        return Right(response.data);
      } else {
        return Left(statusCode.stateToFailure() ?? NotFoundFailure());
      }
    } catch (e) {
      return Left(NotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, String>> basePut(
      {required MainEndpoints endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? requestBody}) async {
    try {
      Response response = await dio.put(
        endPoint.path,
        queryParameters: queryParameters,
        options: Options(
          headers: {"Authorization": "Bearer ${sl<UserModel>().accessToken}"},
        ),
      );

      final statusCode =
          StatusCodeEnumsExtension.statusCodeToEnum(response.statusCode);

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
