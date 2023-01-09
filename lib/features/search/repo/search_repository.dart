import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/entities/get_product_model.dart';

import '../../../core/error/failures/failure.dart';
import '../domain/arguments/search_arguments.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<ProductFeatures>>> searchProduct({
    // required GetProductModel products,
   required SearchArguments searchArguments,
  });
}
