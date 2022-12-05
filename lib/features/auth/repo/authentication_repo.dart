import 'package:dartz/dartz.dart';
import '../../../../core/_core_exports.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, void>> register();

  Future<Either<Failure, void>> signOut();
}
