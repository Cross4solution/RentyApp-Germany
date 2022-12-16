enum MainEndpoints {
  register,
  verifyEmail,
  login,
  getAllProducts,
  category,
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
    }
  }
}
