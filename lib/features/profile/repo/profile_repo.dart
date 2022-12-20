import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/features/profile/view/widget/favorite_products.dart';

import '../../../core/entities/favorite_products.dart';
import '../../../core/entities/get_product_model.dart';
import '../../../core/error/failures/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> addFavorites({
    required ProductFeatures productFeatures,
  });

    Future<Either<Failure, void>> removeFavorites({
    required FavoriteProductsModel favoriteProductsModel,
  });


    Future<Either<Failure, FavoriteProductsModel>> getFavorites({
    required FavoriteProductsModel favoriteProductsModel,
  });

}