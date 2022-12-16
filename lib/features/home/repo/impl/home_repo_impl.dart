import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/get_product_model.dart';
import 'package:rent_app_germany/core/entities/product_category.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import '../../../../core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import '../home_repository.dart';

class HomeRepoImpl implements HomeRepository {
  @override
  Future<Either<Failure, CategoryModel>> getCategories(
      {required CategoryModel categoryModel}) async {
    try {
      final fetchCategory = await sl<INetworkManager>().baseGet(
        endPoint: MainEndpoints.category,
        queryParameters: categoryModel.toMap(),
      );

      return fetchCategory.fold((failure) => Left(failure), (data) {
        CategoryModel categoryData = CategoryModel.fromJson(data);

        // ignore: void_checks
        return Right(categoryData);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, GetProductModel>> getProducts({required GetProductModel getProductModel}) async{

    try {
      final fetchCategory = await sl<INetworkManager>().baseGet(
        endPoint: MainEndpoints.getAllProducts,
        queryParameters: getProductModel.toMap(),
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
