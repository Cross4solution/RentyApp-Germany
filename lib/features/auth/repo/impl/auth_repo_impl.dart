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
  Future<Either<Failure, void>> verifyEmail({
    required String email,
  }) async {
    try {
      final register = await sl<INetworkManager>().basePost(
        endPoint: MainEndpoints.verifyEmail,
        requestBody: {
          "email": email,
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
      if (jsonDecode(data)["error_code"] == 1020) {
        showCustomMessenger(CustomMessengerState.ERROR,
            'Email adresiniz do??rulanmad?????? i??in giri?? yapam??yorsunuz. L??tfen mail adresinizi kontrol ediniz.');
      }

      if (jsonDecode(data)["error_code"] == 1010) {
        showCustomMessenger(
            CustomMessengerState.ERROR, 'Giri?? bilgileriniz hatal??d??r');
      }
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

  @override
  Future<Either<Failure, void>> sendResetPassword(
      {required String email}) async {
    {
      try {
        final register = await sl<INetworkManager>().basePost(
          endPoint: MainEndpoints.sendResetPassword,
          requestBody: {
            "email": email,
          },
        );

        return register.fold((l) {
          showCustomMessenger(CustomMessengerState.WARNING, 'content');
          return Left(l);
        }, (data) {
          if (jsonDecode(data)["error_code"] == 1030) {
            showCustomMessenger(
                CustomMessengerState.ERROR, 'Girilen email adresi hatal??d??r.');
          }
          if (jsonDecode(data)["error_code"] == 0) {
            showCustomMessenger(CustomMessengerState.SUCCESS,
                'Emial adresinize ??ifre yenileme ba??lant??s?? g??nderilmi??tir.');
          }
          return const Right(null);
        });
      } on Failure catch (failure) {
        return Left(failure);
      }
    }
  }
}
