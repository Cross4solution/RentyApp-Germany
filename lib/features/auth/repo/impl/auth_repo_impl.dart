import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/error/failures/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/data/repository/network_manager.dart';

import '../../../../core/init/injection_container.dart';
import '../../../../core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import '../auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, void>> register({
    required UserModel userModel,
  }) async {
    try {
      final register = await sl<INetworkManager>().basePost(
        endPoint: 'api/user/register',
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
        endPoint: 'api/user/email-verify',
        requestBody: {
          'email': email,
          'code': code,
        },
      );

      return register.fold((l) => Left(l), (data) {
        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> login(
      {required String username, required String password}) async {
    try {
      final register = await sl<INetworkManager>().basePost(
        endPoint: 'api/user/login',
        requestBody: {
          'username': username,
          'password': password,
        },
      );

      return register.fold((l) => Left(l), (data) {
        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  // @override
  // Future<Either<Failure, void>> signOut() async{
  //   try {
  //     sl<NetworkManager>().basePost(endPoint: endPoint);

  //   } on Failure catch (failure) {

  //     return Left(failure);

  //   }

  // }

}
