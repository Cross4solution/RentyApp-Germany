import '../../../../core/_core_exports.dart';
import '../../../../core/shared_widgets/app_button.dart';
import '../../../../core/shared_widgets/app_text_form_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      appBar: const AuthAppBar(text: 'Forgot Password'),
      body: SingleChildScrollView(
        child: AppContainer(
          child: SizedBox(
            height: ScreenSize().getBodyHeight() - 55,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize().getHeightPercent(.2),),
                  SvgPicture.asset(AssetsPath().forgotPasswordSVG, height: 150),
                  const SizedBox(height: 60),
                  const Text(
                    'Enter your email address to reset your password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  AppTextFormField.standart(
                    hintText: 'Enter your email adress...',
                    prefixIcon: const Icon(
                      Icons.email,
                     
                    ),
                  ),
                  const SizedBox(height: 25),
                  AppButton.standart(
                    buttonText: 'Continue',
                    onTap: () {
                      Go.to.page(PageRoutes.loginPage);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
