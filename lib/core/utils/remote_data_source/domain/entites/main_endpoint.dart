import 'package:rent_app_germany/features/profile/controller/profile_controller.dart';

import '../../../../../features/profile/controller/credit_card_controller.dart';
import '../../../../../features/profile/controller/order_controller.dart';
import '../../../../init/injection_container.dart';

enum MainEndpoints {
  register,
  verifyEmail,
  login,
  getAllProducts,
  category,
  addProduct,
  addFavorites,
  deleteFavorites,
  getFavorites,
  searchProduct,
  logout,
  getAdress,
  addAdress,
  deleteAdress,
  // editAdress,
  addCreditCard,
  showCreditCard,
  deleteCreditCard,
  orderCreat,
  myOrders,
  myOrdersDetail,
}

extension MainEndPointExtension on MainEndpoints {
  String get path {
    switch (this) {
      case MainEndpoints.register:
        return 'api/user/register';
      case MainEndpoints.verifyEmail:
        return 'api/user/email-verify';
      case MainEndpoints.login:
        return 'api/user/login';
      case MainEndpoints.logout:
        return 'api/user/logout';
      case MainEndpoints.getAllProducts:
        return 'api/product/all';
      case MainEndpoints.category:
        return 'api/service/category/top-categories';
      case MainEndpoints.addProduct:
        return 'api/userproduct/add';

      case MainEndpoints.addFavorites:
        return 'api/favorite/add/${sl<ProfileController>().addFavoriteId.toString()}';

      case MainEndpoints.deleteFavorites:
        return 'api/favorite/delete/${sl<ProfileController>().removeFavoriteId.toString()}';

      case MainEndpoints.getFavorites:
        return 'api/favorite/my-favorites/';
      case MainEndpoints.searchProduct:
        return 'api/product/search';
      case MainEndpoints.getAdress:
        return 'api/user/location';
      case MainEndpoints.addAdress:
        return 'api/user/location/add';
      case MainEndpoints.deleteAdress:
        return 'api/user/location/delete/${sl<ProfileController>().removeAdressId.toString()}';
      case MainEndpoints.addCreditCard:
        return 'api/card/add';
      case MainEndpoints.showCreditCard:
        return 'api/card/show';
      case MainEndpoints.deleteCreditCard:
        return 'api/card/delete/${sl<CreditCardController>().removeCreditCardId.toString()}';

      case MainEndpoints.orderCreat:
        return 'api/order/creat';
      case MainEndpoints.myOrders:
        return 'api/order/my-orders';
      case MainEndpoints.myOrdersDetail:
        return 'api/order/my-order/${sl<OrderController>().orderId}';
    }
  }
}
