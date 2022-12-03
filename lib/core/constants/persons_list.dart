import '../_core_exports.dart';

class PersonsList {
  static final PersonsList _instance = PersonsList._init();

  PersonsList._init();

  factory PersonsList() {
    return _instance;
  }

  final List<String> coll_1 = [
    // AssetsPath().maleOnePNG,
    // AssetsPath().maleTwoPNG,
    // AssetsPath().maleThreePNG,
    // AssetsPath().maleFourPNG,
  ];


}
