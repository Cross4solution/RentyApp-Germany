import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/adress_model.dart';
import 'package:rent_app_germany/core/entities/credit_cards_model.dart';
import 'package:rent_app_germany/core/entities/my_order_list_detail_model.dart';
import 'package:rent_app_germany/core/entities/my_order_list_model.dart';
import 'package:rent_app_germany/core/entities/seller_orders_model.dart';
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

  @override
  Future<Either<Failure, AdressModel>> getAdressList() async {
    try {
      final getAdress = await sl<INetworkManager>().baseGet(
        endPoint: MainEndpoints.getAdress,
      );

      return getAdress.fold((l) {
        return Left(l);
      }, (data) {
        AdressModel adressModel = AdressModel.fromJson(data);

        return Right(adressModel);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> addAdress(
      {required UserLocation userLocation}) async {
    try {
      final addFavorites = await sl<INetworkManager>().basePost(
        endPoint: MainEndpoints.addAdress,
        requestBody: userLocation.toMap(),
      );

      return addFavorites.fold((l) {
        showCustomMessenger(
            CustomMessengerState.ERROR, 'Adres eklenirken bir sorun oluştu.');
        return Left(l);
      }, (data) {
        if (jsonDecode(data)["error_code"] == 0) {
          showCustomMessenger(
              CustomMessengerState.SUCCESS, 'Adres başarıyla eklendi.');
        }

        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> removeAdress() async {
    try {
      final addFavorites = await sl<INetworkManager>().baseDelete(
        endPoint: MainEndpoints.deleteAdress,
      );

      return addFavorites.fold((l) {
        showCustomMessenger(CustomMessengerState.ERROR, 'hata');
        return Left(l);
      }, (data) {
        showCustomMessenger(CustomMessengerState.SUCCESS, 'Adres kaldırıldı.');

        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> addCreditCard(
      {required CreditCardDetails creditCardDetails}) async {
    {
      try {
        final addCreditCard = await sl<INetworkManager>().basePost(
          endPoint: MainEndpoints.addCreditCard,
          requestBody: creditCardDetails.toMap(),
        );

        return addCreditCard.fold((l) {
          showCustomMessenger(CustomMessengerState.ERROR,
              'Kredi kartı eklenirken bir hata oluştu.');
          return Left(l);
        }, (data) {
          if (jsonDecode(data)["error_code"] == 422) {
            showCustomMessenger(CustomMessengerState.ERROR,
                '3 taneden daha fazla kart ekleyemezsiniz.');
          }
          if (jsonDecode(data)["error_code"] == 0) {
            showCustomMessenger(
                CustomMessengerState.SUCCESS, 'Kredi kartı başarıyla eklendi.');
          }

          return const Right(null);
        });
      } on Failure catch (failure) {
        return Left(failure);
      }
    }
  }

  @override
  Future<Either<Failure, CreditCardsModel>> getCreditCardInfo() async {
    {
      try {
        final getCreditCardInfo = await sl<INetworkManager>().baseGet(
          endPoint: MainEndpoints.showCreditCard,
        );

        return getCreditCardInfo.fold((l) {
          return Left(l);
        }, (data) {
          CreditCardsModel creditCardsModel = CreditCardsModel.fromJson(data);

          return Right(creditCardsModel);
        });
      } on Failure catch (failure) {
        return Left(failure);
      }
    }
  }

  @override
  Future<Either<Failure, void>> removeCreditCard() async {
    try {
      final removeCreditCard = await sl<INetworkManager>().baseDelete(
        endPoint: MainEndpoints.deleteCreditCard,
      );

      return removeCreditCard.fold((l) {
        showCustomMessenger(CustomMessengerState.ERROR, 'hata');
        return Left(l);
      }, (data) {
        showCustomMessenger(
            CustomMessengerState.SUCCESS, 'Kredi kartı kaldırıldı.');

        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, MyOrderModel>> getMyOrders() async {
    {
      try {
        final getOrderInfo = await sl<INetworkManager>().baseGet(
          endPoint: MainEndpoints.myOrders,
        );

        return getOrderInfo.fold((l) {
          return Left(l);
        }, (data) {
          MyOrderModel myOrderModel = MyOrderModel.fromJson(data);

          return Right(myOrderModel);
        });
      } on Failure catch (failure) {
        return Left(failure);
      }
    }
  }

  @override
  Future<Either<Failure, MyOrderDetailsModel>> getMyOrderDetails() async {
    {
      try {
        final getOrderDetailsInfo = await sl<INetworkManager>().baseGet(
          endPoint: MainEndpoints.myOrdersDetail,
        );

        return getOrderDetailsInfo.fold((l) {
          return Left(l);
        }, (data) {
          MyOrderDetailsModel myOrderDetailsModel =
              MyOrderDetailsModel.fromJson(data);

          return Right(myOrderDetailsModel);
        });
      } on Failure catch (failure) {
        return Left(failure);
      }
    }
  }

  @override
  Future<Either<Failure, SellerOrdersModel>> getSellerOrdes() async {
    {
      try {
        final getSellerOrdersInfo = await sl<INetworkManager>().baseGet(
          endPoint: MainEndpoints.sellerOrders,
        );

        return getSellerOrdersInfo.fold((l) {
          return Left(l);
        }, (data) {
          SellerOrdersModel sellerOrdersModel =
              SellerOrdersModel.fromJson(data);

          return Right(sellerOrdersModel);
        });
      } on Failure catch (failure) {
        return Left(failure);
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateSellerOrdes({required int status}) async {
    try {
      final updateSellerOrder = await sl<INetworkManager>()
          .basePost(endPoint: MainEndpoints.sellerOrdersUpdate, requestBody: {
        "status": status,
      });

      return updateSellerOrder.fold((l) {
        showCustomMessenger(CustomMessengerState.ERROR, 'Hata');
        return Left(l);
      }, (data) {
        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> updateSellerInfo() async {
    try {
      final updateSellerOrder = await sl<INetworkManager>().basePut(
        endPoint: MainEndpoints.putSellerInfo,
      );

      return updateSellerOrder.fold((l) {
        showCustomMessenger(CustomMessengerState.ERROR, 'Hata');
        return Left(l);
      }, (data) {
        if (jsonDecode(data)["error_code"] == 1) {
          showCustomMessenger(
              CustomMessengerState.ERROR, 'Siz zaten satıcısınız.');
        }

        if (jsonDecode(data)["error_code"] == 0) {
          showCustomMessenger(CustomMessengerState.SUCCESS,
              'Satıcı olma işlemleriniz başarıyla tamamlandı.');
        }

        return const Right(null);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, User>> fetchUserInfo() async {
    try {
      final fetchUser = await sl<INetworkManager>().baseGet(
        endPoint: MainEndpoints.fetchUserInfo,
      );

      return fetchUser.fold((l) {
        showCustomMessenger(CustomMessengerState.ERROR, 'hata');
        return Left(l);
      }, (data) {
        User userInfo = User.fromJson(data);

        return Right(userInfo);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
