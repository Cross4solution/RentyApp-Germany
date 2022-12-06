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
          builder: (context, LoginController loginController, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: ScreenSize().getHeightPercent(.1),
                ),
                const Text(
                  'Code has been sent to 123@gmail.com ', //${authController.phoneNumberController.text}
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                            loginController.code = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: ScreenSize().getHeightPercent(.1)),
                //TODO:düzeltilecek
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Checkbox(
                //       value: authController.isChecked,
                //       checkColor: ColorHelper.white,
                //       fillColor: MaterialStateProperty.all(Colors.blue),
                //       activeColor: ColorHelper.white,
                //       onChanged: (value) {
                //         authController.isTermsAndConditionAccept(value!);
                //       },
                //     ),
                //     Text('I agree with our '),
                //     GestureDetector(
                //       onTap: () {},
                //       child: AppText(
                //         'Terms ',
                //         style: const TextStyle(
                //             color: Colors.blue, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //     AppText('and '),
                //     GestureDetector(
                //       onTap: () {},
                //       child: AppText(
                //         'Conditions',
                //         style: const TextStyle(
                //             color: Colors.blue, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                // ),
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
                      // loginController.emailVerify();
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