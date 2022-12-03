// ignore_for_file: non_constant_identifier_names

import '../../_core_exports.dart';

class AppStrings {
  final Locale _locale;
  Map<String, String> _localizedStrings = const {};
  static const LocalizationsDelegate<AppStrings> delegate =
      AppStringsDelegate();

  AppStrings(this._locale);

  static AppStrings of() {
    return Localizations.of<AppStrings>(
            GlobalContextKey.instance.globalKey.currentContext!, AppStrings)
        as AppStrings;
  }

  Future<void> loadStrings() async {
    late String filePath = "assets/lang/${_locale.languageCode}.json";

    String jsonString = await rootBundle.loadString(filePath);

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map(
      (key, value) {
        return MapEntry(key, value.toString());
      },
    );
  }

  //! General Strings
  String? get log_in_with_google {
    return _localizedStrings['log_in_with_google'];
  }

  String? get log_in_with_apple {
    return _localizedStrings['log_in_with_apple'];
  }

  String? get log_in_with_phone_number {
    return _localizedStrings['log_in_with_phone_number'];
  }

  String? get trouble_logging_in {
    return _localizedStrings['trouble_logging_in'];
  }

  String? get my_number {
    return _localizedStrings['my_number'];
  }

  String? get my_number_permission_text {
    return _localizedStrings['my_number_permission_text'];
  }

  String? get continu {
    return _localizedStrings['continu'];
  }

  String? get my_code {
    return _localizedStrings['my_code'];
  }

  String? get code_sent_to {
    return _localizedStrings['code_sent_to'];
  }

  String? get terms_and_conditions {
    return _localizedStrings['terms_and_conditions'];
  }

  String? get resend_code_in {
    return _localizedStrings['resend_code_in'];
  }

  String? get second {
    return _localizedStrings['second'];
  }

  String? get resend_code {
    return _localizedStrings['resend_code'];
  }
    String? get verify {
    return _localizedStrings['verify'];
  }

  String? get name {
    return _localizedStrings['name'];
  }

  String? get enter_your_name {
    return _localizedStrings['enter_your_name'];
  }

  String? get birthday {
    return _localizedStrings['birthday'];
  }

  String? get enter_your_birthday {
    return _localizedStrings['enter_your_birthday'];
  }

  String? get gender {
    return _localizedStrings['gender'];
  }

  String? get choose_your_gender {
    return _localizedStrings['choose_your_gender'];
  }

  String? get male {
    return _localizedStrings['male'];
  }

  String? get show_me {
    return _localizedStrings['show_me'];
  }

  String? get female {
    return _localizedStrings['female'];
  }

  String? get everyone {
    return _localizedStrings['everyone'];
  }

  String? get choose_your_interest {
    return _localizedStrings['choose_your_interest'];
  }

  String? get choose_your_interest_subtitle {
    return _localizedStrings['choose_your_interest_subtitle'];
  }

  String? get add_photo {
    return _localizedStrings['add_photo'];
  }

  String? get gallery {
    return _localizedStrings['gallery'];
  }

  String? get camera {
    return _localizedStrings['camera'];
  }
}
