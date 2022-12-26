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
  void initState() {
    sl<CreditCardController>().getCreditCardInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kredi Kartlarım'),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, CreditCardController creditCardController, child) {
          return creditCardController.creditCardList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      const Text(
                        'Kredi kartınız bulunmamaktadır.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Lütfen kredi kartı ekleyiniz.',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700),
                      ),
                     const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Go.to.page(PageRoutes.addCreditCardPage);
                        },
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade400, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 48,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: creditCardController.creditCardList.length,
                        itemBuilder: (context, index) {
                          final creditCardList =
                              creditCardController.creditCardList[index];
                          return Stack(
                            children: [
                              CreditCardWidget(
                                glassmorphismConfig: false
                                    ? Glassmorphism.defaultConfig()
                                    : null,
                                cardNumber:
                                    "0000 0000 00000${creditCardList.cardLast4}",
                                expiryDate: creditCardController.expiryDate,
                                cardHolderName: creditCardList.cardName!,
                                cvvCode: creditCardController.cvvCode,
                                bankName: "${index + 1}" +
                                    " - ${creditCardList.cardBrand}",
                                showBackView: creditCardController.isCvvFocused,
                                obscureCardNumber: true,
                                obscureCardCvv: true,
                                isHolderNameVisible: true,
                                cardBgColor: Colors.black,
                                isSwipeGestureEnabled: true,
                                onCreditCardWidgetChange:
                                    (CreditCardBrand creditCardBrand) {},
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
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: InkWell(
                                  onTap: () {
                                    creditCardController.removeCreditCardId =
                                        creditCardList.id!;

                                    creditCardController
                                        .removeCreditCard(index);
                                  },
                                  child: Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey.shade400)),
                                    child: const Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Go.to.page(PageRoutes.addCreditCardPage);
                        },
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade400, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 48,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
