import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';

import '../../../../core/_core_exports.dart';
import '../../controller/credit_card_controller.dart';

class CreditCardShowPage extends StatefulWidget {
  const CreditCardShowPage({super.key});

  @override
  State<CreditCardShowPage> createState() => _CreditCardShowPageState();
}

class _CreditCardShowPageState extends State<CreditCardShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kredi Kartlarım'),
      ),
      body: Consumer(
        builder: (context, CreditCardController creditCardController, child) {
          return Column(
            children: [
              CreditCardWidget(
                glassmorphismConfig:
                    false ? Glassmorphism.defaultConfig() : null,
                cardNumber: creditCardController.cardNumber,
                expiryDate: creditCardController.expiryDate,
                cardHolderName: creditCardController.cardHolderName,
                cvvCode: creditCardController.cvvCode,
                bankName: 'Credit Card',
                showBackView: creditCardController.isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: Colors.black,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/mastercard.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
