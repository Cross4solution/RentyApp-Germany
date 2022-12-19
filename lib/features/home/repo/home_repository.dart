import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/entities/product_category.dart';
import 'package:rent_app_germany/features/home/domain/data/product_model.dart';
import '../../../../core/_core_exports.dart';
import '../../../core/entities/get_product_model.dart';
import '../domain/entities/get_product_arguments.dart';

abstract class HomeRepository {
  Future<Either<Failure, CategoryModel>> getCategories({
    required CategoryModel categoryModel,
  });


    Future<Either<Failure, GetProductModel>> getProducts({
    required GetProductModel getProductModel,
    required GetProductArguments getProductArguments,
  });
}
