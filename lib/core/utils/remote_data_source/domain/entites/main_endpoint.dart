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
      case MainEndpoints.getAllProducts:
        return 'api/product/all';
      case MainEndpoints.category:
        return 'api/service/category/top-categories';
      case MainEndpoints.addProduct:
        return 'api/userproduct/add';

      case MainEndpoints.addFavorites:
        return 'api/favorite/add/${sl<ProfileController>().addId.toString()}';

      case MainEndpoints.deleteFavorites:
        return 'api/favorite/delete/${sl<ProfileController>().removeId.toString()}';

      case MainEndpoints.getFavorites:
        return 'api/favorite/my-favorites/';
      case MainEndpoints.searchProduct:
        return 'api/product/search';
    }
  }
}
