import 'package:dartz/dartz.dart';
import '../../../core/entities/adress_model.dart';
import '../../../core/entities/credit_cards_model.dart';
import '../../../core/entities/favorite_products.dart';
import '../../../core/entities/get_product_model.dart';
import '../../../core/entities/my_order_list_detail_model.dart';
import '../../../core/entities/my_order_list_model.dart';
import '../../../core/entities/seller_orders_model.dart';
import '../../../core/entities/user.dart';
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

  Future<Either<Failure, CreditCardsModel>> getCreditCardInfo();

  Future<Either<Failure, void>> removeCreditCard();

  //USER ORDERS

  Future<Either<Failure, MyOrderModel>> getMyOrders();

  Future<Either<Failure, MyOrderDetailsModel>> getMyOrderDetails();

  //SELLER ORDERS

  Future<Either<Failure, SellerOrdersModel>> getSellerOrdes();

  Future<Either<Failure, void>> updateSellerOrdes({
    required int status,
  });

  //UPDATE SELLER INFO

    Future<Either<Failure, void>> updateSellerInfo();
    Future<Either<Failure, User>> fetchUserInfo();
}
