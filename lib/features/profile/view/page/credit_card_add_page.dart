import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:rent_app_germany/core/entities/credit_cards_model.dart';
import 'package:rent_app_germany/core/shared_widgets/remove_focus_and_bottom_top_padding_container.dart';
import 'package:rent_app_germany/core/utils/screen_size.dart';
import 'package:rent_app_germany/features/profile/controller/credit_card_controller.dart';

import '../../../../core/_core_exports.dart';

class AddCreditCardPage extends StatefulWidget {
  const AddCreditCardPage({super.key});

  @override
  State<AddCreditCardPage> createState() => _AddCreditCardPageState();
}

class _AddCreditCardPageState extends State<AddCreditCardPage> {
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return AppContainer(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Go.to.pageAndRemoveUntil(PageRoutes.creditCardShowPage);
              },
              child: const Icon(Icons.arrow_back_ios_new)),
          title: const Text('Kart Ekle'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Consumer(
            builder:
                (context, CreditCardController creditCardController, child) {
              return Column(
                children: [
                  CreditCardWidget(
                    glassmorphismConfig:
                        useGlassMorphism ? Glassmorphism.defaultConfig() : null,
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CreditCardForm(
                            formKey: formKey,
                            obscureCvv: true,
                            obscureNumber: true,
                            cardNumber: creditCardController.cardNumber,
                            cvvCode: creditCardController.cvvCode,
                            isHolderNameVisible: true,
                            isCardNumberVisible: true,
                            isExpiryDateVisible: true,
                            cardHolderName: creditCardController.cardHolderName,
                            expiryDate: creditCardController.expiryDate,
                            themeColor: Colors.red,
                            textColor: Colors.black,
                            cardNumberDecoration: InputDecoration(
                              prefixIcon: const Icon(Icons.credit_card),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              labelText: 'Number',
                              hintText: 'XXXX XXXX XXXX XXXX',
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                            ),
                            expiryDateDecoration: InputDecoration(
                              prefixIcon: const Icon(Icons.calendar_month),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                              labelText: 'Expired Date',
                              hintText: 'XX/XX',
                            ),
                            cvvCodeDecoration: InputDecoration(
                              prefixIcon: const Icon(Icons.numbers_outlined),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                              labelText: 'CVV',
                              hintText: 'XXX',
                            ),
                            cardHolderDecoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                              labelText: 'Card Holder',
                            ),
                            onCreditCardModelChange:
                                creditCardController.onCreditCardModelChange,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              backgroundColor: Colors.red,
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                print('valid!');
                                // print(creditCardController.cardNumber
                                //     .split(" ")
                                //     .join(""));
                                // print(creditCardController.expiryDate
                                //     .substring(0, 2));
                                // print("20" +
                                //     creditCardController.expiryDate
                                //         .substring(3, 5));

                                creditCardController.addCreditCard();
                              } else {
                                print('invalid!');
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
