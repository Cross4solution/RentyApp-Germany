import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/error/failures/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/data/repository/network_manager.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/entites/status_code_enums.dart';

import '../../../../core/init/injection_container.dart';
import '../../../../core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import '../auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, void>> register({
    required User userModel,
  }) async {
    try {
      final register = await sl<INetworkManager>().basePost(
        endPoint: MainEndpoints.register,
        requestBody: userModel.toMap(),
      );

      return register.fold((l) => Left(l), (data) {
        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmail(
      {required String email, required String code}) async {
    try {
      final register = await sl<INetworkManager>().basePost(
        endPoint: MainEndpoints.verifyEmail,
        requestBody: {
          'email': email,
          'code': code,
        },
      );

      return register.fold((l) {
        showCustomMessenger(CustomMessengerState.WARNING, 'content');
        return Left(l);
      }, (data) {
        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, UserModel>> login({required User user}) async {
    final register = await sl<INetworkManager>().basePost(
      endPoint: MainEndpoints.login,
      requestBody: {
        'username': user.username,
        'password': user.password,
      },
    );

    return register.fold((l) {
      return Left(l);
    }, (data) {
      final userInfo = UserModel.fromJson(data);

      return Right(userInfo);
    });
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final register = await sl<INetworkManager>().basePost(
        endPoint: MainEndpoints.logout,
      );

      return register.fold((l) => Left(l), (data) {
        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
