import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/entities/order_creat.dart';

import '../../../core/entities/get_product_model.dart';
import '../../../core/error/failures/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, void>> addProduct({
    required ProductFeatures productModel,
  });



    Future<Either<Failure, void>> orderCreat({
  required  OrderModel orderModel
  });

}