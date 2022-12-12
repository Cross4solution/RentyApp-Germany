enum MainEndpoints {
  register,
  verifyEmail,
  login,
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
    }
  }
}
