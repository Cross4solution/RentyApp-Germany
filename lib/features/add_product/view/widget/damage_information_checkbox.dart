import '../../../../core/_core_exports.dart';
import '../../../auth/controller/auth_controller.dart';

class DamageInformationCheckbox extends StatelessWidget {
  const DamageInformationCheckbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AuthController registerController,
          child) {
        return Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: registerController.isSeller,
                  checkColor: Colors.white,
                  fillColor:
                      MaterialStateProperty.all(Colors.red),
                  activeColor: Colors.red,
                  onChanged: (value) {
                    registerController
                        .isTermsAndConditionAccept(value!);
                  },
                ),
                const Text(
                  'Hasarsız',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: registerController.isSeller,
                  checkColor: Colors.white,
                  fillColor:
                      MaterialStateProperty.all(Colors.red),
                  activeColor: Colors.red,
                  onChanged: (value) {
                    registerController
                        .isTermsAndConditionAccept(value!);
                  },
                ),
                const Text(
                  'Az hasarlı',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: registerController.isSeller,
                  checkColor: Colors.white,
                  fillColor:
                      MaterialStateProperty.all(Colors.red),
                  activeColor: Colors.red,
                  onChanged: (value) {
                    registerController
                        .isTermsAndConditionAccept(value!);
                  },
                ),
                const Text(
                  'Hasarlı',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}