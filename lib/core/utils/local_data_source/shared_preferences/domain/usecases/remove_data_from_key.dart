import 'package:dartz/dartz.dart';

import '../../../../../_core_exports.dart';

class RemoveDataFromKey implements Usecase<void, SharedPreferenceKeyParams> {
  final SharedPreferencesRepository repository;

  RemoveDataFromKey(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.removeDataFromKey(params.key);
  }
}
