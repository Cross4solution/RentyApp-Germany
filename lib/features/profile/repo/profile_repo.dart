import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/entities/adress_model.dart';
import 'package:rent_app_germany/features/profile/view/widget/favorite_products.dart';

import '../../../core/entities/credit_cards_model.dart';
import '../../../core/entities/favorite_products.dart';
import '../../../core/entities/get_product_model.dart';
import '../../../core/error/failures/failure.dart';

abstract class ProfileRepository {
  // FAVORITES
  Future<Either<Failure, void>> addFavorites({
    required ProductFeatures productFeatures,
  });

  Future<Either<Failure, void>> removeFavorites();

  Future<Either<Failure, FavoriteProductsModel>> getFavorites();

  // ADRESS

  Future<Either<Failure, void>> addAdress({
    required UserLocation userLocation,
  });

  Future<Either<Failure, void>> removeAdress();

  Future<Either<Failure, AdressModel>> getAdressList();

  // CREDIT CARD

  Future<Either<Failure, void>> addCreditCard({
    required CreditCardDetails creditCardDetails,
  });
}
