import '../../_core_exports.dart';

class AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  const AppStringsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      'tr',
      'de',
    ].contains(locale.languageCode);
  }

  @override
  Future<AppStrings> load(Locale locale) async {
    AppStrings appLocalization = AppStrings(locale);
    await appLocalization.loadStrings();
    return appLocalization;
  }

  @override
  bool shouldReload(LocalizationsDelegate old) {
    return true;
  }
}
