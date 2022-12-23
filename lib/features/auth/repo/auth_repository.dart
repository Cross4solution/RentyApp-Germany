import 'package:dartz/dartz.dart';
import '../../../../core/_core_exports.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> register({
    required User userModel,
  });

  Future<Either<Failure, void>> verifyEmail({
    required String email,
    required String code,
  });
  
    Future<Either<Failure, UserModel>> login({
    required User user,
  });

  Future<Either<Failure, void>> logout();
}
