import 'package:dartz/dartz.dart';

import '../../../../../_core_exports.dart';

abstract class BaseRequestRepository {
  Future<Either<Failure, T>> fetchData<T>({
    required List<Collections> collections,
    Map<int, Map<QueryEnum, dynamic>> querys,
    List<String>? docs,
  });
}
