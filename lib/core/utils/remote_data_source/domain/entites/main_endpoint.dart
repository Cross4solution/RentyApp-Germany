import 'package:rent_app_germany/features/profile/controller/profile_controller.dart';

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
    }
  }
}
