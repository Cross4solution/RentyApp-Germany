import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';

import '../../../../core/_core_exports.dart';
import '../../../auth/controller/auth_controller.dart';

class DamageInformationCheckbox extends StatelessWidget {
  const DamageInformationCheckbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ProductController productController, child) {
        return Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: productController.damageOne,
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(Colors.red),
                  activeColor: Colors.red,
                  onChanged: (value) {
                    productController.damageOneCheckbox(value!);
                  },
                ),
                const Text(
                  'Hasarsız',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: productController.damageTwo,
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(Colors.red),
                  activeColor: Colors.red,
                  onChanged: (value) {
                    productController.damageTwoCheckbox(value!);
                  },
                ),
                const Text(
                  'Az hasarlı',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: productController.damageThree,
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(Colors.red),
                  activeColor: Colors.red,
                  onChanged: (value) {
                    productController.damageThreeCheckbox(value!);
                  },
                ),
                const Text(
                  'Hasarlı',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
