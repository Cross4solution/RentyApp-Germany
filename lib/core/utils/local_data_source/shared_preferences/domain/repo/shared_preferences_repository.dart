import 'package:dartz/dartz.dart';

import '../../../../../_core_exports.dart';

abstract class SharedPreferencesRepository {
  Future<Either<Failure, String>> getDataFromKey(SharedPreferencesKeys key);
  Future<Either<Failure, void>> removeDataFromKey(SharedPreferencesKeys key);
  Future<Either<Failure, void>> saveDataFromKey(SharedPreferencesKeys key, String data);
}
