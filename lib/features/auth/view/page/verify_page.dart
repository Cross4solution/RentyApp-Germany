import 'package:rent_app_germany/features/auth/controller/auth_controller.dart';

import '../../../../core/_core_exports.dart';
import '../../../../core/shared_widgets/app_button.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 75,
      height: 75,
      //TODO:düzeltilecek
      textStyle: const TextStyle(
          fontSize: 24,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: ColorHelper.primaryColor.withOpacity(.5)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    ScreenSize.init(context);
    return Scaffold(
      appBar: const AuthAppBar(text: 'Email verify'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer(
          builder: (context, AuthController registerController, child) {
            return Column(
             
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: ScreenSize().getHeightPercent(.1),
                ),
                 Align(
                  alignment: Alignment.topRight,
                   child: Text(
                    'Code has been sent to ${registerController.emailController.text} ', //${authController.phoneNumberController.text}
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                 ),
                 ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Please enter code. ', //${authController.phoneNumberController.text}
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: ScreenSize().getHeightPercent(.1),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Pinput(
                          defaultPinTheme: defaultPinTheme,
                          length: 6,
                          showCursor: true,
                          onChanged: (value) {
                            registerController.verifyCodeController.text =
                                value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: ScreenSize().getHeightPercent(.1)),
                const Spacer(),
                const Text('Resend code in ${45} second'),
                const SizedBox(
                  height: 16,
                ),
                AppButton.standart(
                    onTap: () {}, buttonText: 'Resend Code', isActive: false),
                const SizedBox(
                  height: 16,
                ),
                AppButton.standart(
                    onTap: () {
                       registerController.verifyEmail();
                    },
                    buttonText: 'Verify'),
              ],
            );
          },
        ),
      ),
    );
  }
}
