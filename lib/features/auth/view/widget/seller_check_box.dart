import '../../../../core/_core_exports.dart';
import '../../controller/register_controller.dart';

class SellerCheckBox extends StatelessWidget {
  const SellerCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, RegisterController registerController,
          child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: registerController.isSeller,
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.all(Colors.red),
              activeColor: Colors.red,
              onChanged: (value) {
                registerController
                    .isTermsAndConditionAccept(value!);
              },
            ),
            const Text('I want to be a seller, '),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Terms ',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Text('and '),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Conditions',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}