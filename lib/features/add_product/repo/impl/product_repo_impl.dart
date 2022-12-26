import 'package:rent_app_germany/core/entities/order_creat.dart';
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

      return register.fold((l) {
        showCustomMessenger(CustomMessengerState.ERROR, 'eklenmedi');
        return Left(l);
      }, (data) {
        showCustomMessenger(CustomMessengerState.SUCCESS, 'eklendi');
        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> orderCreat(
      {required OrderModel orderModel}) async {
    try {
      final register = await sl<INetworkManager>().basePost(
        endPoint: MainEndpoints.orderCreat,
        requestBody: orderModel.toMap(),
      );

      return register.fold((l) {
        showCustomMessenger(CustomMessengerState.ERROR,
            'Sipariş oluşturulurken bir hata ile karşılaşıldı.');
        return Left(l);
      }, (data) {
        if (jsonDecode(data)["error_code"] == 4722) {
          showCustomMessenger(CustomMessengerState.ERROR,
              'Sipariş oluşturulurken eksik bilgi girildi.');
        } else if (jsonDecode(data)["error_code"] == 500) {
          showCustomMessenger(CustomMessengerState.ERROR,
              'Amount must convert to at least 50 cents. 2.00 TL converts to approximately ');
        } else {
          showCustomMessenger(
              CustomMessengerState.SUCCESS, 'Sipariş oluşturuldu.');
        }

        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
