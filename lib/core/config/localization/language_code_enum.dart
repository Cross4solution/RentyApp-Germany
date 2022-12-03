// ignore: constant_identifier_names
enum LanguageCodeEnum { TR, DE }

extension LanguageCodeExtension on LanguageCodeEnum {
  String languageCodeToString() {
    switch (this) {
      case LanguageCodeEnum.TR:
        return "tr";
      case LanguageCodeEnum.DE:
        return "de";
    }
  }

  LanguageCodeEnum stringToLanguageCode(String value) {
    switch (value) {
      case "tr":
        return LanguageCodeEnum.TR;
      case "Türkçe":
        return LanguageCodeEnum.TR;
      case "de":
        return LanguageCodeEnum.DE;
      case "Dutch":
        return LanguageCodeEnum.DE;
      default:
        return LanguageCodeEnum.TR;
    }
  }
}
