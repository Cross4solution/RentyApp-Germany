import '../_core_exports.dart';

class CheckBoxModel {
  Text text;
  bool? value;
  void toggleValue() {
    if (value == null) {
      value = false;
    } else {
      value = !value!;
    }
  }

  CheckBoxModel({
    required this.text,
    required this.value,
  });
}
