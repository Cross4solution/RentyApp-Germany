import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/_core_exports.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository authRepository;
  final SharedPreferences? prefs;
  final SaveDataFromKey saveDataFromKey;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController verifyCodeController =
      TextEditingController(); //OTP controller

  final formGlobalKey = GlobalKey<FormState>();

  bool isSeller = false;

  AuthController({
    required this.authRepository,
    this.prefs,
    required this.saveDataFromKey,
  });

  Future<void> register() async {
    if (formGlobalKey.currentState!.validate()) {
      User userModel = User(
        name: nameController.text,
        email: emailController.text,
        isSeller: isSeller,
        password: passwordController.text,
        phoneNumber: phoneNumberController.text,
        username: usernameController.text,
      );

      await authRepository.register(userModel: userModel);

      Go.to.page(PageRoutes.verifyPage);
    }
  }

  Future<void> verifyEmail() async {
    try {
      await authRepository.verifyEmail(
          email: emailController.text, code: verifyCodeController.text);
      Go.to.page(PageRoutes.loginPage);
    } catch (e) {
      print(e.toString());
    }
  }

    Future<void> logout() async {
    try {
    final _status =  await authRepository.logout();

    _status.fold((l) {

       showCustomMessenger(CustomMessengerState.ERROR, 'Bir hata oluştu.');
      l;
    }, (data) async {
       showCustomMessenger(CustomMessengerState.ERROR, 'Çıkış yapıldı.');


       final removeDataFromKey = sl<RemoveDataFromKey>();
       await removeDataFromKey(SharedPreferenceKeyParams(key: SharedPreferencesKeys.CACHE_USER_INFO));

       Go.to.page(PageRoutes.loginPage);
    });




      Go.to.page(PageRoutes.loginPage);
    } catch (e) {
      print(e.toString());
    }
  }

  UserModel userInfo = UserModel();

  Future<void> login() async {
    try {
      final loginCheck = await authRepository.login(
          user: User(
              username: usernameController.text,
              password: passwordController.text));

      loginCheck.fold((l) => l.showErrorSnackBar(), (data) {
        userInfo = data;

        saveDataFromKey(
          SharedPreferenceKeyWithValueParams(
            key: SharedPreferencesKeys.CACHE_USER_INFO,
            value: userInfo.toJson(),
          ),
        );

        sl<UserModel>().updateUserModelData(userInfo);

        Go.to.pageAndRemoveUntil(PageRoutes.bottomNavigationPage);
        showCustomMessenger(CustomMessengerState.SUCCESS, 'Hoşgeldiniz');

        print(userInfo.accessToken);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void isTermsAndConditionAccept(bool value) {
    isSeller = value;

    notifyListeners();
  }
}
