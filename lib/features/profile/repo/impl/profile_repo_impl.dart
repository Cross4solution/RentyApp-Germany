import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/error/failures/failure.dart';
import 'package:rent_app_germany/core/entities/get_product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/features/profile/repo/profile_repo.dart';
import 'package:rent_app_germany/features/profile/view/widget/favorite_products.dart';

import '../../../../core/entities/favorite_products.dart';
import '../../../../core/functions/show_custom_messenger.dart';
import '../../../../core/init/injection_container.dart';
import '../../../../core/utils/remote_data_source/domain/entites/main_endpoint.dart';
import '../../../../core/utils/remote_data_source/domain/repository/i_network_manager.dart';

class ProfileRepoImpl implements ProfileRepository {
  @override
  Future<Either<Failure, void>> addFavorites(
      {required ProductFeatures productFeatures}) async {
    try {
      final addFavorites = await sl<INetworkManager>().basePost(
        endPoint: MainEndpoints.addFavorites,
      );

      return addFavorites.fold((l) {
        showCustomMessenger(CustomMessengerState.ERROR, 'eklenmedi');
        return Left(l);
      }, (data) {
        if (jsonDecode(data)["error_code"] == 8025) {
          showCustomMessenger(CustomMessengerState.ERROR,
              'İlan favorilerinizde bulunmaktadır.');
        } else {
          showCustomMessenger(
              CustomMessengerState.SUCCESS, 'İlan favorlerinize eklendi');
        }

        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, FavoriteProductsModel>> getFavorites() async {
    try {
      final getFavorites = await sl<INetworkManager>().baseGet(
        endPoint: MainEndpoints.getFavorites,
      );

      return getFavorites.fold((l) {
        showCustomMessenger(CustomMessengerState.ERROR, 'eklenmedi');
        return Left(l);
      }, (data) {
        FavoriteProductsModel productsModel =
            FavoriteProductsModel.fromJson(data);

        return Right(productsModel);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorites() async {
    try {
      final addFavorites = await sl<INetworkManager>().baseDelete(
        endPoint: MainEndpoints.deleteFavorites,
      );

      return addFavorites.fold((l) {
        showCustomMessenger(CustomMessengerState.ERROR, 'hata');
        return Left(l);
      }, (data) {
        showCustomMessenger(
            CustomMessengerState.SUCCESS, 'İlan favorlerinizden kaldırıldı.');

        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
