import 'package:rent_app_germany/core/shared_widgets/app_text_form_field.dart';

import '../../../../core/_core_exports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      body: AppContainer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenSize().getHeightPercent(.1),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AssetsPath().logoSplashSVG,
                      height: ScreenSize().getHeightPercent(.3),
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize().getHeightPercent(.1),
                  ),
                  AppTextFormField.standart(
                    hintText: 'email',
                    prefixIcon: const Icon(
                      Icons.mail,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFormField.obscure(
                    hintText: 'password',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(

                      onTap: () {
                        Go.to.page(PageRoutes.forgotPassword);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize().getHeightPercent(.07),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorHelper.primaryColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New to Renty? ',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {

                          Go.to.page(PageRoutes.registerPage);
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: ColorHelper.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
