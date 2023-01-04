import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/get_product_model.dart';
import 'package:rent_app_germany/core/entities/product_category.dart';
import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/features/home/controller/home_controller.dart';
import '../../../../core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import '../../../../core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import '../../domain/entities/get_product_arguments.dart';
import '../home_repository.dart';

class HomeRepoImpl implements HomeRepository {
  @override
  Future<Either<Failure, List<ProductCategoryModel>>>
      getProductCategories() async {
    try {
      final fetchProductCategory = await sl<INetworkManager>().baseGet(
        endPoint: MainEndpoints.productCategory,
      );

      return fetchProductCategory.fold((failure) => Left(failure), (data) {
        final jsonMap = json.decode(data);

        final listGetProductModel = (jsonMap as List).map((e) {
          print(e);
          return ProductCategoryModel.fromMap(e);
        }).toList();

        return Right(listGetProductModel);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, GetProductModel>> getProducts({
    required GetProductModel getProductModel,
    required GetProductArguments getProductArguments,
  }) async {
    try {
      final fetchCategory = await sl<INetworkManager>().baseGet(
        endPoint: MainEndpoints.getAllProducts,
        queryParameters: getProductArguments.toMap(),
      );

      return fetchCategory.fold((failure) => Left(failure), (data) {
        GetProductModel getProductData = GetProductModel.fromJson(data);

        // ignore: void_checks
        return Right(getProductData);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
