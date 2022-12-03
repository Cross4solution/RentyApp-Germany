import '../../_core_exports.dart';

class NullPointerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ListEmptyFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
