import 'package:dartz/dartz.dart';

import '../../../core/entities/get_product_model.dart';
import '../../../core/error/failures/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, void>> addProduct({
    required ProductFeatures productModel,
  });

}