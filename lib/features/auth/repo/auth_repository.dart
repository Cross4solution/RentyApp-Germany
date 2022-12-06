import 'package:dartz/dartz.dart';
import '../../../../core/_core_exports.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> register({
    required UserModel userModel,
  });

  Future<Either<Failure, void>> verifyEmail({
    required String email,
    required String code,
  });
  
    Future<Either<Failure, void>> login({
    required String username,
    required String password,
  });

  // Future<Either<Failure, void>> signOut();
}
