import 'package:rent_app_germany/core/_core_exports.dart';

class RegisterController extends ChangeNotifier {
  final AuthRepository authRepository;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController verifyCodeController =
      TextEditingController(); //OTP controller

  final formGlobalKey = GlobalKey<FormState>();

  bool isSeller = false;

  RegisterController({
    required this.authRepository,
  });

  Future<void> register() async {
    if (formGlobalKey.currentState!.validate()) {
      UserModel userModel = UserModel(
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

  Future<void> login() async {
    try {
      await authRepository.login(
          username: usernameController.text, password: passwordController.text);
      Go.to.page(PageRoutes.bottomNavigationPage);
    } catch (e) {
      print(e.toString());
    }
  }

  void isTermsAndConditionAccept(bool value) {
    isSeller = value;

    notifyListeners();
  }
}
