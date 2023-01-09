import 'dart:convert';

import 'package:rent_app_germany/core/error/failures/failure.dart';
import 'package:rent_app_germany/core/entities/get_product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/features/search/repo/search_repository.dart';

import '../../../../core/init/injection_container.dart';
import '../../../../core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import '../../../../core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import '../../domain/arguments/search_arguments.dart';

class SearchRepoImpl implements SearchRepository {
  @override
  Future<Either<Failure, List<ProductFeatures>>> searchProduct({
    required SearchArguments searchArguments,
    // required GetProductModel products,
  }) async {
    try {
      final getFavorites = await sl<INetworkManager>().baseGet(
        endPoint: MainEndpoints.searchProduct,
        queryParameters: searchArguments.toMap(),
      );

      return getFavorites.fold((l) {
        return Left(l);
      }, (data) {
        final x = json.decode(data);
        var result = x["products"]["data"];
      

        final listGetProduct = (result as List).map((e) {
          return ProductFeatures.fromMap(e);
        }).toList();

        return Right(listGetProduct);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
