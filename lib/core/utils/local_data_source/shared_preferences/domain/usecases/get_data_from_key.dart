import 'package:dartz/dartz.dart';

import '../../../../../_core_exports.dart';

class GetDataFromKey implements Usecase<String, SharedPreferenceKeyParams> {
  SharedPreferencesRepository repository;

  GetDataFromKey(this.repository);

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.getDataFromKey(params.key);
  }
}
