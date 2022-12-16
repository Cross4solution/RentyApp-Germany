import 'package:equatable/equatable.dart';

import '../../_core_exports.dart';

abstract class Failure extends Equatable {
  String? errorMessage;
  Failure([List properties = const <dynamic>[]]);
}

extension FailureExtension on Failure {
  void showErrorSnackBar() {
    switch (runtimeType) {
      case NullPointerFailure:
        showCustomMessenger(CustomMessengerState.ERROR,
            errorMessage ?? "Null Pointer Exception".hardCode());
        break;
      case ForbiddenFailure:
        showCustomMessenger(
            CustomMessengerState.ERROR, errorMessage ?? "Forbidden".hardCode());
        break;
      case UserNotFoundFailure:
        showCustomMessenger(CustomMessengerState.ERROR,
            errorMessage ?? " User Not Found".hardCode());
        break;
      case NotFoundFailure:
        showCustomMessenger(CustomMessengerState.ERROR,
            errorMessage ?? " Not Found".hardCode());
        break;
      case BadRequestFailure:
        showCustomMessenger(CustomMessengerState.ERROR,
            errorMessage ?? "bad_request_failure".hardCode());
        break;
      case UnauthorizedFailure:
        showCustomMessenger(CustomMessengerState.ERROR,
            errorMessage ?? " Unauthorized".hardCode());
        break;

      case NotAuthenticateFailure:
        showCustomMessenger(CustomMessengerState.ERROR,
            errorMessage ?? " Not authentication".hardCode());
        break;

      default:
        showCustomMessenger(CustomMessengerState.ERROR,
            errorMessage ?? " Bilinmeyen Bir Hata Oluştu".hardCode());
        break;
    }
  }
}
