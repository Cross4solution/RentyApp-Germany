import 'package:rent_app_germany/core/error/failures/failure.dart';

import 'package:rent_app_germany/core/entities/get_product_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/init/injection_container.dart';
import '../../../../core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import '../../../../core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import '../product_repo.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<Either<Failure, void>> addProduct(
      {required ProductFeatures productModel}) async {
    try {
      final register = await sl<INetworkManager>().basePost(
        endPoint: MainEndpoints.addProduct,
        requestBody: productModel.toMap(),
        
      );

      return register.fold((l){
         showCustomMessenger(CustomMessengerState.ERROR, 'eklenmedi');
        return Left(l);
      } , (data) {

          showCustomMessenger(CustomMessengerState.SUCCESS, 'eklendi');
        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
