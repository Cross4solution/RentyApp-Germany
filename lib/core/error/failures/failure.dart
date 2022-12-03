import 'package:equatable/equatable.dart';

import '../../_core_exports.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

extension FailureExtension on Failure {
  void showErrorSnackBar() {
    switch (runtimeType) {
      case NullPointerFailure:
        showCustomMessenger(
            CustomMessengerState.ERROR, "Null Pointer Exception".hardCode());
        break;
      case ForbiddenFailure:
        showCustomMessenger(CustomMessengerState.ERROR, "Forbidden".hardCode());
        break;
      case UserNotFoundFailure:
        showCustomMessenger(
            CustomMessengerState.ERROR, " User Not Found".hardCode());
        break;
      case NotFoundFailure:
        showCustomMessenger(
            CustomMessengerState.ERROR, " Not Found".hardCode());
        break;
      case BadRequestFailure:
        showCustomMessenger(
            CustomMessengerState.ERROR, "bad_request_failure".hardCode());
        break;
      case UnauthorizedFailure:
        showCustomMessenger(
            CustomMessengerState.ERROR, " Unauthorized".hardCode());
        break;

      case NotAuthenticateFailure:
        showCustomMessenger(
            CustomMessengerState.ERROR, " Not authentication".hardCode());
        break;

      default:
        showCustomMessenger(CustomMessengerState.ERROR,
            " Bilinmeyen Bir Hata Oluştu".hardCode());
        break;
    }
  }
}
