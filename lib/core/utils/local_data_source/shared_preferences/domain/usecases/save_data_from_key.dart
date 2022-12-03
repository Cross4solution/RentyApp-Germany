import 'package:dartz/dartz.dart';

import '../../../../../_core_exports.dart';

class SaveDataFromKey implements Usecase<void, SharedPreferenceKeyWithValueParams> {
  final SharedPreferencesRepository repository;

  SaveDataFromKey(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.saveDataFromKey(params.key, params.value);
  }
}
